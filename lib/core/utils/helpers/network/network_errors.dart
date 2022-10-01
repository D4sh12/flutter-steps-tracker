import 'package:firebase_auth/firebase_auth.dart';

class NetworkErrors {
  static String getNetworkError(error) {
    if (error is FirebaseAuthException) {
      return error.message!;
    } else {
      return "Unkowen Error";
    }
  }
}

//  if (error is Exception) {
//       if (error is FirebaseAuthException) {
//         switch (error.code) {
//           case "ERROR_EMAIL_ALREADY_IN_USE":
//             networkErrors = error.message!;
//             break;
//           case "account-exists-with-different-credential":
//             networkErrors = error.message!;
//             break;
//           case "email-already-in-use":
//             networkErrors = error.message!;
//             break;
//           // case "ERROR_WRONG_PASSWORD":
//           case "wrong-password":
//             networkErrors = "Wrong email/password combination.";
//             break;
//           case "firebase_auth/network-request-failed":
//             networkErrors = error.message!;
//             break;
//           // case "ERROR_USER_NOT_FOUND":
//           case "user-not-found":
//             networkErrors = "No user found with this email.";
//             break;
//           // case "ERROR_USER_DISABLED":
//           case "user-disabled":
//             networkErrors = "User disabled.";
//             break;
//           case "ERROR_TOO_MANY_REQUESTS":
//             networkErrors = "Too many requests to log into this account.";
//             break;
//           case "operation-not-allowed":
//             networkErrors = "Too many requests to log into this account.";
//             break;
//           // case "ERROR_OPERATION_NOT_ALLOWED":
//           // case "ERROR_INVALID_EMAIL":
//           case "invalid-email":
//             networkErrors = "Email address is invalid.";
//             break;
//         }
//       } else {
//         networkErrors = 'UnkownError';
//       }
//       return networkErrors;
//     } else {
//       return "Some error";
//     }
//   }