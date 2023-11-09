import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekahanfirebase/screens/views_info_lugar/air_quality.dart';
import 'package:ekahanfirebase/services/servicesOpenAi.dart';
import 'package:geocoding/geocoding.dart';

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
    final query = await collectionReferenceUsers
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();
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

Future<DocumentSnapshot> getLugar(String lugarID) async {
  DocumentSnapshot lugarDoc =
      await FirebaseFirestore.instance.collection('lugares').doc(lugarID).get();
  return lugarDoc;
}

Future<List> getInfo(lugarID) async {
  List infos = [];
  DocumentSnapshot lugarDoc = await getLugar(lugarID);
  String lugar = lugarDoc.get('lugar');
  String message = await getMessagePlace(lugar);
  String emblematico = await getCoordsPlace(lugar);

  //Push datos
  infos.add(lugar);
  infos.add(message); //1
  infos.add(emblematico); //2

  //Se obtienen las cordenadas
  List<Location> locations = await locationFromAddress(emblematico);
  if (locations.isNotEmpty) {
    Location location = locations.first;
    double latitude = location.latitude;
    double longitude = location.longitude;
    //agregamos latitude y longitude
    infos.add(latitude); //3
    infos.add(longitude); //4

    String airCategory = await fetchAirQualityData(latitude, longitude);
    infos.add(airCategory); //
  }

  return infos;
}

Future<List<Map<String, dynamic>>> getLugares() async {
  List<Map<String, dynamic>> lugares = [];
  CollectionReference collectionReferenceLugares = db.collection('lugares');
  QuerySnapshot queryLugares = await collectionReferenceLugares.get();
  for (var document in queryLugares.docs) {
    Map<String, dynamic> lugarData = document.data() as Map<String, dynamic>;
    lugarData['id'] = document.id; // Agrega el ID del documento a los datos
    lugares.add(lugarData);
  }
  return lugares;
}

Future<List<Map<String, dynamic>>> getPaquetes(lugarID) async {
  List<Map<String, dynamic>> lugares = [];
  final CollectionReference collectionReferencePaquetes =
      db.collection('paquetes');
  QuerySnapshot queryLugares = await collectionReferencePaquetes
      .where('LugarID', isEqualTo: lugarID)
      .get();
  for (var document in queryLugares.docs) {
    Map<String, dynamic> lugarData = document.data() as Map<String, dynamic>;
    lugarData['id'] = document.id; // Agrega el ID del documento a los datos
    lugares.add(lugarData);
  }
  return lugares;
}
/*final collectionReferenceUsers = db.collection('usuarios');
    final query = await collectionReferenceUsers
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();
    return query.docs.isNotEmpty; */
