import 'package:flutter/material.dart';

void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeScreen(),
    );
  }
}

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {


  List<Contact> contacts = [
    Contact(name: "Pranto", email: "@example.com", phone: "01500000000"),
    Contact(name: "Alex Pranto", email: "@example.com", phone: "01500000000"),
    Contact(name: "Pranto P.", email: "@example.com", phone: "01500000000"),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Contact List")),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            onTap: () {
              sheet(index);
            },
          );
        },
      ),
    );
  }
  void sheet(index){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Contact Details",style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold),),

                  Text(contacts[index].name),
                  Text(contacts[index].phone),
                  Text(contacts[index].email),
                ],
              ),
            ),
          );
        }
    );
  }
}

class Contact{
  String name;
  String phone;
  String email;

  Contact({required this.name, required this.email, required this.phone});
}