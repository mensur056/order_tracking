import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
          final lastProjectValue = state.lastItems;

          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Container(
                      color: AppColors.backColor,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: lastProjectValue?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.red,
                                    Colors.red.shade400,
                                    Colors.red.shade300,
                                  ]),
                                  borderRadius: context.normalBorderRadius),
                              width: context.dynamicWidth(0.8),
                              child: ListTile(
                                trailing: const CircularProgressIndicator(
                                    color: Colors.white, backgroundColor: Colors.white, value: 0.5),
                                leading:
                                    Image.network(lastProjectValue?[index].image ?? '', width: 40),
                                title: Text(
                                  lastProjectValue?[index].title ?? '',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white, fontWeight: FontWeight.w800),
                                ),
                                subtitle: Text(
                                  lastProjectValue?[index].time ?? '',
                                  style: GoogleFonts.quicksand(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: context.roundedRectangleBorderMedium.borderRadius),
                    child: Padding(
                      padding: context.paddingMedium,
                      child: SingleChildScrollView(
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
                            const SizedBoxH16(),
                            SizedBox(
                              height: 280,
                              child: ListView.builder(
                                itemCount: projectValue!.length - 5,
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
                                                subtitle: Text(projectValue[index].subtitle ?? ''),
                                                leading: Image.network(
                                                    width: 40,
                                                    projectValue[index].image.toString()),
                                                title: Text(projectValue[index].title ?? ''))),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Last Orders',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'All Orders',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            const SizedBoxH16(),
                            SizedBox(
                              height: 300,
                              child: ListView.builder(
                                itemCount: projectValue.length,
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
                                                subtitle: Text(projectValue[index].subtitle ?? ''),
                                                leading: Image.network(
                                                    width: 40,
                                                    projectValue[index].image.toString()),
                                                title: Text(projectValue[index].title ?? ''))),
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
                ),
              ],
            ),
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
