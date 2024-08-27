import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/service_cubit/service_cubit.dart';
import '../widgets/loading_animation.dart';
import '../widgets/service_item.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe4ece0),
        appBar: AppBar(
          backgroundColor: const Color(0xffe4ece0),
          title: Text("Services",
              style: TextStyle(
                  color: const Color(0xffb69736),
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: BlocBuilder<ServiceCubit, ServiceState>(
          builder: (context, state) {
            return (state is ServiceLoaded)
                ? SingleChildScrollView(
                    child: Column(
                      children: state.serviceModel.results.map((service) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: ServiceItem(service: service),
                        );
                      }).toList(),
                    ),
                  )
                : const LoadingAnimation();
          },
        ));
  }
}
