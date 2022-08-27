import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:movie_app_test/screens/web_site_view.dart';

import 'avatar_screen.dart';

class SiteScreen extends StatefulWidget {
  const SiteScreen({Key? key}) : super(key: key);

  @override
  State<SiteScreen> createState() => _SiteScreenState();
}

class _SiteScreenState extends State<SiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 2, right: 2),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        width: 115,
                        height: 35,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Site Oficial',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AvatarScreen()),
                        );
                      },
                      child:FluttermojiCircleAvatar(
                        backgroundColor: Colors.grey[800],
                        radius: 35,
                      ),
                    ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const WebSitePageView(),
               ),
            ],
          ),
        ),
      ),
    );
  }
}


