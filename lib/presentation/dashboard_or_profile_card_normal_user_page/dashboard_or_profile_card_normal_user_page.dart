import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'models/dashboard_or_profile_card_normal_user_model.dart';
import 'provider/dashboard_or_profile_card_normal_user_provider.dart'; // ignore_for_file: must_be_immutable

class DashboardOrProfileCardNormalUserPage extends StatefulWidget {
  const DashboardOrProfileCardNormalUserPage({Key? key})
      : super(
          key: key,
        );

  @override
  DashboardOrProfileCardNormalUserPageState createState() =>
      DashboardOrProfileCardNormalUserPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardOrProfileCardNormalUserProvider(),
      child: DashboardOrProfileCardNormalUserPage(),
    );
  }
}

class DashboardOrProfileCardNormalUserPageState
    extends State<DashboardOrProfileCardNormalUserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.outlineGrayE,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildContainer22(context),
              SizedBox(height: 25.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 84.h,
                  right: 79.h,
                ),
                child: _buildContainer34(
                  context,
                  pointsText: "lbl_wastes_scanned".tr,
                  zeroOneText: "lbl_0".tr,
                ),
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 84.h,
                  right: 78.h,
                ),
                child: _buildContainer34(
                  context,
                  pointsText: "lbl_points".tr,
                  zeroOneText: "lbl_0".tr,
                ),
              ),
              SizedBox(height: 13.v),
              CustomElevatedButton(
                height: 50.v,
                width: 135.h,
                text: "lbl_gallery".tr,
                leftIcon: Container(
                  margin: EdgeInsets.only(right: 6.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgImage2,
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                  ),
                ),
                buttonStyle: CustomButtonStyles.fillYellow,
                buttonTextStyle: CustomTextStyles.bodyLargeLightgreen90001,
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildContainer22(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 225.v,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgImage12,
                        height: 145.v,
                        width: 414.h,
                        radius: BorderRadius.vertical(
                          top: Radius.circular(12.h),
                        ),
                      ),
                      SizedBox(height: 34.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgCut,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.only(right: 125.h),
                      )
                    ],
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle,
                  height: 160.adaptSize,
                  width: 160.adaptSize,
                  radius: BorderRadius.circular(
                    80.h,
                  ),
                  alignment: Alignment.bottomCenter,
                )
              ],
            ),
          ),
          SizedBox(height: 3.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 2.v),
                child: Text(
                  "lbl_username2".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgQrCodeScanner,
                height: 24.adaptSize,
                width: 24.adaptSize,
                margin: EdgeInsets.only(left: 1.h),
              )
            ],
          ),
          SizedBox(height: 18.v),
          Text(
            "lbl_jane_doe".tr,
            style: CustomTextStyles.titleLargeInterBluegray900,
          ),
          Text(
            "msg_nulla_dolor_culpa".tr,
            style: CustomTextStyles.bodyLargeGray500,
          ),
          SizedBox(height: 20.v),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 160.h,
                right: 119.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgAccount,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 10.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 6.h,
                      top: 9.v,
                      bottom: 9.v,
                    ),
                    child: Text(
                      "lbl_user".tr,
                      style: CustomTextStyles.bodyMediumGreen600_1,
                    ),
                  ),
                  Spacer(),
                  CustomIconButton(
                    height: 36.adaptSize,
                    width: 36.adaptSize,
                    padding: EdgeInsets.all(10.h),
                    decoration: IconButtonStyleHelper.outlineGray,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgMoreVert,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10.v)
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildContainer34(
    BuildContext context, {
    required String pointsText,
    required String zeroOneText,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 94.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIconButton(
            height: 62.v,
            width: 60.h,
            padding: EdgeInsets.all(9.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowUp3Onprimarycontainer,
            ),
          ),
          SizedBox(height: 5.v),
          Text(
            pointsText,
            style: CustomTextStyles.bodySmallEpilogueGray500.copyWith(
              color: appTheme.gray500,
            ),
          ),
          SizedBox(height: 7.v),
          Text(
            zeroOneText,
            style: theme.textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.onPrimary.withOpacity(1),
            ),
          ),
          SizedBox(height: 6.v)
        ],
      ),
    );
  }
}
