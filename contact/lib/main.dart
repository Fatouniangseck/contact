import 'package:flutter/material.dart';

void main() {
  runApp(ContactApp());
}

class ContactApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ContactList(),
    );
  }
}

class ContactList extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {'nom': 'Alice Dupont', 'telephone': '0612345678'},
    {'nom': 'Bob Martin', 'telephone': '0687654321'},
    {'nom': 'Charlie Leblanc', 'telephone': '0711223344'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          final nom = contact['nom'] ?? 'Nom inconnu';
          final telephone = contact['telephone'] ?? 'Numéro inconnu';
          final initials = nom.isNotEmpty ? nom[0].toUpperCase() : '?';

          return ListTile(
            leading: CircleAvatar(child: Text(initials)),
            title: Text(nom),
            subtitle: Text(telephone),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetails(contact: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  final Map<String, String> contact;

  ContactDetails({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détails du contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nom: ${contact['nom']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(
              'Téléphone: ${contact['telephone']}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
