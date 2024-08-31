import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/text_styles.dart';

class CustomAppBar extends StatefulWidget {
  final String logo;
  final ScrollController scrollController;
  final void Function(int index) onIndexSelected;
  final String? title;
  const CustomAppBar({
    super.key,
    required this.logo,
    required this.scrollController,
    required this.onIndexSelected,
    this.title,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _selectedIndex = -1;
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
      } else if (widget.scrollController.offset <= 405.h) {
        {
          setState(() {
            _selectedIndex = 0;
          });
        }
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
            InkWell(
              onTap: () {
                if (widget.title != null) {
                  Navigator.of(context).pop();
                }
              },
              child: Image.network(
                widget.logo,
                height: 80.h,
                width: 166.w,
              ),
            ),
            if (widget.title != null)
              Visibility(
                visible: widget.title != null,
                child: Text(widget.title!,
                    style: AppTextStyles.poppins_22Bold
                        .copyWith(color: const Color(0xffb69736))),
              ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (widget.title != null) {
                      Navigator.of(context).pop();
                      widget.onIndexSelected(0);
                      setState(() {
                        _selectedIndex = 0;
                      });
                    } else {
                      widget.onIndexSelected(0);
                      setState(() {
                        _selectedIndex = 0;
                      });
                    }
                  },
                  child: Text("Home",
                      style: AppTextStyles.poppins_22Bold.copyWith(
                        fontSize: 18.sp,
                        color: _selectedIndex == 0
                            ? const Color(0xffb69736)
                            : Colors.black,
                      )),
                ),
                SizedBox(width: 30.w),
                InkWell(
                  onTap: () {
                    if (widget.title != null) {
                      Navigator.of(context).pop();
                      widget.onIndexSelected(1);
                      setState(() {
                        _selectedIndex = 1;
                      });
                    } else {
                      widget.onIndexSelected(1);
                      setState(() {
                        _selectedIndex = 1;
                      });
                    }
                  },
                  child: Text("About Us",
                      style: AppTextStyles.poppins_22Bold.copyWith(
                        fontSize: 18.sp,
                        color: _selectedIndex == 1
                            ? const Color(0xffb69736)
                            : Colors.black,
                      )),
                ),
                SizedBox(width: 30.w),
                InkWell(
                  onTap: () {
                    if (widget.title != null) {
                      Navigator.of(context).pop();
                      widget.onIndexSelected(2);
                      setState(() {
                        _selectedIndex = 2;
                      });
                    } else {
                      widget.onIndexSelected(2);
                      setState(() {
                        _selectedIndex = 2;
                      });
                    }
                  },
                  child: Text("Contacts Us",
                      style: AppTextStyles.poppins_22Bold.copyWith(
                        fontSize: 18.sp,
                        color: _selectedIndex == 2
                            ? const Color(0xffb69736)
                            : Colors.black,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
