import 'package:flutter/foundation.dart' show immutable;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zaad/state/constants/firebas_collection_name.dart';
import 'package:zaad/state/constants/firebase_field_name.dart';
import 'package:zaad/state/posts/typedefs/user_id.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();
  Future<void> SaveUserInfo(
      {required UserId userId,
      required String displayName,
      required String? email}) async {
    try {
      // First We check if user already exist
      final userInfo =await FirebaseFirestore.instance
          .collection(FireBaseCollectionName.users)
          .where(FireBaseFieldName.userId, isEqualTo: userId).limit(1)
          .get();
      if (userInfo.docs.isNotEmpty) {
        // Updating only display name
        
      }
    } catch (e) {}
  }
}
