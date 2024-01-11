import 'package:flutter/material.dart';
import 'package:saumil_s_application/core/app_export.dart';
import 'package:saumil_s_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:saumil_s_application/widgets/app_bar/appbar_title.dart';
import 'package:saumil_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:saumil_s_application/widgets/custom_drop_down.dart';
import 'package:saumil_s_application/widgets/custom_elevated_button.dart';
import 'package:saumil_s_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddNewEducationScreen extends StatelessWidget {
  AddNewEducationScreen({Key? key}) : super(key: key);

  TextEditingController frameOneController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController frameOneController1 = TextEditingController();

  TextEditingController frameOneController2 = TextEditingController();

  TextEditingController frameOneController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 32.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.h, right: 24.h, bottom: 5.v),
                              child: Column(children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("School",
                                        style: theme.textTheme.titleSmall)),
                                SizedBox(height: 9.v),
                                CustomTextFormField(
                                    controller: frameOneController,
                                    hintText: "Ex: Harvard University"),
                                SizedBox(height: 20.v),
                                _buildInputField1(context),
                                SizedBox(height: 20.v),
                                _buildInputField2(context),
                                SizedBox(height: 18.v),
                                _buildInputField4(context,
                                    endDateLabel: "Start Date",
                                    selectDateLabel: "Select Date"),
                                SizedBox(height: 18.v),
                                _buildInputField4(context,
                                    endDateLabel: "End Date",
                                    selectDateLabel: "Select Date"),
                                SizedBox(height: 18.v),
                                _buildInputField6(context),
                                SizedBox(height: 20.v),
                                _buildInputField7(context)
                              ]))))
                ])),
            bottomNavigationBar: _buildSaveChanges(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgComponent1,
            margin: EdgeInsets.only(left: 24.h, top: 13.v, bottom: 13.v),
            onTap: () {
              onTapArrowBack(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Add New Education"));
  }

  /// Section Widget
  Widget _buildInputField1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Degree", style: theme.textTheme.titleSmall),
      SizedBox(height: 7.v),
      CustomDropDown(
          hintText: "Ex: Bachelor",
          items: dropdownItemList,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
          onChanged: (value) {})
    ]);
  }

  /// Section Widget
  Widget _buildInputField2(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Field of study", style: theme.textTheme.titleSmall),
      SizedBox(height: 7.v),
      CustomTextFormField(
          controller: frameOneController1, hintText: "Ex: Business")
    ]);
  }

  /// Section Widget
  Widget _buildInputField6(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Grade", style: theme.textTheme.titleSmall),
      SizedBox(height: 9.v),
      CustomTextFormField(
          controller: frameOneController2, hintText: "Ex: Business")
    ]);
  }

  /// Section Widget
  Widget _buildInputField7(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Description", style: theme.textTheme.titleSmall),
      SizedBox(height: 7.v),
      CustomTextFormField(
          controller: frameOneController3,
          hintText: "Lorem ipsun",
          textInputAction: TextInputAction.done,
          maxLines: 6,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v))
    ]);
  }

  /// Section Widget
  Widget _buildSaveChanges(BuildContext context) {
    return CustomElevatedButton(
        text: "Save Changes",
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 37.v),
        onPressed: () {
          onTapSaveChanges(context);
        });
  }

  /// Common widget
  Widget _buildInputField4(
    BuildContext context, {
    required String endDateLabel,
    required String selectDateLabel,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(endDateLabel,
          style: theme.textTheme.titleSmall!
              .copyWith(color: theme.colorScheme.primary)),
      SizedBox(height: 9.v),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v),
          decoration: AppDecoration.outlineGray
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Text(selectDateLabel,
                    style: CustomTextStyles.titleMediumBluegray400
                        .copyWith(color: appTheme.blueGray400))),
            CustomImageView(
                imagePath: ImageConstant.imgCalendar,
                height: 24.adaptSize,
                width: 24.adaptSize)
          ]))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the experienceSettingScreen when the action is triggered.
  onTapSaveChanges(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.experienceSettingScreen);
  }
}
