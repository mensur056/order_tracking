import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:order_app/core/data/model/responses/home/project_model.dart';
import 'package:order_app/utility/constants/color.dart';

class QuizDetailPage extends StatelessWidget {
  const QuizDetailPage({super.key, required this.items});
  final List<ProjectModel>? items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backColor,
        body: Column(
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
                          itemCount: items?.length,
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
                                          subtitle: Text(items?[index].subtitle ?? ''),
                                          leading:
                                              Image.network(width: 40, items?[index].image ?? ''),
                                          title: Text(items?[index].title ?? ''))),
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
        ));
  }
}
