import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/product_model.dart';
import 'home_button.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image[0].url,
              height: 275.h,
              width: 300.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30.h),
            Text(
              product.name,
              style: GoogleFonts.poppins(
                  fontSize: 25.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Text(
                product.description,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    fontSize: 15.sp, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(height: 45.h),
            HomeButton(title: "Learn More", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
