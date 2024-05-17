import 'package:flutter/material.dart';

class ListTileInformation extends StatelessWidget {
  const ListTileInformation({
    required this.text,
    required this.icon,
    super.key,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity:const VisualDensity(vertical: -3),
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 15,
        ),
      ),
    );
  }
}
