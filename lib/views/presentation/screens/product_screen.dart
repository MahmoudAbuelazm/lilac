import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac/views/presentation/widgets/product_item.dart';

import '../../manager/product/product_cubit.dart';
import '../widgets/loading_animation.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe4ece0),
      appBar: AppBar(
        backgroundColor: const Color(0xffe4ece0),
        title: Text("Products",
            style: TextStyle(
                color: const Color(0xffb69736),
                fontSize: 26.sp,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return (state is ProductLoaded)
              ? FadeInRight(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    shrinkWrap: true,
                    itemCount: state.productModel.result.length,
                    itemBuilder: (context, index) {
                      return ProductItem(
                          product: state.productModel.result[index]);
                    },
                  ),
                )
              : const LoadingAnimation();
        },
      ),
    );
  }
}
