import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac/utils/constants.dart';
import 'package:lilac/utils/text_styles.dart';

import '../widgets/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe4ece0),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 60.w, right: 80.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      logo,
                      height: 121.h,
                      width: 166.w,
                    ),
                    Row(
                      children: [
                        Text("Home",
                            style: AppTextStyles.poppins_22Bold.copyWith(
                              color: const Color(0xffb69736),
                            )),
                        SizedBox(width: 30.w),
                        Text("Slider", style: AppTextStyles.poppins_22Bold),
                        SizedBox(width: 30.w),
                        Text("Portfolio", style: AppTextStyles.poppins_22Bold),
                        SizedBox(width: 30.w),
                        Text("Page", style: AppTextStyles.poppins_22Bold),
                        SizedBox(width: 30.w),
                        Text("Gallery", style: AppTextStyles.poppins_22Bold),
                        SizedBox(width: 30.w),
                        Text("Blog", style: AppTextStyles.poppins_22Bold),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 607.w,
                    height: 590.h,
                    color: const Color(0xffd2ddbf),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 100.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text("World Class Interior Design",
                                style: GoogleFonts.poppins(
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut.",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomeButton(
                                title: "Products",
                                onPressed: () {},
                              ),
                              HomeButton(
                                title: "Services",
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      homeImage,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              SizedBox(height: 80.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          "Let's find the favorite interior for your dream.",
                          style: GoogleFonts.poppins(
                              fontSize: 22.sp, fontWeight: FontWeight.normal)),
                    ),
                    SizedBox(width: 20.w),
                    SizedBox(
                      width: 615.w,
                      height: 65.h,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.search),
                          focusedBorder: textfieldBorder(),
                          enabledBorder: textfieldBorder(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 75.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    homeImage,
                    height: 580.h,
                    width: 320.w,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About Us",
                            style: GoogleFonts.poppins(
                                fontSize: 35.sp, fontWeight: FontWeight.bold)),
                        SizedBox(height: 30.h),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Suspendisse ultrices gravida dictum fusce. Non pulvinar neque laoreet suspendisse interdum consectetur libero id. Vitae ultricies leo integer malesuada nunc.",
                          style: GoogleFonts.poppins(
                              fontSize: 15.sp, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 45.h),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Suspendisse ultrices gravida dictum fusce. Non pulvinar neque laoreet suspendisse interdum consectetur libero id. Vitae ultricies leo integer malesuada nunc.",
                          style: GoogleFonts.poppins(
                              fontSize: 15.sp, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 70.h),
                        HomeButton(
                          title: "Learn More",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 80.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "News & Updates",
                      style: GoogleFonts.poppins(
                          fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 55.h),
                    Row(
                      children: [
                        const Product(),
                        SizedBox(width: 40.w),
                        const Product(),
                        SizedBox(width: 40.w),
                        const Product(),
                      ],
                    ),
                    SizedBox(height: 120.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Need any interior design help?",
                            style: GoogleFonts.poppins(
                                fontSize: 32.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 40.w),
                        HomeButton(title: "Contact Us", onPressed: () {})
                      ],
                    ),
                    SizedBox(height: 65.w),
                  ],
                ),
              ),
              Container(
                  width: 1200.w,
                  height: 550.h,
                  color: const Color(0xffd2ddbf),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.w),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 40.h),
                                Image.asset(
                                  logo,
                                  height: 120.h,
                                  width: 145.w,
                                ),
                                SizedBox(height: 40.h),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xffb69736),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(height: 80.h),
                                Text("Quick Links",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 25.h),
                                Text("Home",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal)),
                                Text("Slider",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal)),
                                Text("Portfolio",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal)),
                                Text("Page",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal)),
                                Text("Gallery",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal)),
                                Text("Blog",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(height: 80.h),
                                Text("Contact Us",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 30.h),
                                Text("123 Anywhere St., Any City, ST 12345",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal)),
                                SizedBox(height: 20.h),
                                Text("hello@reallygreatsite.com",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal)),
                                SizedBox(height: 20.h),
                                Text("+123-456-7890",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Text(
                                "© 2021 Really Great Site. All Rights Reserved.",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal)),
                            const Spacer(),
                            Text("Terms of use | Privacy Environmental Policy",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal)),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder textfieldBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20.r),
    );
  }
}

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          homeImage,
          height: 275.h,
          width: 300.w,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 30.h),
        Text(
          "Kitchen Design",
          style:
              GoogleFonts.poppins(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.h),
        Text(
          "Lorem ipsum dolor sit amet",
          style: GoogleFonts.poppins(
              fontSize: 15.sp, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 45.h),
        HomeButton(title: "Learn More", onPressed: () {}),
      ],
    );
  }
}
