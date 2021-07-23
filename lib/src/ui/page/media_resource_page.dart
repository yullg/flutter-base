import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../../bean/resource.dart';
import '../widget/media_resource_widget.dart';

class MediaResourcePage extends StatefulWidget {
  final List<Resource> resources;
  final int initialIndex;
  final bool deletable;
  final String? title;

  MediaResourcePage(this.resources, {Key? key, this.initialIndex = 0, this.deletable = false, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MediaResourcePageState();
}

class MediaResourcePageState extends State<MediaResourcePage> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: widget.title != null
            ? Text(widget.title!)
            : ChangeNotifierProvider.value(
                value: pageController,
                child: Consumer<PageController>(
                  builder: (_, notifier, child) => Text("${currentIndex() + 1} / ${widget.resources.length}"),
                ),
              ),
        actions: [
          if (widget.deletable)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                int index = currentIndex();
                if (index < widget.resources.length) {
                  widget.resources.removeAt(index);
                  if (widget.resources.isEmpty) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      pageController.jumpToPage(index > 0 ? index - 1 : 0);
                    });
                  }
                }
              },
            ),
        ],
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: widget.resources.length,
        itemBuilder: (_, index) {
          var resource = widget.resources[index];
          if (ResourceType.image == resource.type) {
            return PhotoViewGestureDetectorScope(
              axis: Axis.horizontal,
              child: MediaResourceWidget(resource),
            );
          } else {
            return MediaResourceWidget(resource);
          }
        },
      ),
    );
  }

  int currentIndex() {
    int? result;
    try {
      result = pageController.page?.round();
    } catch (e) {}
    return result ?? pageController.initialPage;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
