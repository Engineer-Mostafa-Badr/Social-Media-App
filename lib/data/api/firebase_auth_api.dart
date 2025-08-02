// ignore_for_file: use_build_context_synchronously
import 'package:social_media_app/core/extension/context.dart';
import 'package:social_media_app/data/model/result_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthApi {
  Future<ResultApi> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final credental = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ResultApi(isError: false, value: credental.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw context.lang.notUserFoundFirebase;
      } else if (e.code == 'wrong-password') {
        throw context.lang.errorPasswordFirebase;
      } else {
        throw context.lang.errorFirebase;
      }
    }
  }

  Future<ResultApi> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return ResultApi(isError: false, value: credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw context.lang.errorPasswordFirebase;
      } else if (e.code == 'email-already-in-use') {
        throw context.lang.emailIsExist;
      } else {
        throw context.lang.errorFirebase;
      }
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on Exception catch (e) {
      // ignore: avoid_print
      print('Error signing out: ${e.toString()}');
    }
  }
}
