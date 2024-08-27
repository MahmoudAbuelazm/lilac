import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/service_model.dart';

class ServiceItem extends StatelessWidget {
  final Result service;
  const ServiceItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300.h,
        width: 1200.w,
        child: Stack(
          children: [
            Positioned(
              right: 100.w,
              child: FadeInRightBig(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    service.video.url,
                    height: 300.h,
                    width: 600.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 100.w,
              top: 50.h,
              child: FadeInLeftBig(
                child: Container(
                  height: 200.h,
                  width: 500.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffd2ddbf),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            service.name,
                            style: TextStyle(
                              color: const Color(0xffb69736),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: Text(
                            service.description,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
