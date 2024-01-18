// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import '../models/channel_info.dart';
// import 'constants.dart';
//
// class Services {
//   static const CHANNEL_ID = 'UCaF9CqLmS-Iaiqxwv9VyhBQ';
//   static const _baseUrl = 'www.googleapis.com';
//
//   static Future<ChannelInfo> getChannelInfo() async {
//     Map<String, String> parameters = {
//       "part": "snippet,contentDetails,statistics",
//       "id": CHANNEL_ID,
//       "key": Constants.API_KEY,
//     };
//     Map<String, String> headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };
//     Uri uri = Uri.https(
//       _baseUrl,
//       '/youtube/v3/channels',
//       parameters,
//     );
//     http.Response response = await http.get(uri, headers: headers);
//     print(response.body);
//     ChannelInfo channelInfo = channelInfoFromJson(response.body);
//     return channelInfo; // Add this line
//   }
// }
