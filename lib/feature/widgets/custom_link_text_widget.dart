// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTextLink extends StatelessWidget {
  CustomTextLink({
    Key? key,
    required this.titleText,
    required this.buttonText,
    required this.url,
  }) : super(key: key);
  final String titleText;
  final String buttonText;
  final Uri url;

  final UrlFunc urlLauncher = UrlFunc();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Row(
        children: [
          Text(titleText,
              style: GoogleFonts.raleway(
                textStyle: context.general.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )),
          TextButton(
            onPressed: () async {
              await urlLauncher._launchUrl(url);
            },
            child: Text(buttonText),
          )
        ],
      ),
    );
  }
}

class UrlFunc {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Coul launch $url');
    }
  }
}
