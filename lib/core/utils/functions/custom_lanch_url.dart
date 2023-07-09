import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void customLaunchUrl({required String? url, context}) async {
  if (url != null) {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('cannot open $uri'),
      ));
    }
  }
}
