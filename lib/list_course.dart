import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class list_course extends StatelessWidget {
  const list_course({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(

    // );
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Card(
            child: ListTile(
                title: Text("Mobile Developer"),
                subtitle: Text("Flutter and Java."),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.istockphoto.com/id/photo/konsep-rapat-tim-kerja-pengusaha-menggunakan-ponsel-pintar-dan-tablet-digital-dan-gm1371339413-440701926")),
                trailing: Icon(Icons.star))),
      ],
    );
  }
}
