class Room {
  final String roomId;
  final int area;
  final String type;
  final int size;
  final String extraBedType;
  final int roomPrice;
  final int extraPersons;
  final List<String> aminities;
  final List<String> images;

  Room({
    required this.roomId,
    required this.area,
    required this.type,
    required this.size,
    required this.extraBedType,
    required this.roomPrice,
    required this.extraPersons,
    required this.aminities,
    required this.images,
  });

    Room copyWith({
    String? roomId,
    int? area,
    String? type,
    int? size,
    String? extraBedType,
    int? roomPrice,
    int? extraPersons,
    List<String>? aminities,
    List<String>? images,
  }) {
    return Room(
      roomId: roomId ?? this.roomId,
      area: area ?? this.area,
      type: type ?? this.type,
      size: size ?? this.size,
      extraBedType: extraBedType ?? this.extraBedType,
      roomPrice: roomPrice ?? this.roomPrice,
      extraPersons: extraPersons ?? this.extraPersons,
      aminities: aminities ?? this.aminities,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'roomId': roomId,
      'area': area,
      'type': type,
      'size': size,
      'extrabedtype':extraBedType,
      'roomPrice': roomPrice,
      'extraPersons':extraPersons,
      'aminities': aminities,
      'images': images,
    };
  } 

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      roomId: map['roomId'] ?? '',
      area: map['area'] ?? '',
      type: map['type'] ?? '',
      size: map['size'] ?? 0,
      extraBedType: map['extrabedtype']??'',
      roomPrice: (map['roomPrice'] ?? 0),
      extraPersons: (map['extraPersons']??0),
      aminities: List<String>.from(map['aminities'] ?? []),
      images: List<String>.from(map['images'] ?? []),
    );
  }
}

