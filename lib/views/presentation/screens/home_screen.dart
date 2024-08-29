import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac/utils/constants.dart';
import 'package:lilac/views/manager/about_us_cubit/about_us_cubit.dart';
import 'package:lilac/views/manager/home_cubit/home_cubit.dart';
import 'package:lilac/views/manager/product/product_cubit.dart';
import 'package:lilac/views/manager/service_cubit/service_cubit.dart';
import 'package:lilac/views/presentation/screens/service_screen.dart';

import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
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
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded) {
          networklogo = state.responseModel.data.logo.url;
        }
      },
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
                                                                    ProductScreen(
                                                                  logo: state
                                                                      .responseModel
                                                                      .data
                                                                      .logo
                                                                      .url,
                                                                  scrollController:
                                                                      _scrollController,
                                                                ),
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
                                                                    ServiceScreen(
                                                                  logo: state
                                                                      .responseModel
                                                                      .data
                                                                      .logo
                                                                      .url,
                                                                  scrollController:
                                                                      _scrollController,
                                                                ),
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
                            Footer(
                              logo: state.responseModel.data.logo.url,
                            )
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
