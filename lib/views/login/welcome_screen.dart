import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_records/controllers/welcome/welcome_controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Welcome to Ayush Record System')),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://firebasestorage.googleapis.com/v0/b/sheraa-95d17.appspot.com/o/ayush%20image.png?alt=media',
                    placeholder: (context, url) =>
                        CircularProgressIndicator(), // Placeholder widget while loading
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    height: 250,
                    width: 250,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    UserCredential? user = await signInWithGoogle();
                    print(user?.user?.email);
                    print(user?.user?.displayName);
                    print(user?.user?.emailVerified);
                    print(user?.credential?.accessToken);
                    print(user?.credential?.token);
                    //print(user?.credential.)
                  },
                  icon: Icon(Icons.login),
                  label: Text('Sign in with Google'),
                )
              ],
            ),
          ),
        ));
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      //googleProvider
      //    .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } catch (error) {
      print('Error signing in with Google: $error');
      return null;
    }
    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }
}
