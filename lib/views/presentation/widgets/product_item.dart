import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 275.h,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: product.image
                .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        e.url,
                        height: 275.h,
                        width: 500.w,
                        fit: BoxFit.fitWidth,
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 30.h),
          Text(
            product.name,
            style: GoogleFonts.poppins(
                color: const Color(0xffb69736),
                fontSize: 25.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),
          Flexible(
            child: Text(
              product.description,
              style: GoogleFonts.poppins(
                  fontSize: 15.sp, fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price: \$${product.price}",
                  style: GoogleFonts.poppins(
                    color: const Color(0xffb69736),
                    fontSize: 20.sp,
                    decoration: product.discount > 0
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                Text("discount: ${product.discount}%",
                    style: GoogleFonts.poppins(
                      color: const Color(0xffb69736),
                      fontSize: 20.sp,
                    )),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Text("Final Price: \$${product.finalPrice}",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
