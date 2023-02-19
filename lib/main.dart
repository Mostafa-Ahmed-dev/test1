import 'package:flutter/material.dart';
import 'package:test/widgets/CustomButton.dart';
import 'package:test/widgets/CustomClipper.dart';
import 'package:test/widgets/CustomText.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                          label: 'Email',
                          hint: 'Email@example.com',
                          icondata: Icons.email,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomTextField(
                          label: 'Full Name',
                          hint: 'Name',
                          icondata: Icons.person,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomTextField(
                          textInputType: TextInputType.number,
                          label: 'Password',
                          hint: '*******',
                          icondata: Icons.lock,
                          icondatasuff: Icons.visibility,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomTextField(
                            textInputType: TextInputType.number,
                            label: 'Confirm Password',
                            hint: '*******',
                            icondatasuff: Icons.visibility,
                            icondata: Icons.lock),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomTextField(
                          textInputType: TextInputType.number,
                          label: 'Phone',
                          hint: '+200',
                          icondata: Icons.phone,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomButton(onpressed: () {}, text: 'Register'),
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
