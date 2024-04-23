import 'package:mongo_dart/mongo_dart.dart';

class DatabaseSetup {
  late Db _db;

  DatabaseSetup({required String host, required int port}) {
    _db = Db('mongodb://localhost:27017/flutter');
  }

  Future<void> openConnection() async {
    try {
      await _db.open();
      print("Connected to MongoDB");
    } catch (e) {
      print("Error connecting to MongoDB: $e");
    }
  }

  Future<void> insertData(String name, String id, String email) async {
    await _db.open();
    try {
      await _db.collection('flutter').insertOne({
        'name': name,
        'id': id,
        'email': email,
      });
      print("Data Inserted SUCCESSFULLY");
    } catch (e) {
      print("ERROR INSERTING DATA: $e");
    } finally {
      await _db.close();
    }
  }
}
