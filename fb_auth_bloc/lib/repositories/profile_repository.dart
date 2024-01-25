import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_auth_bloc/constants/db_constants.dart';
import 'package:fb_auth_bloc/models/custom_error.dart';
import 'package:fb_auth_bloc/models/user_model.dart';

class ProfileRepository {
  final FirebaseFirestore firebaseFirestore;
  ProfileRepository({required this.firebaseFirestore});

  Future<User> getProfile({required String uid}) async {
    try {
      final DocumentSnapshot userDoc = await usersRef.doc(uid).get();
      if (userDoc.exists) {
        final currentUser = User.fromDoc(userDoc);
        return currentUser;
      } else {
        throw "User not found";
      }
    } on FirebaseException catch (error) {
      throw CustomError(
          code: error.code, message: error.message!, plugin: error.plugin);
    } catch (error) {
      throw CustomError(
        code: "Exception",
        message: error.toString(),
        plugin: "flutter_error/server_error",
      );
    }
  }
}
