import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String? title;
  final String? initialUrl;

  WebViewPage({Key? key, this.title, this.initialUrl}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late _PageLoadProgressValueNotifier pageLoadProgressValueNotifier;

  @override
  void initState() {
    super.initState();
    pageLoadProgressValueNotifier = _PageLoadProgressValueNotifier(null);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: pageLoadProgressValueNotifier,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: widget.title == null ? null : Text(widget.title!),
        ),
        body: Column(
          children: [
            Consumer<_PageLoadProgressValueNotifier>(
              builder: (context, notifier, child) {
                double? progress = notifier.value;
                if (progress == null) {
                  return SizedBox.shrink();
                } else {
                  return LinearProgressIndicator(value: progress);
                }
              },
            ),
            Expanded(
              child: WebView(
                initialUrl: widget.initialUrl,
                onProgress: (progress) {
                  pageLoadProgressValueNotifier.value = progress / 100 < 1 ? progress / 100 : null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageLoadProgressValueNotifier.dispose();
    super.dispose();
  }
}

class _PageLoadProgressValueNotifier extends ValueNotifier<double?> {
  _PageLoadProgressValueNotifier(double? value) : super(value);
}
