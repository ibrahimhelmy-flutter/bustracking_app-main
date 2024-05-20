import 'package:cloud_firestore/cloud_firestore.dart';

// class TripsTimesModel {
//   TripsTimesModel(
//       {required this.arrival_time,
//       required this.trip_id,
//       required this.stop_sequence});
//   final arrival_time;
//   final trip_id;
//   final stop_sequence;

// // var g = TripsTimesModel.trip_id;
// }

// final fireStoreDb = FirebaseFirestore.instance;
// TripsTimesModel? tripsTimeModelList;
// String tripId = '';
// void tripsTime(String routeId) {
//   // fireStoreDb.collection('stop_times').doc().get().then((value) {
//   //   TripsModelList.add(TripsTimesModel(
//   //       arrival_time: value['arrival_time'],
//   //       trip_id: value['trip_id'],
//   //       stop_sequence: value['stop_sequence']));
//   // });

//   fireStoreDb
//       .collection('trips')
//       .where('route_id', isEqualTo: routeId)
//       .get()
//       .then((value) {
//     print('${value.docs.single.id}  test');
//     tripId = value.docs.single.id;
//   });
//   fireStoreDb
//       .collection('stop_times')
//       .where('trip_id', isEqualTo: tripId)
//       .get()
//       .then((value) {
//     var data = value.docs;
//     tripsTimeModelList = TripsTimesModel(
//         arrival_time: data.single['arrival_time'],
//         trip_id: data.single['trip_id'],
//         stop_sequence: data.single['stop_sequence']);
//   });
// }

// List<TripsTimesModel> getTripsTime() {
//   return TripsTimeModelList;
// }

// void getTrips(){
// fireStoreDb.collection('trips').doc(getTripsTime().)
// }
