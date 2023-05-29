import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:order_app/utility/constants/color.dart';
import '../../../core/bloc/home/home_cubit.dart';
import '../../../core/bloc/home/home_state.dart';

class QuizDetailPage extends StatelessWidget {
  const QuizDetailPage({super.key});

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
            final project = state.items;
            return Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: AppColors.backColor,
                    )),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: context.roundedRectangleBorderMedium.borderRadius),
                    child: Padding(
                      padding: context.paddingMedium,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: project?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Column(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                              borderRadius:
                                                  const BorderRadius.all(Radius.circular(16))),
                                          child: ListTile(
                                              onTap: () {},
                                              trailing: const Icon(Icons.navigate_next_outlined),
                                              subtitle: Text(project?[index].subtitle ?? ''),
                                              leading: Image.network(
                                                  width: 40, project?[index].image ?? ''),
                                              title: Text(project?[index].title ?? ''))),
                                    ],
                                  ),
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
      ),
    );
  }
}
