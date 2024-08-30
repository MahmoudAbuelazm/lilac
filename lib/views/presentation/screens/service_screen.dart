import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/service_cubit/service_cubit.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/loading_animation.dart';
import '../widgets/service_item.dart';

class ServiceScreen extends StatefulWidget {
  final String logo;
  final ScrollController scrollController;

  const ServiceScreen(
      {super.key, required this.logo, required this.scrollController});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
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
              title: 'Services',
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
                ? BlocBuilder<ServiceCubit, ServiceState>(
                    builder: (context, state) {
                      return (state is ServiceLoaded)
                          ? Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ...state.serviceModel.results
                                        .map((service) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20.h),
                                        child: ServiceItem(service: service),
                                      );
                                    }),
                                    const Footer(
                                      logo: "",
                                    )
                                  ],
                                ),
                              ),
                            )
                          : const LoadingAnimation();
                    },
                  )
                : BlocBuilder<ServiceCubit, ServiceState>(
                    builder: (context, state) {
                      return (state is ServiceLoaded)
                          ? Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ...state.serviceModel.results
                                        .where((service) =>
                                            service.name.toLowerCase().contains(
                                                _searchController.text
                                                    .toLowerCase()) ||
                                            service.description
                                                .toLowerCase()
                                                .contains(_searchController.text
                                                    .toLowerCase()))
                                        .map((service) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20.h),
                                        child: ServiceItem(service: service),
                                      );
                                    }),
                                    const Footer(
                                      logo: "",
                                    )
                                  ],
                                ),
                              ),
                            )
                          : const LoadingAnimation();
                    },
                  ),
          ],
        ));
  }
}
