import 'package:buga_driver/authentication.dart/signup/createprofile.dart';
import 'package:buga_driver/authentication.dart/signup/pending_verification.dart';
import 'package:buga_driver/authentication.dart/signup/upload_address.dart';
import 'package:buga_driver/authentication.dart/signup/upload_driving_license.dart';
import 'package:buga_driver/authentication.dart/signup/upload_id_card.dart';
import 'package:buga_driver/component/colors.dart';
import 'package:buga_driver/component/style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileScrollPage extends StatefulWidget {
  const ProfileScrollPage({Key? key}) : super(key: key);

  @override
  State<ProfileScrollPage> createState() => _ProfileScrollPageState();
}

class _ProfileScrollPageState extends State<ProfileScrollPage> {
  final controller = PageController();
  int pageIndex = 0;

//dispose the pageView controller
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List colors = [
    AppColor.primaryColor,
    AppColor.lightGrey,
    AppColor.primaryColor,
    AppColor.primaryColor,
  ];
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: AppColor.white,
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            SmoothPageIndicator(
              controller: controller,
              count: 4,
              effect: ExpandingDotsEffect(
                expansionFactor: 1.1,
                radius: 500,
                dotWidth: screensize.width / 5,
                dotHeight: 3,
                spacing: 10,
                dotColor: AppColor.lightGrey,
                activeDotColor: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() => pageIndex = index);
                  },
                  controller: controller,
                  children: [
                    /// first slide
                    CreateProfile(controller: controller),

                    /// second slide
                    UploadDrivingLicense(controller: controller),

                    /// third slide
                    UploadIDCard(controller: controller),

                    /// fouth slide
                    const UploadAddress()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
