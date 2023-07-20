import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_snack_bar.dart';

Future<void> launchCustomUrl(context, String ?url) async {
  
  if (url!=null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri))
    {
      launchUrl(uri);
    } else
    {
      snackBar(context, 'cannot launch $url');
    }
  }
}


