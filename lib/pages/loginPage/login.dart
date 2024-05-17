import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/app_logo.dart';
// import 'package:newsapp/pages/homePage/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: Container(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'https://imgs.search.brave.com/DC2ePJbiwbKIdEvZGg-59sIjpF_rVHzWg2OggqBGN8E/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE1/Nzg2NjI5OTY0NDIt/NDhmNjAxMDNmYzk2/P3E9ODAmdz0xMDAw/JmF1dG89Zm9ybWF0/JmZpdD1jcm9wJml4/bGliPXJiLTQuMC4z/Jml4aWQ9TTN3eE1q/QTNmREI4TUh4bGVI/QnNiM0psTFdabFpX/UjhNVFo4Zkh4bGJu/d3dmSHg4Zkh3PQ',
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
               AppLogo(logoFontSize: 44.sp),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/authentication',
                      arguments: false);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r)),
                  minimumSize: Size(700.w, 50.h),
                  // maximumSize: const Size(700, 50),
                  backgroundColor: const Color.fromARGB(251, 223, 224, 227),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/icons/google.png')),
                    const Text(
                      'Sign up with Google',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, '/SignIn');
                  Navigator.pushNamed(context, '/authentication',
                      arguments: true);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(700, 50),
                  backgroundColor: const Color.fromARGB(255, 31, 33, 33),
                ),
                child: const Text(
                  'Log into my account',
                  style: TextStyle(
                    color: Color.fromARGB(255, 29, 154, 33),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'By creating account you accept terms of use and privacy policy',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
