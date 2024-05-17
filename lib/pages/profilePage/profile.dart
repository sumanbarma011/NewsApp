import 'dart:io';
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/profile_information.dart';
import 'package:newsapp/pages/profilePage/widget/customize_bottomsheet.dart';
import 'package:newsapp/pages/profilePage/widget/list_tile_information.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? pickedImage;
  Uint8List? _image;

  void changeProfilePic(File choosedPic) {
    setState(() {
      pickedImage = choosedPic;
// print('chooseImg is ${choosedPic}');
      _image = File(choosedPic.path).readAsBytesSync();
      // print(pickedImage);
    });
    // print('-------------log-------------');
    if (pickedImage != null) {
      // print('file name is $pickedImage');
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  // color: Colors.red,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        // color: Colors.amber,
                        width: 110,
                        child: Stack(
                          children: [
                            pickedImage != null
                                ? CircleAvatar(
                                    radius: 50,
                                    // backgroundColor: Colors.grey,
                                    foregroundImage: MemoryImage(_image!),
                                  )
                                : const CircleAvatar(
                                    radius: 50,
                                    foregroundImage: NetworkImage(
                                        'https://imgs.search.brave.com/YuURFlMn0gTr-E7cpdpEyBrycdj6Q0ZzgF2bKZoKDBY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5zcHJvdXRzb2Np/YWwuY29tL3VwbG9h/ZHMvMjAyMi8wNi9w/cm9maWxlLXBpY3R1/cmUuanBlZw'),
                                  ),
                            Positioned(
                              top: 65,
                              left: 65,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    context: context,
                                    builder: (ctx) {
                                      return CustomizeBottomSheet(
                                        chooseImg: changeProfilePic,
                                      );
                                    },
                                  );
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Color.fromARGB(200, 0, 0, 0),
                                  radius: 15,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Tyler Mason',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'tylermason309@gmail.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Become an publisher'),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Account Settings',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      // color: Colors.amber,
                      height: 180,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: accountSetting.length,
                        itemBuilder: (context, index) {
                          return ListTileInformation(
                              text: accountSetting[index],
                              icon: Icons.arrow_forward_ios);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Help & Support',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      // color: Colors.amber,
                      height: 120,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: helpAndSupport.length,
                        itemBuilder: (context, index) {
                          return ListTileInformation(
                              text: helpAndSupport[index],
                              icon: Icons.arrow_forward_ios);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                      ),
                      child: const Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: TextButton(
                  // style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                  onPressed: () async {
                    final call = Uri.parse('tel:+977 9826465045');
                    if (await canLaunchUrl(call)) {
                      launchUrl(call);
                    } else {
                      throw 'Could not launch $call';
                    }
                  },
                  child: const Text(
                    'For further enquiry call ',
                    // style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
