// import 'package:dio/dio.dart';
// import 'package:minorhockey_scheduler/models/roster_model.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class DioClient {
//   static var header = DotEnv().env['HEADER'];
//   static var url = DotEnv().env['URL'];
//   final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: url!,
//       connectTimeout: 5000,
//       receiveTimeout: 3000,
//     ),
//   );

//   Future<RosterModel?> getPlayer({required String division}) async {
//     RosterModel? player;

//     try {
//       Response userData = await _dio.get('/users/$id');

//       print('Player Info: ${userData.data}');

//       player = RosterModel.fromJson(userData.data);
//     } on DioError catch (e) {
//       // The request was made and the server responded with a status code
//       // that falls out of the range of 2xx and is also not 304.
//       if (e.response != null) {
//         print('Dio error!');
//         print('STATUS: ${e.response?.statusCode}');
//         print('DATA: ${e.response?.data}');
//         print('HEADERS: ${e.response?.headers}');
//       } else {
//         // Error due to setting up or sending the request
//         print('Error sending request!');
//         print(e.message);
//       }
//     }

//     return player;
//   }

//   // _getPlayersWithDio() async {
//   //   var dio = Dio();
//   //   try {
//   //     dio.options.headers['Authorization'] = header;
//   //     var response = await dio.post(DotEnv().env['URL']!, data: {
//   //       "operation": "sql",
//   //       "sql": "SELECT * FROM roster." + division + "roster"
//   //     });
//   //     return List<RosterModel>.from(
//   //         response.data.map((x) => RosterModel.fromJson(x)));
//   //   } on DioError catch (error) {
//   //     throw error.response!;
//   //   }
//   // }

//   Future<UserInfo?> createUser({required UserInfo userInfo}) async {
//     UserInfo? retrievedUser;

//     try {
//       Response response = await _dio.post(
//         '/users',
//         data: userInfo.toJson(),
//       );

//       print('User created: ${response.data}');

//       retrievedUser = UserInfo.fromJson(response.data);
//     } catch (e) {
//       print('Error creating user: $e');
//     }

//     return retrievedUser;
//   }

//   Future<UserInfo?> updateUser({
//     required UserInfo userInfo,
//     required String id,
//   }) async {
//     UserInfo? updatedUser;

//     try {
//       Response response = await _dio.put(
//         '/users/$id',
//         data: userInfo.toJson(),
//       );

//       print('User updated: ${response.data}');

//       updatedUser = UserInfo.fromJson(response.data);
//     } catch (e) {
//       print('Error updating user: $e');
//     }

//     return updatedUser;
//   }

//   Future<void> deleteUser({required String id}) async {
//     try {
//       await _dio.delete('/users/$id');
//       print('User deleted!');
//     } catch (e) {
//       print('Error deleting user: $e');
//     }
//   }
// }
