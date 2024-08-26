import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac/utils/text_styles.dart';
import 'package:lilac/views/manager/about_us_cubit/about_us_cubit.dart';
import 'package:lilac/views/manager/contact_us/contact_us_cubit.dart';
import 'package:lilac/views/manager/home_cubit/home_cubit.dart';
import 'package:lilac/views/manager/product/product_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/icons.dart';
import '../widgets/home_button.dart';
import '../widgets/product_item.dart';

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
                      height: 770.h,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            SizedBox(height: 40.h),
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
                                                  _scrollController.animateTo(
                                                    1440.h,
                                                    curve: Curves.easeOut,
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                  );
                                                },
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
                                ),
                                FadeInRight(
                                  child: Image.network(
                                    state.responseModel.data.landingPageImage
                                        .url,
                                    width: 600.w,
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
                                              height: 580.h,
                                              width: 320.w,
                                              fit: BoxFit.cover,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 80.w),
                                              child: SizedBox(
                                                height: 580.h,
                                                width: 720.w,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
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
                                                    HomeButton(
                                                      title: "Learn More",
                                                      onPressed: () {},
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
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 80.w),
                              child: BlocProvider(
                                create: (context) =>
                                    ProductCubit()..getcontent(),
                                child: BlocBuilder<ProductCubit, ProductState>(
                                  builder: (context, state) {
                                    return (state is ProductLoaded)
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "News & Updates",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 25.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 55.h),
                                              SizedBox(
                                                height: 510.h,
                                                child: ListView.separated(
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  separatorBuilder: (context,
                                                          index) =>
                                                      SizedBox(height: 20.w),
                                                  shrinkWrap: true,
                                                  itemCount: state.productModel
                                                      .result.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ProductItem(
                                                      product: state
                                                          .productModel
                                                          .result[index],
                                                    );
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: 120.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Need any interior design help?",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 32.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                  SizedBox(width: 40.w),
                                                  HomeButton(
                                                      title: "Contact Us",
                                                      onPressed: () {
                                                        _scrollController
                                                            .animateTo(
                                                          3000.h,
                                                          curve: Curves.easeOut,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      300),
                                                        );
                                                      })
                                                ],
                                              ),
                                              SizedBox(height: 65.w),
                                            ],
                                          )
                                        : const Center(
                                            child: CircularProgressIndicator());
                                  },
                                ),
                              ),
                            ),
                            Container(
                                width: 1200.w,
                                height: 550.h,
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
                                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
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
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 80.h),
                                              Text("Quick Links",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 25.h),
                                              Text("Home",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                              Text("Slider",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                              Text("Portfolio",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                              Text("Page",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                              Text("Gallery",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                              Text("Blog",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                            ],
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
                                                          SizedBox(
                                                              height: 20.h),
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
                                                          SizedBox(
                                                              height: 20.h),
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
                                                              height: 20.h),
                                                          InkWell(
                                                            onTap: () async {
                                                              await launchUrl(
                                                                  Uri.parse(state
                                                                      .contactUsModel
                                                                      .data[0]
                                                                      .socialLinks
                                                                      .facebook));
                                                            },
                                                            child: Row(
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                  facebook,
                                                                  height: 30.h,
                                                                ),
                                                                SizedBox(
                                                                    width: 5.w),
                                                                Text(
                                                                    state
                                                                        .contactUsModel
                                                                        .data[0]
                                                                        .socialLinks
                                                                        .facebook
                                                                        .replaceAll(
                                                                            "https://www.facebook.com/",
                                                                            ""),
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize: 15
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.normal)),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: 20.h),
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
                                      SizedBox(height: 80.h),
                                      const Divider(
                                        color: Colors.black,
                                        thickness: 1,
                                      ),
                                      SizedBox(height: 20.h),
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
                      ),
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
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
                Text("Products", style: AppTextStyles.poppins_22Bold),
                SizedBox(width: 30.w),
                Text("Services", style: AppTextStyles.poppins_22Bold),
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
