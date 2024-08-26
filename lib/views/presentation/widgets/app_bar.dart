
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/text_styles.dart';

class CustomAppBar extends StatefulWidget {
  final String logo;
  final ScrollController scrollController;
  const CustomAppBar({
    super.key,
    required this.logo,
    required this.scrollController,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _selectedIndex = 0;
  @override
  void initState() {
    widget.scrollController.addListener(() {
      if (widget.scrollController.offset > 1440.h) {
        setState(() {
          _selectedIndex++;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffe4ece0),
      child: Padding(
        padding: EdgeInsets.only(left: 60.w, right: 80.w, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              widget.logo,
              height: 100.h,
              width: 166.w,
            ),
            Row(
              children: [
                Text("Home",
                    style: AppTextStyles.poppins_22Bold.copyWith(
                      color: const Color(0xffb69736),
                    )),
                SizedBox(width: 30.w),
                Text("About Us", style: AppTextStyles.poppins_22Bold),
                SizedBox(width: 30.w),

                Text("Contacts Us", style: AppTextStyles.poppins_22Bold),
                // SizedBox(width: 30.w),
                // Text("Blog", style: AppTextStyles.poppins_22Bold),
              ],
            )
          ],
        ),
      ),
    );
  }
}
