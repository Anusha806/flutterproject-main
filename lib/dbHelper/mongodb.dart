// import 'package:mongo_dart/mongo_dart.dart';
// import 'Constant.dart';
//
// class MongoDatabase{
//   static var db, userCollection;
//   static connect() async {
//     db = await Db.create(MONGO_CONN_URL);
//     await db.open();
//     userCollection = db.collection(USER_COLLECTION);
//   }
// }
import 'package:mongo_dart/mongo_dart.dart';
import 'Constant.dart';

class MongoDatabase {
  static late Db db;
  static late DbCollection userCollection;

  static Future<void> connect() async {
    db = Db(MONGO_CONN_URL);
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<void> insertData(String name, String id, String email) async {
    if (userCollection == null) {
      throw Exception('Database not initialized');
    }
    await userCollection.insert({
      'name': name,
      'id': id,
      'email': email,
    });
  }
}

