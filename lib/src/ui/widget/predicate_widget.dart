import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../permission/permission.dart';

class PredicateWidget extends StatefulWidget {
  final Predicate predicate;
  final ValueWidgetBuilder<PredicateStatus> childBuilder;

  const PredicateWidget({Key? key, required this.predicate, required this.childBuilder}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PredicateState();

  static void refresh(BuildContext context) {
    context.findAncestorStateOfType<_PredicateState>()?.controller.refresh();
  }
}

class _PredicateState extends State<PredicateWidget> {
  late final _PredicateController controller;

  @override
  void initState() {
    super.initState();
    controller = _PredicateController(context, widget.predicate);
    controller.refresh();
  }

  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: controller,
        child: Consumer<_PredicateController>(
          builder: (context, notifier, child) => widget.childBuilder(context, notifier.status, child),
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _PredicateController extends ChangeNotifier {
  final BuildContext context;
  final Predicate predicate;
  PredicateStatus _status;

  _PredicateController(this.context, this.predicate) : _status = PredicateStatus.initial;

  PredicateStatus get status => _status;

  set status(PredicateStatus value) {
    _status = value;
    notifyListeners();
  }

  Future<void> refresh() async {
    status = PredicateStatus.testing;
    await predicate
        .test(context)
        .then((value) => value ? status = PredicateStatus.test_success : status = PredicateStatus.test_fail)
        .catchError((e) => status = PredicateStatus.test_fail);
  }
}

enum PredicateStatus { initial, testing, test_fail, test_success }

abstract class Predicate {
  Future<bool> test(BuildContext context);
}

class PredicateImpl extends Predicate {
  final Function _function;

  PredicateImpl(Future<bool> test(BuildContext context)) : _function = test;

  @override
  Future<bool> test(BuildContext context) => _function(context);
}

class CompositePredicate extends PredicateImpl {
  CompositePredicate.any(Iterable<Predicate> predicates)
      : super((context) async {
          for (Predicate predicate in predicates) {
            if (await predicate.test(context)) {
              return true;
            }
          }
          return false;
        });

  CompositePredicate.every(Iterable<Predicate> predicates)
      : super((context) async {
          for (Predicate predicate in predicates) {
            if (!await predicate.test(context)) {
              return false;
            }
          }
          return true;
        });
}

class PermissionPredicate extends Predicate {
  final Iterable<Permission> permissions;
  final bool gotoAppSettings;

  PermissionPredicate(this.permissions, {this.gotoAppSettings = true});

  @override
  Future<bool> test(BuildContext context) => PermissionSupport.requestPermissions(context, permissions, gotoAppSettings: gotoAppSettings);
}
