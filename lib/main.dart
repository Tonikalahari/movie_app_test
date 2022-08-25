import 'package:flutter/material.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieAppCharacterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MovieAppCharacterScreen extends StatelessWidget {

  final tabViews = <String>[
    'Filmes', 'Personagens', 'Favoritos'
  ];

  MovieAppCharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 2, left: 8, right: 8),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      width: 100,
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
            Padding(
              padding: const EdgeInsets.only(top:35.0, left: 2, right: 2),
              child: SizedBox(
                height: 40,
                width: double.maxFinite,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tabViews.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: const EdgeInsets.all(2),
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                          border: Border.all(width: 1, color: Colors.black),
                        ),
                        child: Center(child: Text(tabViews[index])),
                      );
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
