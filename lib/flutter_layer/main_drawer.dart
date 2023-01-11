import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        ListTile(
          title: Text('Blood Ruby'),
          leading: Image.asset(
            'assets/images/red_gem.png',
            width: 64,
            height: 64,
          ),
        ),
      ],
    ));
  }
}
