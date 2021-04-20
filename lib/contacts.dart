import 'package:flutter/material.dart';

class Contacts extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ContactsState();
  }
}

class ContactsState extends State {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage("images/av4.png")),
            title: Text("Doha Noaman"),
            subtitle: Text("eng_doha_noaman"),
          ),
          ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.nj.com/resizer/h8MrN0-Nw5dB5FOmMVGMmfVKFJo=/450x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/SJGKVE5UNVESVCW7BBOHKQCZVE.jpg")),
            title: Text("Ahmed Essa"),
            subtitle: Text("eng_ahmed_essa"),
          ),
          ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage("images/av2.jpg")),
            title: Text("Adam Essa"),
            subtitle: Text("dr_adam_essa"),
          ),
          ListTile(
            leading: CircleAvatar(
                backgroundImage: AssetImage("images/av3.jpg")),
            title: Text("Dalida Essa"),
            subtitle: Text("dr_dalida_essa"),
          ),
        ],
      ),
    );
  }
}



