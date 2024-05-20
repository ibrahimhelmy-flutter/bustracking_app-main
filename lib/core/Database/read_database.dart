import 'package:bustrackingapp/core/Database/tripsTime_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class ReadDataBase {
//   final fireStoreDB = FirebaseFirestore.instance;
//   getTrips() {
//     final tripsCollection =
//         fireStoreDB.collection('trips').doc().get().then((value) {
//       var fields = value.data();
//       setTrips(TripsModel(fields!['route_id'], fields['trip_headsign']));
//     });
//   }
  // final stopsCollection = fireStoreDB.collection('stops');
  // final routesCollection = fireStoreDB.collection('routes');
  // final stopsTimesCollection =
  //     fireStoreDB.collection('stop_times').snapshots();

  // void currentTrip() {

  //   // tripsCollection
  // }
// }
