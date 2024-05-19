import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'models/welcome_model.dart';
import 'provider/welcome_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeProvider(),
      child: WelcomeScreen(),
    );
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      // Navigate to the next screen after the delay
      Navigator.pushNamed(context, AppRoutes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 288.v),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage4,
                height: 118.v,
                width: 185.h,
              ),
              SizedBox(height: 5.v),
              Text(
                "lbl_mapuslan".tr,
                style: theme.textTheme.headlineLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
