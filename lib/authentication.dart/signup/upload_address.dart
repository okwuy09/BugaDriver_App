import 'dart:io';
import 'package:buga_driver/authentication.dart/signup/pending_verification.dart';
import 'package:buga_driver/component/button.dart';
import 'package:buga_driver/component/colors.dart';
import 'package:buga_driver/component/style.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class UploadAddress extends StatefulWidget {
  const UploadAddress({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UploadAddressState createState() => _UploadAddressState();
}

class _UploadAddressState extends State<UploadAddress> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  final picker = ImagePicker();

  XFile? addressImage;

  pickAddressImage(
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
        addressImage = pickedFile;
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
                      'Upload Proof Of Residence',
                      style: style.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'We will also need to see your proof of residence before we can validate you as a driver.',
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
                      child: addressImage == null
                          ? InkWell(
                              onTap: () =>
                                  pickAddressImage(ImageSource.gallery),
                              child: SizedBox(
                                height: 400,
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
                                  height: 400,
                                  width: screensize.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(addressImage!.path),
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
                                        pickAddressImage(ImageSource.gallery)),
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

                    SizedBox(height: screensize.height * 0.12),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, bottom: 10),
                      child: MainButton(
                        backgroundColor: (addressImage != null)
                            ? AppColor.primaryColor
                            : AppColor.inactiveButton,
                        onTap: () {
                          if (addressImage != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const PendingVerificationPage(),
                              ),
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
