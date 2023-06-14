import 'package:appwrite_function/const.dart';
import 'package:appwrite_function/models/notification_data.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';

Future<Document?> createBookRequestNotification(
    Databases database, NotificationData data) async {
  try {
    Document document = await database.createDocument(
        databaseId: dataBaseId,
        collectionId: notificationCollectionId,
        documentId: ID.unique(),
        data: data.toMap());
    return document;
  } catch (e) {
    print(e);
  }
  return null;
}
