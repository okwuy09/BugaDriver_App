import 'dart:io';

import 'package:buga_driver/component/button.dart';
import 'package:buga_driver/component/colors.dart';
import 'package:buga_driver/component/style.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class UploadDrivingLicense extends StatefulWidget {
  final PageController controller;
  const UploadDrivingLicense({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UploadDrivingLicenseState createState() => _UploadDrivingLicenseState();
}

class _UploadDrivingLicenseState extends State<UploadDrivingLicense> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  final picker = ImagePicker();

  XFile? frontImage;
  XFile? backImage;

  pickFrontImage(
    ImageSource source,
  ) async {
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 50,
      maxHeight: 700,
      maxWidth: 650,
    );
    if (mounted) {
      setState(() {
        frontImage = pickedFile;
      });
    }
  }

  pickBackImage(
    ImageSource source,
  ) async {
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 50,
      maxHeight: 700,
      maxWidth: 650,
    );
    if (mounted) {
      setState(() {
        backImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // used to determined the screen size for responsive design
    var screensize = MediaQuery.of(context).size;
    return ListView(
      children: [
        Form(
          key: _globalFormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Upload Driving License',
                      style: style.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'We will need to see your driving’s license before we can validate you as a driver.',
                      style: style.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    // front view
                    SizedBox(height: screensize.height * 0.02),
                    Text(
                      'Front View',
                      style: style.copyWith(
                        fontSize: 14.0,
                        color: AppColor.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),

                    DottedBorder(
                      borderType: BorderType.RRect,
                      color: AppColor.primaryColor,
                      strokeWidth: 1,
                      dashPattern: const [8, 4],
                      padding: EdgeInsets.zero,
                      radius: const Radius.circular(4),
                      child: frontImage == null
                          ? InkWell(
                              onTap: () => pickFrontImage(ImageSource.gallery),
                              child: SizedBox(
                                height: 200,
                                width: screensize.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/upload.png',
                                      height: 35,
                                      width: 35,
                                    ),
                                    const SizedBox(height: 20),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Click here to',
                                        style: style.copyWith(
                                          fontSize: 12,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: ' Upload ',
                                            style: style.copyWith(
                                              color: AppColor.primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'image',
                                            style: style.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Stack(
                              children: [
                                Container(
                                  height: 200,
                                  width: screensize.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(frontImage!.path),
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: (() =>
                                        pickFrontImage(ImageSource.gallery)),
                                    child: Container(
                                      width: screensize.width / 7,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/upload.png',
                                            height: 18,
                                            width: 18,
                                            color: AppColor.white,
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'Change',
                                            style: style.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),

                    // back view
                    SizedBox(height: screensize.height * 0.03),
                    Text(
                      'Back View',
                      style: style.copyWith(
                        fontSize: 14.0,
                        color: AppColor.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      color: AppColor.primaryColor,
                      strokeWidth: 1,
                      dashPattern: const [8, 4],
                      padding: EdgeInsets.zero,
                      radius: const Radius.circular(4),
                      child: backImage == null
                          ? InkWell(
                              onTap: () => pickBackImage(ImageSource.gallery),
                              child: SizedBox(
                                height: 200,
                                width: screensize.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/upload.png',
                                      height: 35,
                                      width: 35,
                                    ),
                                    const SizedBox(height: 20),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Click here to',
                                        style: style.copyWith(
                                          fontSize: 12,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: ' Upload ',
                                            style: style.copyWith(
                                              color: AppColor.primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'image',
                                            style: style.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Stack(
                              children: [
                                Container(
                                  height: 200,
                                  width: screensize.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(backImage!.path),
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: (() =>
                                        pickBackImage(ImageSource.gallery)),
                                    child: Container(
                                      width: screensize.width / 7,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/upload.png',
                                            height: 18,
                                            width: 18,
                                            color: AppColor.white,
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'Change',
                                            style: style.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: screensize.height * 0.06),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, bottom: 10),
                      child: MainButton(
                        backgroundColor:
                            (frontImage != null && backImage != null)
                                ? AppColor.primaryColor
                                : AppColor.inactiveButton,
                        onTap: () {
                          if (frontImage != null && backImage != null) {
                            widget.controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
