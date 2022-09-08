import 'package:flutter/material.dart';

class NetworkImageLoader extends StatelessWidget {
  const NetworkImageLoader(
    this.url, {
    Key? key,
    this.loadingWidget,
    this.errorWidget,
  }) : super(key: key);

  final String url;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) =>
          (loadingProgress == null)
              ? child
              : (loadingWidget ??
                  const CircularProgressIndicator(
                    color: Colors.white,
                  )),
      errorBuilder: (context, exception, stackTrace) =>
          errorWidget ?? const Text('error widget...'),
    );
  }
}
