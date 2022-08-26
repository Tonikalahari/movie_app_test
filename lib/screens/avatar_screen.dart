import 'package:flutter/material.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 2),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      width: 115,
                      height: 35,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Site Oficial',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      foregroundColor: Colors.black,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiZfk_mBRRAnMVpDjIrMbiU5DUxjWeZ5nqRQ&usqp=CAU'),
                      radius: 35,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
