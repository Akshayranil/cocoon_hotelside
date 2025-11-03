import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoomDetailsScreen extends StatelessWidget {
  final String hotelId;
  final String roomId;

  const RoomDetailsScreen({
    super.key,
    required this.hotelId,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Room Details"),
      ),
      body: FutureBuilder<DocumentSnapshot>(
  future: FirebaseFirestore.instance
      .collection('hotelregistration')
      .doc(hotelId)
      .collection('rooms')
      .doc(roomId)
      .get(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    }

    var data = snapshot.data!.data() as Map<String, dynamic>;

    final List images = data['images'] ?? [];
    final List amenities = data['aminities'] ?? [];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Modern Image Scroll
          SizedBox(
            height: 230,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),

          // ✅ Room Name / Type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data['type'] ?? "Room",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
               Text(
                "₹ ${data['roomPrice']} / Night",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ✅ Property Information Section
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow("Room Area", "${data['area']} sq.ft"),
                  _infoRow("Property Size", "${data['size']} sq.ft"),
                  _infoRow("Extra Bed Type", data['extrabedtype']),
                  _infoRow("Extra Persons Allowed", "${data['extraPersons']}"),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ✅ Amenities Section
          const Text("Amenities",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),

          FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('aminities').get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Loading...");
              final all = snapshot.data!.docs;
              final selected = all.where((x) => amenities.contains(x.id));

              return Wrap(
                spacing: 10,
                runSpacing: 6,
                children: selected.map((doc) {
                  return Chip(
                    label: Text(doc['name']),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 25),

          // ✅ Price & Button Row
         

        ],
      ),
    );
  },
),

    );
    
  }
  Widget _infoRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Text(value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      ],
    ),
  );
}

}
