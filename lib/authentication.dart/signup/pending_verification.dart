import 'package:buga_driver/authentication.dart/signup/verified.dart';
import 'package:buga_driver/component/button.dart';
import 'package:buga_driver/component/colors.dart';
import 'package:buga_driver/component/style.dart';
import 'package:flutter/material.dart';

class PendingVerificationPage extends StatefulWidget {
  const PendingVerificationPage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PendingVerificationPageState createState() =>
      _PendingVerificationPageState();
}

class _PendingVerificationPageState extends State<PendingVerificationPage> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // used to determined the screen size for responsive design
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: _globalFormKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/verify.png',
                        height: 303,
                        width: 303,
                      ),
                      SizedBox(height: screensize.height * 0.05),
                      Text(
                        'Document Verification Pending',
                        style: style.copyWith(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screensize.width / 8),
                        child: Text(
                          'Your user verification status is pending. We will be in touch with you as soon as the verification is completed...',
                          style: style.copyWith(
                            fontSize: 12.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: screensize.height * 0.2),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30.0, bottom: 10),
                        child: MainButton(
                          backgroundColor: AppColor.primaryColor,
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const VerifiedPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Contact Us',
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
      ),
    );
  }
}
