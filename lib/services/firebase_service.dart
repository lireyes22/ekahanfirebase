import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsers() async {
  List users = [];
  CollectionReference collectionReferenceUsers = db.collection('usuarios');
  QuerySnapshot queryUsers = await collectionReferenceUsers.get();
  for (var document in queryUsers.docs) {
    users.add(document.data());
  }
  return users;
}

Future<bool> getUserEP(String email, String password) async {
  try {
    final collectionReferenceUsers = db.collection('usuarios');
    final query = await collectionReferenceUsers.where('email', isEqualTo: email).where('password', isEqualTo: password).get();
    return query.docs.isNotEmpty;
  } catch (e) {
    return false;
  }
}

//Registrar nuevo usuario
Future<bool> addUser(String email, String password, String name,
    String lastName, String mobileNumber) async {
  try {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
      'name': name,
      'lastname': lastName,
      'mobileNumber': mobileNumber
    };
    await db.collection('usuarios').add(data);
    return true;
  } catch (e) {
    return false;
  }
}
