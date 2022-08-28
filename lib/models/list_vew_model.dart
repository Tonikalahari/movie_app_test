import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListViewModel extends StatefulWidget {
  String title;
  IconButton? icon;
  Function onPressed;
  ListViewModel({
    Key? key,
    required this.title,
    this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ListViewModel> createState() => _ListViewModelState();
}

bool isPressed = false;

class _ListViewModelState extends State<ListViewModel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
        ),
        width: 300,
        height: 75,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 250,
                  child: Center(
                    child: Text(
                      widget.title,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isPressed = true;
                    });
                  },
                  icon: isPressed == true
                      ? const Icon(Icons.favorite, size: 40, color: Colors.white)
                      : const Icon(Icons.favorite_outline, size: 40, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
