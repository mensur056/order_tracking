import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:order_app/utility/constants/color.dart';

import '../../../core/bloc/home/home_cubit.dart';
import '../../../core/bloc/home/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: _body(),
    );
  }

  Widget _body() {
    return BlocBuilder<HomeCubit, HomeState>(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Last projects',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'All Projects',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: context.dynamicHeight(0.6),
                          child: ListView.builder(
                            itemCount: projectValue?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: const BorderRadius.all(Radius.circular(16))),
                                    child: ListTile(
                                        onTap: () {},
                                        trailing: const Icon(Icons.navigate_next_outlined),
                                        subtitle: Text(projectValue?[index].subtitle ?? ''),
                                        leading: Image.network(
                                            projectValue?[index].image.toString() ?? ''),
                                        title: Text(projectValue?[index].title ?? ''))),
                              );
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
    );
  }
}
