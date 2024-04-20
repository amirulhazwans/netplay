import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:net_play/bottom_nav/nav_home.dart';
import 'package:net_play/appbar/app_bar.dart';
import 'package:net_play/drawer/drawer_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    checkUserSignIn();
  }

  Future<void> checkUserSignIn() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      print('User is already signed in: ${user.uid}');
    } else {
      print('User is not signed in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: MainScreen(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<List<UserModel>>(
              stream: _readData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                final users = snapshot.data;
                if (users == null || users.isEmpty) {
                  return Center(child: Text(""));
                }
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text('Reservation Content'),
                      Column(
                        children: users.map((user) {
                          return ListTile(
                            leading: GestureDetector(
                              onTap: () {
                                _deleteData(user.id!);
                              },
                              child: Icon(Icons.delete),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                _updateData(
                                  UserModel(
                                    id: user.id,
                                    username: "John Wick",
                                    address: "Pakistan",
                                  ),
                                );
                              },
                              child: Icon(Icons.update),
                            ),
                            title: Text(user.username!),
                            subtitle: Text(user.address!),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),

    );
  }

  Stream<List<UserModel>> _readData() {
    final userCollection = FirebaseFirestore.instance.collection("users");

    return userCollection.snapshots().map((querySnapshot) => querySnapshot
        .docs
        .map((e) => UserModel.fromSnapshot(e))
        .toList());
  }

  void _updateData(UserModel userModel) {
    final userCollection = FirebaseFirestore.instance.collection("users");

    final newData = UserModel(
      username: userModel.username,
      id: userModel.id,
      address: userModel.address,
      age: userModel.age,
    ).toJson();

    userCollection.doc(userModel.id!).update(newData);
  }

  void _deleteData(String id) {
    final userCollection = FirebaseFirestore.instance.collection("users");

    userCollection.doc(id).delete();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class UserModel {
  final String? username;
  final String? address;
  final int? age;
  final String? id;

  UserModel({this.id, this.username, this.address, this.age});

  static UserModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return UserModel(
      username: snapshot['username'],
      address: snapshot['address'],
      age: snapshot['age'],
      id: snapshot['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "age": age,
      "id": id,
      "address": address,
    };
  }
}

