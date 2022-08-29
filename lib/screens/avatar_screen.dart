
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
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
                      FluttermojiCircleAvatar(
                        backgroundColor: Colors.grey[800],
                        radius: 35,
                      ),
                    ],
                  ),
                ),
              ),
             Column(children: [
                 FluttermojiCircleAvatar(
                  backgroundColor: Colors.grey[800],
                 ),
                 const SizedBox(height: 20,),
                FluttermojiCustomizer(
                  scaffoldHeight: MediaQuery.of(context).size.height * 0.6, 
                  scaffoldWidth: MediaQuery.of(context).size.width * 0.98,
                  autosave: false,
                  theme: FluttermojiThemeData(
                    labelTextStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    primaryBgColor: Colors.black.withOpacity(0.4),
                    secondaryBgColor: Colors.grey[800],
                      boxDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                      )),
                )
               ],),
            ],
          ),
        ),
      ),
    );
  }
}
