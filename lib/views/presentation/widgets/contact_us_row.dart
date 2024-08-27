import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsRow extends StatelessWidget {
  final String link;
  final String icon;
  const ContactUsRow({
    super.key,
    required this.link,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: InkWell(
        onTap: () async {
          await launchUrl(Uri.parse(link));
        },
        child: SvgPicture.asset(
          icon,
          height: 30.h,
        ),
      ),
    );
  }
}
