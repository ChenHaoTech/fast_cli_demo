import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:fast_cli_demo/app/get_it.dart';
import 'package:fast_cli_demo/app/services.dart';
import 'package:fast_cli_demo/features/authentication/models/fast_user.dart';
import 'package:fast_cli_demo/features/authentication/services/user_service/fast_user_service.dart';

@firebase
@LazySingleton(as: FastUserService)
class FirebaseUserService extends FastUserService {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  Future<void> createUser() async {
    try {
      DocumentReference docRef =
          firestore.collection('users').doc(authenticationService.id);

      FastUser newUser = FastUser(
        id: docRef.id,
        email: authenticationService.email,
        createdAt: DateTime.now(),
      );

      await firestore.runTransaction((transaction) async {
        final docSnapshot = await transaction.get(docRef);

        if (!docSnapshot.exists) {
          transaction.set(
            docRef,
            newUser.toJson(),
          );
        }
      });
    } catch (e) {
      debugPrint('Error creating user: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(FastUser user) async {
    await firestore.collection('users').doc(user.id).delete();
    await FirebaseAuth.instance.currentUser?.delete();
  }

  @override
  Future<void> updateUser(FastUser user) async {
    await firestore.collection('users').doc(user.id).update(user.toJson());
  }

  @override
  Future<FastUser?> getUser() {
    return firestore
        .collection('users')
        .doc(authenticationService.id)
        .get()
        .then((value) {
      if (value.exists) {
        FastUser loadedUser = FastUser.fromJson(value.data()!);
        setUser(loadedUser);
        return loadedUser;
      } else {
        return null;
      }
    });
  }

  @override
  Future<void> updateLastLogin() async {
    await firestore.collection('users').doc(authenticationService.id).update({
      'last_login': DateTime.now(),
    });
  }
}
