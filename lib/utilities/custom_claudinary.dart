import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

Future<String?> uploadToCloudinary(File file) async {
  final url = Uri.parse("https://api.cloudinary.com/v1_1/dbmzu0vdn/upload");

  final request = http.MultipartRequest('POST', url)
    ..fields['upload_preset'] = 'flutter_upload'
    ..files.add(await http.MultipartFile.fromPath('file', file.path));

  final response = await request.send();

  if (response.statusCode == 200) {
    final resString = await response.stream.bytesToString();
    final data = json.decode(resString);
    return data['secure_url']; // This is the uploaded file URL
  } else {
    print('Upload failed with status: ${response.statusCode}');
    return null;
  }
}

Future<String?> hotelimageuploadToCloudinary(File file) async {
  final url = Uri.parse("https://api.cloudinary.com/v1_1/dbmzu0vdn/upload");

  final request = http.MultipartRequest('POST', url)
    ..fields['upload_preset'] = 'hotel_imageupload'
    ..files.add(await http.MultipartFile.fromPath('file', file.path));

  final response = await request.send();

  if (response.statusCode == 200) {
    final resString = await response.stream.bytesToString();
    final data = json.decode(resString);
    return data['secure_url']; // This is the uploaded file URL
  } else {
    print('Upload failed with status: ${response.statusCode}');
    return null;
  }
}

Future<String?> roomimageuploadToCloudinary(File file) async {
  final url = Uri.parse("https://api.cloudinary.com/v1_1/dbmzu0vdn/upload");

  final request = http.MultipartRequest('POST', url)
    ..fields['upload_preset'] = 'room_imageupload'
    ..files.add(await http.MultipartFile.fromPath('file', file.path));

  final response = await request.send();

  if (response.statusCode == 200) {
    final resString = await response.stream.bytesToString();
    final data = json.decode(resString);
    return data['secure_url']; // This is the uploaded file URL
  } else {
    print('Upload failed with status: ${response.statusCode}');
    return null;
  }
}
