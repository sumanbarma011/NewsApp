import 'package:flutter/material.dart';
import 'package:newsapp/core/text_widget.dart';
// import 'package:newsapp/pages/homePage/home_page.dart';

class Authentication extends StatefulWidget {
  const Authentication({
    super.key,
  });
  String? onValidate(value) {
    if (value!.isEmpty) {
      return 'Something went wrong';
    } else {
      return null;
    }
  }

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool check = false;
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obsecure = false;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool isLogInStatus = ModalRoute.of(context)!.settings.arguments as bool;
    // final keyboard = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100.0, left: 60, right: 60, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isLogInStatus == true
                  ? const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  : const Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Image.asset('assets/icons/google.png'),
                    ),
                    SizedBox(
                      height: 20,
                      child: Image.asset('assets/icons/facebook.png'),
                    ),
                    SizedBox(
                      height: 20,
                      child: Image.asset('assets/icons/gmail.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      ' or ',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isLogInStatus == false)
                        Column(
                          children: const [
                            TextForm(
                              hintText: 'Enter Your Name',
                              text: 'Name',
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      TextForm(
                        hintText: 'Enter Your Gmail',
                        text: 'Email',
                        validate: widget.onValidate,
                        textEditingController: nameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextForm(
                        hintText: 'Enter Your Password ',
                        text: 'Password',
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              obsecure = !obsecure;
                            });
                          },
                          child: obsecure == false
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        obscureText: obsecure,
                        validate: widget.onValidate,
                        textEditingController: passwordController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  children: [
                    Checkbox(
                      value: check,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          check = value!;
                        });
                      },
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'I agree to the ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Terms and Condition',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: isLogInStatus == true
                    ? () {
//-----------------------    using form key validation      -----------------------------------------//
                        if (!(formkey.currentState!.validate() &&
                            check == true)) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Something went wrong'),
                                  content: const Text('Something went wrong'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Okay'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/homePage', (route) => false);
                        }}

//---------------------   with using controller       ----------------------------------//
                    //     if (nameController.text.isEmpty &&
                    //         passwordController.text.isEmpty &&
                    //         check == false) {
                    //       showDialog(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: const Text('Invalid Input'),
                    //             content: const Text('Something went wrong'),
                    //             actions: [
                    //               ElevatedButton(
                    //                 style: ButtonStyle(
                    //                   backgroundColor:
                    //                       MaterialStateProperty.all(Colors.red),
                    //                 ),
                    //                 onPressed: () {
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: const Text('Okay'),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     } else {
                    //       Navigator.pushNamedAndRemoveUntil(
                    //           context, '/homePage', (route) => false);
                    //     }
                    //   }
                    : () {},
                child: isLogInStatus == true
                    ? const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      )
                    : const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
