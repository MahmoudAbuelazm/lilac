import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac/views/manager/about_us_cubit/about_us_cubit.dart';
import 'package:lilac/views/manager/contact_us/contact_us_cubit.dart';
import 'package:lilac/views/manager/home_cubit/home_cubit.dart';
import 'package:lilac/views/manager/product/product_cubit.dart';
import 'package:lilac/views/manager/service_cubit/service_cubit.dart';
import 'package:lilac/views/presentation/screens/service_screen.dart';

import '../../../utils/icons.dart';
import '../widgets/app_bar.dart';
import '../widgets/contact_us_row.dart';
import '../widgets/home_button.dart';
import '../widgets/loading_animation.dart';
import 'product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return (state is HomeLoaded)
            ? Scaffold(
                backgroundColor: const Color(0xffe4ece0),
                body: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(
                      height: 810.h,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            SizedBox(height: 60.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FadeInLeft(
                                  child: Container(
                                    width: 600.w,
                                    height: 750.h,
                                    color: const Color(0xffd2ddbf),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.w, vertical: 100.h),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Text(
                                                state.responseModel.data.title,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 35.sp,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40.w),
                                            child: Text(
                                                state.responseModel.data
                                                    .landingPageText,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15.sp,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              HomeButton(
                                                title: "Products",
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              BlocProvider(
                                                                create: (context) =>
                                                                    ProductCubit()
                                                                      ..getcontent(),
                                                                child:
                                                                    const ProductScreen(),
                                                              )));
                                                },
                                              ),
                                              HomeButton(
                                                title: "Services",
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              BlocProvider(
                                                                create: (context) =>
                                                                    ServiceCubit()
                                                                      ..getcontent(),
                                                                child:
                                                                    const ServiceScreen(),
                                                              )));
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                FadeInRight(
                                  child: Image.network(
                                    state.responseModel.data.landingPageImage
                                        .url,
                                    width: 600.w,
                                    height: 750.h,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 80.h),
                            BlocProvider(
                              create: (context) => AboutUsCubit()..getAboutUs(),
                              child: BlocBuilder<AboutUsCubit, AboutUsState>(
                                builder: (context, state) {
                                  return state is AboutUsLoaded
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.network(
                                              state.aboutUsModel.data[0].image
                                                  .url,
                                              height: 650.h,
                                              width: 320.w,
                                              fit: BoxFit.cover,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 80.w),
                                              child: SizedBox(
                                                height: 650.h,
                                                width: 720.w,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("About Us",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 35.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                    Text(
                                                      state.aboutUsModel.data[0]
                                                          .description,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator());
                                },
                              ),
                            ),
                            SizedBox(height: 80.h),
                            Container(
                                width: 1200.w,
                                height: 400.h,
                                color: const Color(0xffd2ddbf),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 80.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 350.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 40.h),
                                                Image.network(
                                                  state.responseModel.data.logo
                                                      .url,
                                                  height: 120.h,
                                                  width: 145.w,
                                                ),
                                                SizedBox(height: 40.h),
                                                Text(
                                                  "Skin Care Products to Keep You Glowing All Day ",
                                                  style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xffb69736),
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          BlocProvider(
                                            create: (context) =>
                                                ContactUsCubit()..getAboutUs(),
                                            child: BlocBuilder<ContactUsCubit,
                                                ContactUsState>(
                                              builder: (context, state) {
                                                return (state
                                                        is ContactUsLoaded)
                                                    ? Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                              height: 80.h),
                                                          Text("Contact Us",
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          SizedBox(
                                                              height: 30.h),
                                                          Text(
                                                              state
                                                                  .contactUsModel
                                                                  .data[0]
                                                                  .address,
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal)),
                                                          Text(
                                                              state
                                                                  .contactUsModel
                                                                  .data[0]
                                                                  .email,
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal)),
                                                          Text(
                                                              state
                                                                  .contactUsModel
                                                                  .data[0]
                                                                  .phone,
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal)),
                                                          SizedBox(
                                                              height: 25.h),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              ContactUsRow(
                                                                link: state
                                                                    .contactUsModel
                                                                    .data[0]
                                                                    .socialLinks
                                                                    .facebook,
                                                                icon: facebook,
                                                              ),
                                                              ContactUsRow(
                                                                link: state
                                                                    .contactUsModel
                                                                    .data[0]
                                                                    .socialLinks
                                                                    .linkedIn,
                                                                icon: linkedin,
                                                              ),
                                                              ContactUsRow(
                                                                link: state
                                                                    .contactUsModel
                                                                    .data[0]
                                                                    .socialLinks
                                                                    .instagram,
                                                                icon: instagram,
                                                              ),
                                                              ContactUsRow(
                                                                link: state
                                                                    .contactUsModel
                                                                    .data[0]
                                                                    .socialLinks
                                                                    .youtube,
                                                                icon: youtube,
                                                              ),
                                                              ContactUsRow(
                                                                link: state
                                                                    .contactUsModel
                                                                    .data[0]
                                                                    .socialLinks
                                                                    .twitter,
                                                                icon: x,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    : const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Colors.black,
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    FadeInDown(
                      child: CustomAppBar(
                        logo: state.responseModel.data.logo.url,
                        scrollController: _scrollController,
                        onIndexSelected: (index) {
                          if (index == 0) {
                            _scrollController.animateTo(
                              0,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                            );
                          } else if (index == 1) {
                            _scrollController.animateTo(
                              800.h,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                            );
                          } else if (index == 2) {
                            _scrollController.animateTo(
                              1440.h,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            : const LoadingAnimation();
      },
    );
  }

  OutlineInputBorder textfieldBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20.r),
    );
  }
}
