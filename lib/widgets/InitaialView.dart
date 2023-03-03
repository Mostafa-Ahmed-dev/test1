import 'package:flutter/material.dart';
import 'package:test/widgets/HomeView.dart';

import 'CustomButton.dart';
import 'CustomClipper.dart';
import 'CustomText.dart';

class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  IconData icon = Icons.visibility_off;
  bool isobscure = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Form(
        key: formKey,
        child: Scaffold(
          body: Column(
            children: [
              ClipPath(
                clipper: CustomClipperr(),
                child: Container(
                  width: 420,
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                  ),
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const CustomTextField(
                          obscureText: false,
                          label: 'Email',
                          hint: 'Email@example.com',
                          icondata: Icons.email,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomTextField(
                          obscureText: false,
                          label: 'Full Name',
                          hint: 'Name',
                          icondata: Icons.person,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          ontap: () {
                            setState(() {
                              isobscure = !isobscure;
                              if (isobscure == true) {
                                icon = Icons.visibility;
                              } else {
                                icon = Icons.visibility_off;
                              }
                            });
                          },
                          obscureText:
                              icon == Icons.visibility_off ? true : false,
                          textInputType: TextInputType.number,
                          label: 'Password',
                          hint: '*******',
                          icondata: Icons.lock,
                          icondatasuff: icon,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            ontap: () {
                              setState(() {
                                isobscure = !isobscure;
                                if (isobscure == true) {
                                  icon = Icons.visibility;
                                } else {
                                  icon = Icons.visibility_off;
                                }
                              });
                            },
                            obscureText:
                                icon == Icons.visibility_off ? true : false,
                            textInputType: TextInputType.number,
                            label: 'Confirm Password',
                            hint: '*******',
                            icondatasuff: icon,
                            icondata: Icons.lock),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomTextField(
                          obscureText: false,
                          textInputType: TextInputType.number,
                          label: 'Phone',
                          hint: '+200',
                          icondata: Icons.phone,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomButton(
                            onpressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const HomeView();
                                }));
                              }
                            },
                            text: 'Register'),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onpressed: () {},
                          text: 'Login',
                          background: Colors.white,
                          textColor: Colors.purple,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
