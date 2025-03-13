// // import 'dart:convert';
// //        import 'dart:io';
// //
// //        // import 'package:fatoore_delivery_app/controller/auth_controller.dart';
// //        // import 'package:fatoore_delivery_app/controller/chat_controller.dart';
// //        // import 'package:fatoore_delivery_app/controller/order_controller.dart';
// //        // import 'package:fatoore_delivery_app/data/model/body/notification_body.dart';
// //        // import 'package:fatoore_delivery_app/helper/route_helper.dart';
// //        // import 'package:fatoore_delivery_app/helper/user_type.dart';
// //        //
// //
// //
// //        import 'package:firebase_messaging/firebase_messaging.dart';
// //        import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// //        // import 'package:fatoore_delivery_app/util/app_constants.dart';
// //        import 'package:get/get.dart';
// //        import 'package:path_provider/path_provider.dart';
// //        import 'package:http/http.dart' as http;
// //
// // class NotificationHelper {
// //
// //    static Future<void> initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
// //        var androidInitialize = new AndroidInitializationSettings('notification_icon');
// //        var iOSInitialize = new IOSInitializationSettings();
// //        var initializationsSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
// //        flutterLocalNotificationsPlugin.initialize(initializationsSettings, onSelectNotification: (String payload) async{
// //            try{
// //                if(payload != null && payload.isNotEmpty){
// //
// //
// //
// //                    NotificationBody _payload = NotificationBody.fromJson(jsonDecode(payload));
// //
// //                    if(_payload.notificationType == NotificationType.order){
// //                        Get.toNamed(RouteHelper.getOrderDetailsRoute(_payload.orderId));
// //                    }else if(_payload.notificationType == NotificationType.order_request){
// //                        Get.toNamed(RouteHelper.getMainRoute('order-request'));
// //                    }else if(_payload.notificationType == NotificationType.general){
// //                        Get.toNamed(RouteHelper.getNotificationRoute());
// //                    }else{
// //                        Get.toNamed(RouteHelper.getChatRoute(notificationBody: payload, conversationId: payload.conversationId));
// //                    }
// //
// //                }
// //            }catch(e){}
// //            return;
// //        });
// //
// //        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// //            print("onMessage: ${message.notification.title}/${message.notification.body}/${message.notification.titleLocKey}");
// //            print("onMessage message type:${message.data['type']}");
// //            print("onMessage message:${message.data}");
// //
// //
// //
// //            if(message.data['type'] == 'message' && Get.currentRoute.startsWith(RouteHelper.chatScreen)){
// //                if(Get.find<AuthController>().isLoggedIn()) {
// //                    Get.find<ChatController>().getConversationList(1);
// //                    if(Get.find<ChatController>().messageModel.conversation.id.toString() == message.data['conversation_id'].toString()) {
// //                        Get.find<ChatController>().getMessages(
// //                                1, NotificationBody(
// //                                        notificationType: NotificationType.message,
// //                                customerId: message.data['sender_type'] == UserType.user.name ? 0 : null,
// //                                vendorId: message.data['sender_type'] == UserType.vendor.name ? 0 : null,
// //            ),
// //                        null, int.parse(message.data['conversation_id'].toString()),
// //            );
// //                    }else {
// //                        NotificationHelper.showNotification(message, flutterLocalNotificationsPlugin);
// //                    }
// //                }
// //            }else if(message.data['type'] == 'message' && Get.currentRoute.startsWith(RouteHelper.conversationListScreen)) {
// //
// //
// //                if(Get.find<AuthController>().isLoggedIn()) {
// //                    Get.find<ChatController>().getConversationList(1);
// //                }
// //
// //
// //
// //                NotificationHelper.showNotification(message, flutterLocalNotificationsPlugin);
// //            }else {
// //                String _type = message.data['type'];
// //
// //                if (type != 'assign' && type != 'new_order' /*&& _type != 'order_request'*/) {
// //
// //                    NotificationHelper.showNotification(message, flutterLocalNotificationsPlugin);
// //                    Get.find<OrderController>().getCurrentOrders();
// //                    Get.find<OrderController>().getLatestOrders();
// //
// //
// //                }
// //            }
// //        });
// //
// //        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
// //            print("onOpenApp: ${message.notification.title}/${message.notification.body}/${message.notification.titleLocKey}");
// //            print("onOpenApp message type:${message.data['type']}");
// //            try{
// //                if(message.data != null || message.data.isNotEmpty){
// //
// //                    NotificationBody _notificationBody = convertNotification(message.data);
// //
// //                    if(_notificationBody.notificationType == NotificationType.order){
// //                        Get.toNamed(RouteHelper.getOrderDetailsRoute(int.parse(message.data['order_id'])));
// //                    }
// //                    else if(_notificationBody.notificationType == NotificationType.order_request){
// //                        Get.toNamed(RouteHelper.getMainRoute('order-request'));
// //                    }
// //                    else if(_notificationBody.notificationType == NotificationType.general){
// //                        Get.toNamed(RouteHelper.getNotificationRoute());
// //                    }
// //                    else{
// //                        Get.toNamed(RouteHelper.getChatRoute(notificationBody: notificationBody, conversationId: notificationBody.conversationId));
// //                    }
// //                }
// //            }catch (e) {}
// //        });
// //    }
// //
// //    static Future<void> showNotification(RemoteMessage message, FlutterLocalNotificationsPlugin fln) async {
// //        if(!GetPlatform.isIOS) {
// //            String _title;
// //            String _body;
// //            String _image;
// //            NotificationBody _notificationBody;
// //
// //            _title = message.notification.title;
// //            _body = message.notification.body;
// //            _notificationBody = convertNotification(message.data);
// //
// //            if(GetPlatform.isAndroid) {
// //                _image = (message.notification.android.imageUrl != null && message.notification.android.imageUrl.isNotEmpty)
// //                        ? message.notification.android.imageUrl.startsWith('http') ? message.notification.android.imageUrl
// //                        : '${AppConstants.BASE_URL}/storage/app/public/notification/${message.notification.android.imageUrl}' : null;
// //            }else if(GetPlatform.isIOS) {
// //                _image = (message.notification.apple.imageUrl != null && message.notification.apple.imageUrl.isNotEmpty)
// //                        ? message.notification.apple.imageUrl.startsWith('http') ? message.notification.apple.imageUrl
// //                        : '${AppConstants.BASE_URL}/storage/app/public/notification/${message.notification.apple.imageUrl}' : null;
// //            }
// //
// //            if(_image != null && image.isNotEmpty /*&& notificationBody.notificationType != NotificationType.message*/) {
// //                try{
// //                    await showBigPictureNotificationHiddenLargeIcon(_title, body, notificationBody, _image, fln);
// //                }catch(e) {
// //                    await showBigTextNotification(_title, body, notificationBody, fln);
// //                }
// //            }else {
// //                await showBigTextNotification(_title, body, notificationBody, fln);
// //            }
// //        }
// //    }
// //
// //    static Future<void> showTextNotification(String title, String body, NotificationBody notificationBody, FlutterLocalNotificationsPlugin fln) async {
// //    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //                'stackfood_delivery', 'stackfood_delivery name', playSound: true,
// //                importance: Importance.max, priority: Priority.max, sound: RawResourceAndroidNotificationSound('notification'),
// //    );
// //    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
// //        await fln.show(0, title, body, platformChannelSpecifics, payload: notificationBody != null ? jsonEncode(notificationBody.toJson()) : null);
// //    }
// //
// //    static Future<void> showBigTextNotification(String title, String body, NotificationBody notificationBody, FlutterLocalNotificationsPlugin fln) async {
// //        BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
// //                body, htmlFormatBigText: true,
// //                contentTitle: title, htmlFormatContentTitle: true,
// //    );
// //        AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //                'stackfood_delivery channel id', 'stackfood_delivery name', importance: Importance.max,
// //                styleInformation: bigTextStyleInformation, priority: Priority.max, playSound: true,
// //                sound: RawResourceAndroidNotificationSound('notification'),
// //    );
// //        NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
// //        await fln.show(0, title, body, platformChannelSpecifics, payload: notificationBody != null ? jsonEncode(notificationBody.toJson()) : null);
// //    }
// //
// //    static Future<void> showBigPictureNotificationHiddenLargeIcon(String title, String body, NotificationBody notificationBody, String image, FlutterLocalNotificationsPlugin fln) async {
// //        final String largeIconPath = await _downloadAndSaveFile(image, 'largeIcon');
// //        final String bigPicturePath = await _downloadAndSaveFile(image, 'bigPicture');
// //        final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
// //                FilePathAndroidBitmap(bigPicturePath), hideExpandedLargeIcon: true,
// //                contentTitle: title, htmlFormatContentTitle: true,
// //                summaryText: body, htmlFormatSummaryText: true,
// //    );
// //        final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //                'stackfood_delivery', 'stackfood_delivery name',
// //                largeIcon: FilePathAndroidBitmap(largeIconPath), priority: Priority.max, playSound: true,
// //                styleInformation: bigPictureStyleInformation, importance: Importance.max,
// //                sound: RawResourceAndroidNotificationSound('notification'),
// //    );
// //        final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
// //        await fln.show(0, title, body, platformChannelSpecifics, payload: notificationBody != null ? jsonEncode(notificationBody.toJson()) : null);
// //    }
// //
// //    static Future<String> _downloadAndSaveFile(String url, String fileName) async {
// //        final Directory directory = await getApplicationDocumentsDirectory();
// //        final String filePath = '${directory.path}/$fileName';
// //        final http.Response response = await http.get(Uri.parse(url));
// //        final File file = File(filePath);
// //        await file.writeAsBytes(response.bodyBytes);
// //        return filePath;
// //    }
// //
// //    static NotificationBody convertNotification(Map<String, dynamic> data){
// //        if(data['type'] == 'general'){
// //            return NotificationBody(notificationType: NotificationType.general) ;
// //        }
// //        else if(  data['type'] == 'order_status'){
// //            return NotificationBody(orderId: int.parse(data['order_id']), notificationType: NotificationType.order);
// //        }
// //        else if(  data['type'] == 'order_request'){
// //            return NotificationBody(orderId: int.parse(data['order_id']), notificationType: NotificationType.order_request);
// //        }
// //        else if(data['type'] == 'message'){
// //            return NotificationBody(
// //                    conversationId: (data['conversation_id'] != null && data['conversation_id'].isNotEmpty) ? int.parse(data['conversation_id']) : null,
// //                    notificationType: NotificationType.message,
// //                    type: data['sender_type'] == UserType.user.name ? UserType.user.name : UserType.vendor.name,
// //      );
// //        }else{
// //            return null;
// //        }
// //    }
// //
// // }
// //
// //    Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
// //        print("onBackground: ${message.notification.title}/${message.notification.body}/${message.notification.titleLocKey}");
// //        // var androidInitialize = new AndroidInitializationSettings('notification_icon');
// //        // var iOSInitialize = new IOSInitializationSettings();
// //        // var initializationsSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
// //        // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// //        // flutterLocalNotificationsPlugin.initialize(initializationsSettings);
// //        // NotificationHelper.showNotification(message, flutterLocalNotificationsPlugin, true);
// //    }
// //
// //
//
//
// import 'dart:io';
//
// import 'package:app_settings/app_settings.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/services.dart';
//
// class NotificationHelper
// {
//
//
//
//
//   FirebaseMessaging messaging =FirebaseMessaging.instance;
//
//
//   void requestPermission() async
//   {
//
//
//
//     NotificationSettings settings =await messaging.requestPermission(
//
//          alert:  true,
//          announcement: true
//         ,badge: true,
//          carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true
//
//
//
//
//
//
//     );
//
//     if(settings.authorizationStatus==AuthorizationStatus.authorized)
//       {
//
// print("permission is granted");
//
//
//
//
//       }
//     else if(settings.authorizationStatus==AuthorizationStatus.provisional)
// {
//
//
//   print("permission provisional is granted");
//
// }
//
//     else
//       {
//         AppSettings.openNotificationSettings();
//
//         print("user deinel permission");
//
//
//
//
//
//       }
//
//
//
//   }
//
//
//
//
//
//
//
//
//
//
//   void  getDeviceDetails() async {
//
//
//     FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance; // Change here
//     _firebaseMessaging.getToken().then((token){
//       print("token is $token");
//     });
//
//
//
//
//
// }
//
//
//
//
// }