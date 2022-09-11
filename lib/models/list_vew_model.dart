import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListViewModel extends StatefulWidget {
  String title;
  IconData icon;
  Color? color;
  ListViewModel({
    Key? key,
    required this.title,
    required this.icon,
    this.color,
  }) : super(key: key);

  @override
  State<ListViewModel> createState() => _ListViewModelState();
}

class _ListViewModelState extends State<ListViewModel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: widget.color == null ? Colors.white : widget.color!),
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
                  onPressed: () {},
                  icon: Icon(widget.icon, size: 40, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
