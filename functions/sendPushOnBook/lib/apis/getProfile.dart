import 'package:appwrite_function/const.dart';
import 'package:dart_appwrite/dart_appwrite.dart';

Future<dynamic> getProfile(Databases database, String? userID) async {
  if (userID != null) {
    final profileData = await database.getDocument(
        databaseId: dataBaseId,
        collectionId: profileCollectionId,
        documentId: userID);
    return [
      profileData.data["token"] ?? "",
      "${profileData.data["fname"]} ${profileData.data["fname"]}"
    ];
  }
  return null;
}
