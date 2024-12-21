import 'package:flutter/material.dart';
import 'package:parth_shah_task_1/utils/color.dart';
import 'package:parth_shah_task_1/utils/image.dart';
import 'package:parth_shah_task_1/utils/string.dart';
import 'package:provider/provider.dart';

import 'workspace_provider/workspace_provider.dart';

class WorkSpaceScreen extends StatelessWidget {
  const WorkSpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WorkspaceProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      persistentFooterButtons: [
        buildFooter(),
      ],
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              provider.isThirdScreen
                  ? buildThirdScreen(context, provider)
                  : provider.isSecondScreen
                      ? buildSecondScreen(context, provider)
                      : buildOneScreen(context, provider),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildThirdScreen(BuildContext context, WorkspaceProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAppbarLeadingWidget(),
        Text(
          provider.currentStep,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
        const SizedBox(height: 8),
        const Text(
          StringUtils.thirdScreenTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          StringUtils.thirdScreenSubTitle,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 24),
        const Text(
          StringUtils.thirdScreenQuestion,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        buildCustomOptionRow([
          StringUtils.sales,
          StringUtils.recruiting,
          StringUtils.marketing,
          StringUtils.investing,
          StringUtils.customer_success,
          StringUtils.human_resources,
          StringUtils.fundraising,
        ], provider),
        const SizedBox(height: 24),
        const Text(
          StringUtils.thirdScreenSecondQuestion,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        buildCustomOptionRow([
          StringUtils.tracking_leads,
          StringUtils.hiring_new_people,
          StringUtils.others,
        ], provider),
        const SizedBox(height: 24),
        buildContinueButton(context, provider),
      ],
    );
  }

  Widget buildSecondScreen(BuildContext context, WorkspaceProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          provider.currentStep,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
        const SizedBox(height: 8),
        const Text(
          StringUtils.secondScreenTitleText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        buildAddPersonImage(),
        const SizedBox(height: 24),
        buildTextField(
            label: StringUtils.workSpaceTextfieldLable,
            hintText: StringUtils.workSpaceTextfieldHintText),
        const SizedBox(height: 16),
        buildTextField(
            label: StringUtils.workSpaceTextfieldLable2,
            hintText: StringUtils.workSpaceTextfieldHintText2),
        const SizedBox(height: 16),
        buildBillingCountry(),
        const SizedBox(height: 24),
        buildContinueButton(context, provider),
      ],
    );
  }

  Widget buildOneScreen(BuildContext context, WorkspaceProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAppbarLeadingWidget(),
        Text(
          provider.currentStep,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
        const SizedBox(height: 8),
        const Text(
          StringUtils.screenOneTitleText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        buildAddPersonImage(),
        const SizedBox(height: 24),
        buildTextField(
            label: StringUtils.firstName, hintText: StringUtils.hintText1),
        const SizedBox(height: 16),
        buildTextField(
            label: StringUtils.lastName, hintText: StringUtils.hintText2),
        const SizedBox(height: 16),
        buildTextField(
            label: StringUtils.email, hintText: StringUtils.hintText3),
        const SizedBox(height: 24),
        const Text(
          StringUtils.subscribe_text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        buildSwitchAndText(provider),
        const SizedBox(height: 24),
        buildContinueButton(context, provider),
      ],
    );
  }

  Widget buildFooter() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringUtils.footer_text,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildPrivacyTerms(ImageUtils.privacyImg, StringUtils.privacy),
              buildPrivacyTerms(ImageUtils.termsImg, StringUtils.terms),
              buildPrivacyTerms(ImageUtils.getHelpImg, StringUtils.get_help),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCustomOptionRow(
      List<String> options, WorkspaceProvider provider) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = provider.selectedOptions.contains(option);
        return GestureDetector(
          onTap: () {
            provider.toggleOption(option);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? ColorUtils.borderColor
                    : Colors.black.withOpacity(0.1),
                width: 1,
              ),
              color: isSelected
                  ? ColorUtils.borderColor.withOpacity(0.5)
                  : Colors.white.withOpacity(0.8),
            ),
            child: Text(
              option,
              style: TextStyle(
                color: isSelected ? ColorUtils.textColor : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildBillingCountry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          StringUtils.billing_country,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: Colors.black.withOpacity(0.1), width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(ImageUtils.us_flag_img, height: 20),
                  const SizedBox(width: 8),
                  const Text(
                    StringUtils.us,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.black87),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildContinueButton(BuildContext context, WorkspaceProvider provider) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff104127),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          provider.nextScreen(context);
        },
        child: const Text(
          StringUtils.continueText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget buildSwitchAndText(WorkspaceProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          child: Text(
            StringUtils.updateText,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Switch(
          focusColor: Colors.black.withOpacity(0.1),
          hoverColor: Colors.black.withOpacity(0.1),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: const Color(0xffDFE1E6),
          trackOutlineColor: WidgetStateProperty.all(Colors.white),
          activeColor: Colors.green,
          value: provider.subscribeToUpdates,
          onChanged: (bool value) {
            provider.toggleSubscribe(value);
          },
        ),
      ],
    );
  }

  Widget buildAddPersonImage() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
              width: 1.2,
            ),
          ),
          child: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Icon(Icons.perm_identity_outlined, size: 25),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                ImageUtils.add_img,
                height: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                StringUtils.addImageText,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildAppbarLeadingWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Image.asset(
            ImageUtils.logo,
            height: 25,
          ),
          const SizedBox(
            width: 4,
          ),
          const Text(
            StringUtils.logoText,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPrivacyTerms(String image, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 13, color: Color(0xff666D80)),
          )
        ],
      ),
    );
  }

  Widget buildTextField({required String label, required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: ColorUtils.textFieldBackgoundColor,
              fontSize: 14),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 50,
          child: TextField(
            cursorColor: Colors.black,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 13),
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 2, // Thicker border
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
