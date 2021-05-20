import 'package:flutter/material.dart';
import 'package:taskf1/fetchApi.dart';
import 'package:taskf1/ContactsModel.dart';

class Contacts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactsState();
  }
}

class ContactsState extends State {
  @override
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();
    return FutureBuilder(
        future: fetchApi.fetchContacts(),
        builder: (context, snapchot) {
          List<ContactsModel> contacts = snapchot.data;
          if (snapchot.connectionState != ConnectionState.done) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(contacts[index].imageURL)),
                    title: Text(contacts[index].name),
                    subtitle: Text(contacts[index].phone),
                  );
                });
          }
        });
  }
}
