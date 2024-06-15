import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medical_records/routes/routes.dart';
import 'package:medical_records/services/app_preference_service.dart';

class WelcomeController extends GetxController {
  void signInWithGoogle() async {
    try {
      // Create a new provider
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user == null || AppPreferences.userToken == null) {
          print('User is currently signed out!');
        } else {
          AppPreferences.userToken = await user.getIdToken();
          Get.toNamed(Routes.RECORDS);
          return;
        }
      });

      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      //googleProvider
      //    .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
      // Once signed in, return the UserCredential
      UserCredential credential =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
      AppPreferences.userToken = await credential.user?.getIdToken();
      Get.toNamed(Routes.RECORDS);

    } catch (error) {
      print('Error signing in with Google: $error');
      return null;
    }
    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }
}
