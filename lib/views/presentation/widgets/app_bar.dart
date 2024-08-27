import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/text_styles.dart';

class CustomAppBar extends StatefulWidget {
  final String logo;
  final ScrollController scrollController;
  final void Function(int index) onIndexSelected;
  const CustomAppBar({
    super.key,
    required this.logo,
    required this.scrollController,
    required this.onIndexSelected,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _selectedIndex = 0;
  @override
  void initState() {
    widget.scrollController.addListener(() {
      if (widget.scrollController.offset > 405.h &&
          widget.scrollController.offset <= 810.h) {
        setState(() {
          _selectedIndex = 1;
        });
      } else if (widget.scrollController.offset > 810.h) {
        setState(() {
          _selectedIndex = 2;
        });
      } else {
        setState(() {
          _selectedIndex = 0;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      color: const Color(0xffe4ece0),
      child: Padding(
        padding: EdgeInsets.only(left: 60.w, right: 80.w, bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              widget.logo,
              height: 80.h,
              width: 166.w,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    widget.onIndexSelected(0);
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Text("Home",
                      style: AppTextStyles.poppins_22Bold.copyWith(
                        color: _selectedIndex == 0
                            ? const Color(0xffb69736)
                            : Colors.black,
                      )),
                ),
                SizedBox(width: 30.w),
                InkWell(
                  onTap: () {
                    widget.onIndexSelected(1);
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Text("About Us",
                      style: AppTextStyles.poppins_22Bold.copyWith(
                        color: _selectedIndex == 1
                            ? const Color(0xffb69736)
                            : Colors.black,
                      )),
                ),
                SizedBox(width: 30.w),

                InkWell(
                  onTap: () {
                    widget.onIndexSelected(2);
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  child: Text("Contacts Us",
                      style: AppTextStyles.poppins_22Bold.copyWith(
                        color: _selectedIndex == 2
                            ? const Color(0xffb69736)
                            : Colors.black,
                      )),
                ),
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
