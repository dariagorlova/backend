// import 'package:http/http.dart'as http;
//
// /// email sender class
// class EmailSender {
//   ///main server url
//   final String server = 'https://sendemail.cyclic.app/';
//
//   ///emailAPI website url
//   final String url = 'https://sendemail.cyclic.app/sendEmail/';
//
//   /// list of error codes fromm server
//   List errorCodes = [
//     'wrongEmail',
//     'sendEmailFailed',
//     'wrongCrendentials',
//     'passkeyRequired',
//     'serverError',
//   ];
//
//   ///check errorCode is present in errorCode section start
//   checkErrorCode(message) {
//     ///initialize i
//     int i = 0;
//     while (i < errorCodes.length) {
//       if (message == errorCodes[i]) {
//         return {'isThere': true, 'errorCode': errorCodes[i]};
//       } else {
//         return {'isThere': false};
//       }
//     }
//   }
//
//   //check errorCode is present in errorCode section end
//
//   ///check serevr is running or not section start
//   Future<bool> checkServer() async {
//     ///response
//     var response = await http.get(Uri.parse(server));
//
//     return true;
//     // if (response.json()['message']['serverStatus'] == 'running') {
//     //   return true;
//     // } else if (response.json()['message']['serverStatus'] ==
//     //     'serverUnderMaintenance') {
//     //   return false;
//     // } else {
//     //   return false;
//     // }
//   }
//
//   ///send Custom Email with parameters section start
//   Future<Map<String,dynamic>>sendMessage(String toEmail, String title, String subject, String body,) async {
//     try {
//       if (await checkServer()) {
//         if (checkEmail(toEmail)) {
//           ///response
//           final response = await http.post(Uri.parse(url), body: <String,String>{
//             'toEmail': toEmail,
//             'title': title,
//             'subject': subject,
//             'body': body,
//           });
//
//           // ///check error code is present or not
//           // var checkErrorCodeIsPresentOrNot =
//           // checkErrorCode(response.json()['message'])['isThere'];
//           // if (response.json()['message'] == 'emailSendSuccess') {
//           //   return response.json();
//           // } else if (checkErrorCodeIsPresentOrNot) {
//           //   return {'message': checkErrorCodeIsPresentOrNot['erroCode']};
//           // } else {
//           //   return {'message': 'somethingWrong'};
//           // }
//           return {'message': 'emailSendSuccess'};
//         } else {
//           return {'message': 'wrongEmail'};
//         }
//       } else {
//         return {'message': 'serverUnderMaintenance'};
//       }
//     } catch (e) {
//       return {'message': 'somethingWrong'};
//     }
//   }
//
//   //send Custom Email With parameters section end
//
//   ///send custom Email With Custom Email And Passkey section start
//   // customMessage(String fromEmail, String passkey, String toEmail, String title,
//   //     String subject, String body) async {
//   //   try {
//   //     if (await checkServer()) {
//   //       if (checkEmail(toEmail)) {
//   //         ///response
//   //         var response = await Requests.post(url, json: {
//   //           'fromEmail': fromEmail,
//   //           'passkey': passkey,
//   //           'toEmail': toEmail,
//   //           'title': title,
//   //           'subject': subject,
//   //           'body': body
//   //         });
//   //
//   //         ///check error code is present or not
//   //         var checkErrorCodeIsPresentOrNot =
//   //         checkErrorCode(response.json()['message'])['isThere'];
//   //         if (response.json()['message'] == 'emailSendSuccess') {
//   //           return response.json();
//   //         } else if (checkErrorCodeIsPresentOrNot) {
//   //           return {'message': checkErrorCodeIsPresentOrNot['erroCode']};
//   //         } else {
//   //           return {'message': 'somethingWrong'};
//   //         }
//   //       } else {
//   //         return {'message': 'wrongEmail'};
//   //       }
//   //     } else {
//   //       return {'message': 'serverUnderMaintenance'};
//   //     }
//   //   } catch (e) {
//   //     return {'message': 'somethingWrong'};
//   //   }
//   // }
//
//
//   ///check email is valid or not section start
//   bool checkEmail(String email) {
//     ///returns true when email is valid else false
//     final bool emailValid = RegExp(
//         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//         .hasMatch(email);
//     return emailValid;
//   }
// }