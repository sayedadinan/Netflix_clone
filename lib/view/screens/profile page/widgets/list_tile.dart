import 'package:flutter/material.dart';

class Listtile extends StatelessWidget {
  Listtile(
      {super.key,
      required this.title,
      required this.color,
      required this.icon});
  final String title;
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          // color: Colors.re,
          width: 35,
          height: 35,
          // color: color,
          // color: Colors.amber,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Icon(
            icon,
            color: Colors.white,
          )),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      trailing: const Padding(
        padding: EdgeInsets.all(9),
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
