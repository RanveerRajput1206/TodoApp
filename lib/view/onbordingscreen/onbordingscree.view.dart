import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onbordingController.dart';
import '../../model/onbordingscreen.model.dart';

// ignore: must_be_immutable
class OnbordingScreen extends StatelessWidget {
  OnbordingController controller = Get.put(OnbordingController());

  final List<OnbordingScreenItem> onbordingScreenItem = [
    OnbordingScreenItem(
      title: 'Welcome To ToDo App',
      bgColor: const Color.fromARGB(255, 181, 220, 238),
    ),
    OnbordingScreenItem(
      title: 'title2',
      bgColor: const Color.fromARGB(255, 227, 245, 182),
    ),
  ];

  OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            final currentItem =
                onbordingScreenItem[controller.currentPage.value];
            return Container(
              color: currentItem.bgColor,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        PageView.builder(
                          itemCount: onbordingScreenItem.length,
                          controller: controller.pageController,
                          onPageChanged: (index) =>
                              controller.currentPage.value = index,
                          itemBuilder: (context, index) {
                            final item = onbordingScreenItem[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    item.title,
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Positioned(
                          top: 16,
                          left: 170,
                          child: Row(
                            children: List.generate(
                              onbordingScreenItem.length,
                              (index) => Container(
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index == controller.currentPage.value
                                        ? const Color.fromARGB(255, 15, 30, 36)
                                        : const Color.fromARGB(
                                            255, 249, 248, 246)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 12, 12, 12),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.height * 0.03),
                    ),
                    onPressed: () {
                      if (controller.currentPage.value <
                          onbordingScreenItem.length - 1) {
                        controller.nextPage();
                      } else {
                        controller.goToLoginPage();
                      }
                    },
                    child: Text(controller.currentPage.value <
                            onbordingScreenItem.length - 1
                        ? "next"
                        : "Go to Login page"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
