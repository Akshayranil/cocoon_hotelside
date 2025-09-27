import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoon_hotelside/model/room_model.dart';

Future<void> addRoom(String hotelId, Room room) async {
  final roomDoc = FirebaseFirestore.instance
      .collection('hotelregistration')
      .doc(hotelId)
      .collection('rooms')
      .doc(); // auto-generate roomId

  final roomWithId = room.copyWith(roomId: roomDoc.id);

  await roomDoc.set(roomWithId.toMap());
}

Future<void> updateRoom(String hotelId, Room room) async {
  await FirebaseFirestore.instance
      .collection('hotelregistration')
      .doc(hotelId)
      .collection('rooms')
      .doc(room.roomId)
      .update(room.toMap());
}

Future<void> deleteRoom(String hotelId, String roomId) async {
  await FirebaseFirestore.instance
      .collection('hotelregistration')
      .doc(hotelId)
      .collection('rooms')
      .doc(roomId)
      .delete();
}


