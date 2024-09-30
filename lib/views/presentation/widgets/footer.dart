import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants.dart';
import '../../../utils/icons.dart';
import '../../manager/contact_us/contact_us_cubit.dart';
import 'contact_us_row.dart';

class Footer extends StatelessWidget {
  final String logo;
  const Footer({
    super.key,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1200.w,
        height: 350.h,
        color: const Color(0xffd2ddbf),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 350.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),
                        Image.network(
                          logo.isEmpty ? networklogo! : logo,
                          height: 120.h,
                          width: 145.w,
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          "Skin Care Products to Keep You Glowing All Day",
                          style: GoogleFonts.poppins(
                              color: const Color(0xffb69736),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  BlocProvider(
                    create: (context) => ContactUsCubit()..getAboutUs(),
                    child: BlocBuilder<ContactUsCubit, ContactUsState>(
                      builder: (context, state) {
                        return (state is ContactUsLoaded)
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 80.h),
                                  Text("Contact Us",
                                      style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 30.h),
                                  Text(state.contactUsModel.data[0].address,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.normal)),
                                  Text(state.contactUsModel.data[0].email,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.normal)),
                                  Text(state.contactUsModel.data[0].phone,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.normal)),
                                  SizedBox(height: 25.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ContactUsRow(
                                        link: state.contactUsModel.data[0]
                                            .socialLinks.facebook,
                                        icon: facebook,
                                      ),
                                      ContactUsRow(
                                        link: state.contactUsModel.data[0]
                                            .socialLinks.linkedIn,
                                        icon: linkedin,
                                      ),
                                      ContactUsRow(
                                        link: state.contactUsModel.data[0]
                                            .socialLinks.instagram,
                                        icon: instagram,
                                      ),
                                      ContactUsRow(
                                        link: state.contactUsModel.data[0]
                                            .socialLinks.youtube,
                                        icon: youtube,
                                      ),
                                      ContactUsRow(
                                        link: state.contactUsModel.data[0]
                                            .socialLinks.twitter,
                                        icon: x,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            : const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      await launchUrl(Uri.parse("https://thegate1.com/ar_EG"));
                    },
                    child: Text(
                      "Developed by The Gate 1",
                      style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(.5),
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  ContactUsRow(
                    link: "https://www.facebook.com/thegate1.a/",
                    icon: facebookGate,
                    isgate: true,
                  ),
                  ContactUsRow(
                    link: "https://www.linkedin.com/company/the-gate-1/",
                    icon: linkedinGate,
                    isgate: true,
                  ),
                  ContactUsRow(
                    link: "https://x.com/TheGate1a",
                    icon: xGate,
                    isgate: true,
                  ),
                  ContactUsRow(
                    link: "https://www.linkedin.com/company/the-gate-1/",
                    icon: linkedinGate,
                    isgate: true,
                  ),
                  ContactUsRow(
                    link: "https://www.linkedin.com/company/the-gate-1/",
                    icon: linkedinGate,
                    isgate: true,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
