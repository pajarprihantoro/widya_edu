import 'package:app_widya_edu/src/data/models/discussion_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiscussionDataSource {
  static const String discussionPath = 'Discussions';

  Future<void> createDiscussion(DiscussionModel discussionModel) async {
    String newDocumentId = _createUniqueId();
    await FirebaseFirestore.instance
        .doc('$discussionPath/$newDocumentId()')
        .set(discussionModel.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamDiscussion()  {
    return FirebaseFirestore.instance.collection(discussionPath).snapshots();
  }

  String _createUniqueId() {
    return DateTime.now().microsecondsSinceEpoch.toString();
  }
}
