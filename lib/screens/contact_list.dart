import 'package:chat_app/screens/chatting_page.dart';
import 'package:flutter/material.dart';
//import 'tooltip';

class ContactListPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'Aamir', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Alia', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Arjun', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Amith Shah', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Balayya Babu', photoUrl: 'assets/129.jpg'),
    Contact(name: 'CBN', photoUrl: 'assets/129.jpg'),
    Contact(name: 'God Father', photoUrl: 'assets/129.jpg'),
    Contact(name: 'CM Jagan', photoUrl: 'assets/129.jpg'),
    Contact(name: 'KTR', photoUrl: 'assets/129.jpg'),
    Contact(name: 'PM Modi', photoUrl: 'assets/129.jpg'),
    Contact(name: 'RGV', photoUrl: 'assets/129.jpg'),
    Contact(name: 'SKY', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Suresh Raina', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Prathyaksh', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Prabhas', photoUrl: 'assets/129.jpg'),
    Contact(name: 'Zain Malik', photoUrl: 'assets/129.jpg'),

    // Add more contacts here...
  ];
  final Function(Contact) onContactSelected;

  ContactListPage({required this.onContactSelected});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search logic here
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(contact.photoUrl),
            ),
            title: GestureDetector(
              onTap: () {
                onContactSelected(contact);
                Navigator.pop(context);
                // Navigate to the chat page of the contact pop it and then go to the chatting page using nav.push
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatingPage(contact: contact),
                  ),
                );
              },
              child: Tooltip(
                message: 'Start a new chat',
                child: Text(
                  contact.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.group_add,
                size: 30,
              ),
              tooltip: 'add to existing group',
              onPressed: () {
                onContactSelected(contact);
                Navigator.pop(context, contact);
                // Navigate  to the chatting page using nav.pop and add the returned contact to list
              },
            ),
          );
        },
      ),
    );
  }
}

class Contact {
  final String name;
  final String photoUrl;

  Contact({required this.name, required this.photoUrl});
}
