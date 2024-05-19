import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/signup_model.dart';
import 'provider/signup_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SignupScreenState createState() => SignupScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupProvider(),
      child: SignupScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 52.h,
                vertical: 46.v,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 174.v,
                    width: 288.h,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "lbl_welcome".tr,
                            style: theme.textTheme.displaySmall,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgImage4162x288,
                          height: 162.v,
                          width: 288.h,
                          alignment: Alignment.topCenter,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 32.v),
                  _buildWelcomeSection(context),
                  SizedBox(height: 6.v),
                  _buildUsernameSection(context),
                  SizedBox(height: 6.v),
                  _buildContactNumberSection(context),
                  SizedBox(height: 6.v),
                  _buildPasswordSection(context),
                  SizedBox(height: 6.v),
                  _buildConfirmPasswordSection(context),
                  SizedBox(height: 16.v),
                  _buildIAgreeWithTermsSection(context),
                  SizedBox(height: 75.v),
                  CustomElevatedButton(
                    height: 52.v,
                    text: "lbl_sign_up".tr,
                    buttonStyle: CustomButtonStyles.outlineOnPrimary,
                    buttonTextStyle:
                        CustomTextStyles.bodyLargeOnPrimaryContainer18,
                  ),
                  SizedBox(height: 4.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        onTapTxtAlreadyhavean(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "msg_already_have_an2".tr,
                                style: CustomTextStyles.bodyMediumBluegray800,
                              ),
                              TextSpan(
                                text: "lbl_log_in".tr,
                                style: CustomTextStyles.titleSmallGreen600
                                    .copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: "lbl_here".tr,
                                style: CustomTextStyles.bodyMediumGreen600,
                              )
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 58.v),
                  Padding(
                    padding: EdgeInsets.only(right: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 7.v,
                            bottom: 6.v,
                          ),
                          child: SizedBox(
                            width: 93.h,
                            child: Divider(),
                          ),
                        ),
                        Text(
                          "lbl_or_sign_up_with".tr.toUpperCase(),
                          style: CustomTextStyles.labelLargeBluegray500,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 7.v,
                            bottom: 6.v,
                          ),
                          child: SizedBox(
                            width: 93.h,
                            child: Divider(),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 3.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 77.h,
                      right: 84.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgGoogle1,
                          height: 28.adaptSize,
                          width: 28.adaptSize,
                        ),
                        Spacer(
                          flex: 50,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgLogoFacebook1,
                          height: 28.adaptSize,
                          width: 28.adaptSize,
                        ),
                        Spacer(
                          flex: 50,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgApple1,
                          height: 28.adaptSize,
                          width: 28.adaptSize,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 7.v)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWelcomeSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_full_name".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 3.v),
          Selector<SignupProvider, TextEditingController?>(
            selector: (context, provider) => provider.fullNameController,
            builder: (context, fullNameController, child) {
              return CustomTextFormField(
                controller: fullNameController,
                hintText: "lbl_enter_full_name".tr,
                hintStyle: CustomTextStyles.bodyMediumGray500,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 10.v, 6.h, 9.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgProfile,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 35.v,
                ),
                validator: (value) {
                  if (!isText(value)) {
                    return "err_msg_please_enter_valid_text".tr;
                  }
                  return null;
                },
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUsernameSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_username".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 3.v),
          Selector<SignupProvider, TextEditingController?>(
            selector: (context, provider) => provider.userNameController,
            builder: (context, userNameController, child) {
              return CustomTextFormField(
                controller: userNameController,
                hintText: "lbl_enter_username".tr,
                hintStyle: CustomTextStyles.bodyMediumGray500,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 10.v, 6.h, 9.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgProfile,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 35.v,
                ),
                validator: (value) {
                  if (!isText(value)) {
                    return "err_msg_please_enter_valid_text".tr;
                  }
                  return null;
                },
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContactNumberSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_contact_number".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 3.v),
          Selector<SignupProvider, TextEditingController?>(
            selector: (context, provider) => provider.phoneController,
            builder: (context, phoneController, child) {
              return CustomTextFormField(
                controller: phoneController,
                hintText: "lbl_09".tr,
                hintStyle: CustomTextStyles.bodyMediumGray500,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 10.v, 6.h, 9.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgPhone,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 35.v,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_password".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 3.v),
          Consumer<SignupProvider>(
            builder: (context, provider, child) {
              return CustomTextFormField(
                controller: provider.passwordController,
                hintText: "lbl_enter_password".tr,
                hintStyle: CustomTextStyles.bodyMediumGray500,
                textInputType: TextInputType.visiblePassword,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 10.v, 6.h, 9.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgLockOnprimary,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 35.v,
                ),
                suffix: InkWell(
                  onTap: () {
                    provider.changePasswordVisibility();
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 10.v, 11.h, 9.v),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgHide,
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                    ),
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: 35.v,
                ),
                validator: (value) {
                  if (value == null ||
                      (!isValidPassword(value, isRequired: true))) {
                    return "err_msg_please_enter_valid_password".tr;
                  }
                  return null;
                },
                obscureText: provider.isShowPassword,
                contentPadding: EdgeInsets.symmetric(vertical: 9.v),
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirmPasswordSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "msg_confirm_password".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 3.v),
          Consumer<SignupProvider>(
            builder: (context, provider, child) {
              return CustomTextFormField(
                controller: provider.confirmpasswordController,
                hintText: "msg_re_enter_password".tr,
                hintStyle: CustomTextStyles.bodyMediumGray500,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                prefix: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 10.v, 6.h, 9.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgLockOnprimary,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 35.v,
                ),
                suffix: InkWell(
                  onTap: () {
                    provider.changePasswordVisibility1();
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 10.v, 11.h, 9.v),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgHide,
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                    ),
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: 35.v,
                ),
                validator: (value) {
                  if (value == null ||
                      (!isValidPassword(value, isRequired: true))) {
                    return "err_msg_please_enter_valid_password".tr;
                  }
                  return null;
                },
                obscureText: provider.isShowPassword1,
                contentPadding: EdgeInsets.symmetric(vertical: 9.v),
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildIAgreeWithTermsSection(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 14.h),
        child: Selector<SignupProvider, bool?>(
          selector: (context, provider) => provider.iAgreeWithTermsSection,
          builder: (context, iAgreeWithTermsSection, child) {
            return CustomCheckboxButton(
              alignment: Alignment.centerLeft,
              text: "msg_i_agree_with_terms".tr,
              value: iAgreeWithTermsSection,
              onChange: (value) {
                context.read<SignupProvider>().changeCheckBox(value);
              },
            );
          },
        ),
      ),
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtAlreadyhavean(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
