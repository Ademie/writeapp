// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:writeapp/fireauth/auth.dart';

// late String title;
// late String content;
// void addNoteForCurrentUser() async {
//   String uid = Auth().currentUser!.uid;
//   CollectionReference notesCollection = FirebaseFirestore.instance
//       .collection('users')
//       .doc(uid)
//       .collection('notes');
//   await notesCollection.add({
//     "title": title,
//     "content": content,
//     "timestamp": FieldValue.serverTimestamp()
//   });
// }
