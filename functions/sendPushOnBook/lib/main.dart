import 'package:appwrite_function/apis/createBookRequestNotification.dart';
import 'package:appwrite_function/const.dart';
import 'package:appwrite_function/fcm_service.dart';
import 'package:appwrite_function/apis/getProfile.dart';
import 'package:appwrite_function/models/booking.dart';
import 'package:appwrite_function/models/notification_data.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';

/*
  'req' variable has:
    'headers' - object with request headers
    'payload' - request body data as a string
    'variables' - object with function variables

  'res' variable has:
    'send(text, status: status)' - function to return text response. Status code defaults to 200
    'json(obj, status: status)' - function to return JSON response. Status code defaults to 200
  
  If an error is thrown, a response with code 500 will be returned.
*/

Future<void> start(final req, final res) async {
  final client = Client();
  client
      .setEndpoint(req.variables['APPWRITE_FUNCTION_ENDPOINT'])
      .setProject(req.variables['APPWRITE_FUNCTION_PROJECT_ID'])
      .setKey(req.variables['APPWRITE_FUNCTION_API_KEY'])
      .setSelfSigned(status: true);
  String? deviceToken;
  Booking request;
  Map<String, String> notificationData;
  // Uncomment the services you need, delete the ones you don't
  // final account = Account(client);
  // final avatars = Avatars(client);
  final database = Databases(client);
  // final functions = Functions(client);
  // final health = Health(client);
  // final locale = Locale(client);
  // final storage = Storage(client);
  // final teams = Teams(client);
  // final users = Users(client);
  if (req.variables['APPWRITE_FUNCTION_ENDPOINT'] == null ||
      req.variables['APPWRITE_FUNCTION_API_KEY'] == null ||
      req.variables['FCM_SERVER_KEY'] == null) {
    print(
        "Environment variables are not set. Function cannot use Appwrite SDK.");
  } else {
    print(req.variables['APPWRITE_FUNCTION_EVENT_DATA']);

    request = Booking.fromJson(req.variables['APPWRITE_FUNCTION_EVENT_DATA']);
    notificationData = {
      "title": "You have got a new request",
      "body": "You have a new request please view for connection opportunity",
    };
    try {
      deviceToken = await getProfile(database, request.caId);
    } catch (e) {
      print(e);
    }
    if (deviceToken != null) {
      try {
        bool res = await FCMService().sendFCMToUser(
            serverKey: req.variables['FCM_SERVER_KEY'],
            userFCMToken: deviceToken,
            notificationData: notificationData);
        print(res);
        NotificationData data = NotificationData(
          caId: request.caId!,
          cusId: request.cusId!,
          title: notificationData["title"]!,
          body: notificationData["body"]!,
          profilePic:
              "$appWriteBaseURl/storage/buckets/$profilePicBucketId/files/${request.cusId}/preview?project=$projectID",
          createdAt: DateTime.now().toLocal().toString(),
        );
        Document? doc = await createBookRequestNotification(database, data);
        print(doc?.$id);
      } catch (e) {
        print(e);
      }
    }
  }

  res.json({
    'areDevelopersAwesome': true,
  });
}
