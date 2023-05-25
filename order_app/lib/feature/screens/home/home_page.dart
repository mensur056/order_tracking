import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:order_app/utility/constants/color.dart';
import 'package:order_app/utility/constants/sized_boxs.dart';

import '../../../core/bloc/home/home_cubit.dart';
import '../../../core/bloc/home/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeSucces) {
            final projectValue = state.items;
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(color: AppColors.backColor),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: context.roundedRectangleBorderMedium.borderRadius),
                    child: Padding(
                      padding: context.paddingMedium,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Last projects'),
                              Text('All Projects'),
                            ],
                          ),
                          const SizedBoxH24(),
                          SizedBox(
                            height: context.dynamicHeight(0.6),
                            child: ListView.builder(
                              itemCount: projectValue?.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    child: ListTile(
                                        title: Text(projectValue?[index].title.toString() ?? '')));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("There is a error"),
            );
          }
        },
      ),
    );
  }
}
