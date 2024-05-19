import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'models/login_model.dart';
import 'provider/login_provider.dart';
import '../signup_screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LoginScreenState createState() => LoginScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: LoginScreen(),
    );
  }
}

class LoginScreenState extends State<LoginScreen> {
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
          child: SizedBox(
            height: SizeUtils.height,
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 51.h,
                  vertical: 57.v,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 47.v),
                    SizedBox(
                      height: 173.v,
                      width: 288.h,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgImage4162x288,
                            height: 162.v,
                            width: 288.h,
                            alignment: Alignment.topCenter,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "msg_hi_welcome_back".tr,
                              style: CustomTextStyles
                                  .headlineLargePrimaryContainer,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 94.v),
                    _buildUsernameSection(context),
                    SizedBox(height: 6.v),
                    _buildPasswordSection(context),
                    SizedBox(height: 14.v),
                    _buildRememberPasswordSection(context),
                    SizedBox(height: 93.v),
                    CustomElevatedButton(
                      height: 52.v,
                      text: "lbl_login2".tr,
                      buttonStyle: CustomButtonStyles.outlineOnPrimaryTL26,
                      buttonTextStyle:
                          CustomTextStyles.bodyLargeOnPrimaryContainer18,
                    ),
                    SizedBox(height: 4.v),
                    // Sign up button section
					_buildSignUpButton(context),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 3.h),
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
                            "lbl_or_login_with".tr.toUpperCase(),
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
                        left: 80.h,
                        right: 83.h,
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  // Sign up button section widget
  Widget _buildSignUpButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.h),
      child: GestureDetector(
        onTap: () {
          // Navigate to the sign-up screen
          Navigator.pushNamed(context, AppRoutes.signupScreen);
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "msg_don_t_have_an_account2".tr,
                style: CustomTextStyles.bodyMediumBluegray800,
              ),
              TextSpan(
                text: "lbl_sign_up".tr,
                style: CustomTextStyles.titleSmallGreen600.copyWith(
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
    );
  }

  /// Section Widget
  Widget _buildUsernameSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_username".tr,
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 3.v),
        Selector<LoginProvider, TextEditingController?>(
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
    );
  }

  /// Section Widget
  Widget _buildPasswordSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_password".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 3.v),
          Consumer<LoginProvider>(
            builder: (context, provider, child) {
              return CustomTextFormField(
                controller: provider.passwordController,
                hintText: "lbl_enter_password".tr,
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
  Widget _buildRememberPasswordSection(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Selector<LoginProvider, bool?>(
        selector: (context, provider) => provider.rememberPasswordSection,
        builder: (context, rememberPasswordSection, child) {
          return CustomCheckboxButton(
            alignment: Alignment.centerLeft,
            text: "msg_remember_password".tr,
            value: rememberPasswordSection,
            textStyle: theme.textTheme.bodyMedium,
            onChange: (value) {
              context.read<LoginProvider>().changeCheckBox(value);
            },
          );
        },
      ),
    );
  }
}
