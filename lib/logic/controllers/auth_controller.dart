import 'package:application_mobile/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController
{
  bool isVisibility = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = "".obs;
  var displayUserEmail = "".obs;
  var isSignedIn = false;
  final GetStorage authBox = GetStorage();
  User ? get userProfile => auth.currentUser;




  @override
  void onInit()
  {
    displayUserName.value = (userProfile != null ? userProfile!.displayName : "")!;
    displayUserEmail.value = (userProfile != null ? userProfile!.email : "")! ;
    super.onInit();
  }


  void visibility ()
  {
    isVisibility = !isVisibility;
    update();
  }


  void checkBox ()
  {
    isCheckBox = !isCheckBox;
    update();
  }


  void logInUsingFirebase(
  {
  required String email,
  required String password,

  }) async
  {
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value) => displayUserName.value = auth.currentUser!.displayName!);
      isSignedIn = true;
      authBox.write("", isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error)
    {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = "";

      if (error.code == 'user-not-found')
      {
        message = 'Account does not exists for that $email... Create your account by signing up !';
      } else if (error.code == 'wrong-password')
      {
        message = 'Invalid password... Try again ! ';
      } else
      {
        message = error.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (error)
    {
      Get.snackbar(
        "ERROR",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

  }




  void signUpUsingFirebase(
  {
    required String name,
    required String email,
    required String password,

  }) async
      {
        try {
          await auth.createUserWithEmailAndPassword
            (
              email: email,
              password: password,
            ).then((value)
          {
            displayUserName.value = name;
            displayUserEmail.value = email;
            auth.currentUser!.updateDisplayName(name);
          });
          update();
          Get.offNamed(Routes.mainScreen);
        } on FirebaseAuthException catch (error)
        {

          String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
          String message = "";


          if (error.code == 'weak-password')
          {
            message = 'Provided password is too weak.';
          } else if (error.code == 'email-already-in-use')
          {
            message = 'Account already exists for that email ';
          } else
          {
            message = error.message.toString();
          }

          Get.snackbar(
              title,
              message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );

        } catch (error)
        {
          Get.snackbar(
            "ERROR",
            error.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }


  void resetPassword(String email) async
  {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error)
    {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = "";

      if (error.code == 'user-not-found')
      {
        message = 'Account does not exists for that $email... Create your account by signing up !';
      }  else
      {
        message = error.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (error)
    {
      Get.snackbar(
        "ERROR",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }


  void signOutFromApp() async
  {
    try
    {
      await auth.signOut();
      displayUserName.value = "";
      displayUserEmail.value = "";
      isSignedIn = false;
      authBox.remove("auth");

      update();
      Get.offNamed(Routes.welcomeScreen);

    } catch (error)
    {
      Get.snackbar(
        "ERROR",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }


}