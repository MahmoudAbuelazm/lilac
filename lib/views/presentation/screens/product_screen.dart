import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac/views/presentation/widgets/product_item.dart';

import '../../manager/product/product_cubit.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/loading_animation.dart';

class ProductScreen extends StatefulWidget {
  final String logo;
  final ScrollController scrollController;
  const ProductScreen(
      {super.key, required this.logo, required this.scrollController});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe4ece0),
      body: Column(
        children: [
          CustomAppBar(
            logo: widget.logo,
            scrollController: widget.scrollController,
            onIndexSelected: (index) {
              if (index == 0) {
                widget.scrollController.animateTo(
                  0,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
              } else if (index == 1) {
                widget.scrollController.animateTo(
                  800.h,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
              } else if (index == 2) {
                widget.scrollController.animateTo(
                  1440.h,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
              }
            },
            title: 'Products',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for services',
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _searchController.text.isEmpty
              ? BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return (state is ProductLoaded)
                        ? Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  FadeInRight(
                                    child: GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: .7,
                                        mainAxisSpacing: 0,
                                      ),
                                      shrinkWrap: true,
                                      itemCount:
                                          state.productModel.result.length,
                                      itemBuilder: (context, index) {
                                        return ProductItem(
                                            product: state
                                                .productModel.result[index]);
                                      },
                                    ),
                                  ),
                                  Footer(
                                    logo: widget.logo,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const LoadingAnimation();
                  },
                )
              : BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return (state is ProductLoaded)
                        ? Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  FadeInRight(
                                    child: GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: .7,
                                        mainAxisSpacing: 0,
                                      ),
                                      shrinkWrap: true,
                                      itemCount: state.productModel.result
                                          .where((product) =>
                                              product.name
                                                  .toLowerCase()
                                                  .contains(_searchController
                                                      .text
                                                      .toLowerCase()) ||
                                              product.description
                                                  .toLowerCase()
                                                  .contains(_searchController
                                                      .text
                                                      .toLowerCase()))
                                          .length,
                                      itemBuilder: (context, index) {
                                        var filteredProducts = state
                                            .productModel.result
                                            .where((product) =>
                                                product.name
                                                    .toLowerCase()
                                                    .contains(_searchController
                                                        .text
                                                        .toLowerCase()) ||
                                                product.description
                                                    .toLowerCase()
                                                    .contains(_searchController
                                                        .text
                                                        .toLowerCase()))
                                            .toList();
                                        return ProductItem(
                                            product: filteredProducts[index]);
                                      },
                                    ),
                                  ),
                                 
                                  Footer(
                                    logo: widget.logo,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const LoadingAnimation();
                  },
                )
        ],
      ),
    );
  }
}
