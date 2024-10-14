import 'package:flutter/material.dart';
import 'package:flutter_sport_app_1/Core/utils/app_colors.dart';

import 'package:flutter_sport_app_1/Futures/Ai/controller/ai_getx_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Get.theme.textTheme;
    final TextEditingController messageController = TextEditingController();
    final ChatController controller = Get.put(ChatController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'هوش مصنوعی',
          textAlign: TextAlign.center,
          style: textTheme.displayLarge?.apply(fontSizeDelta: -3),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return ListTile(
                      title: Align(
                        alignment: message.isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: message.isUser
                                    ? AppColors.primaryG
                                    : AppColors.secondaryG),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message.message,
                            textDirection: TextDirection.rtl,
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 13.h),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.5.h, left: 3.w),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.midGrayColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(1.1.h)),
                        child: TextField(
                          controller: messageController,
                          style: textTheme.bodyLarge!
                              .apply(color: AppColors.blackColor),
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText: 'پیام خود را وارد کنید ..',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 3.w),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.6.h),
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        final message = messageController.text.trim();
                        if (message.isNotEmpty) {
                          controller.addMessage(message, true);
                          messageController.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
