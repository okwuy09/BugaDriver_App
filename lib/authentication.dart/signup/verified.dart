import 'package:buga_driver/authentication.dart/signin/signin.dart';
import 'package:buga_driver/component/button.dart';
import 'package:buga_driver/component/colors.dart';
import 'package:buga_driver/component/style.dart';
import 'package:flutter/material.dart';

class VerifiedPage extends StatefulWidget {
  const VerifiedPage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VerifiedPageState createState() => _VerifiedPageState();
}

class _VerifiedPageState extends State<VerifiedPage> {
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
                        'assets/verified.png',
                        height: 303,
                        width: 303,
                      ),
                      SizedBox(height: screensize.height * 0.05),
                      Text(
                        'You Have Been Verified!',
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
                          'Congratulations. You have been successfully verified as one of the transport partner for BUGA logistics...',
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
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignIn(),
                            ),
                          ),
                          child: Text(
                            'Get Started',
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
