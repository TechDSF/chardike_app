import 'dart:io';
import 'package:chardike/screens/UserPage/model/favourite_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String favouriteTable = "FavouriteTable";
  static const String id = "id";
  static const String slug = "slug";
  static const String image = "image";
  static const String name = "name";
  static const String newPrice = "newPrice";
  static const String oldPrice = "oldPrice";

  Database? db;

  Future<Database?> get database async {
    var path = await getApplicationDocumentsDirectory();
    if (db != null) {
      return db;
    } else {
      db = await openDatabase(
        join(path.path, 'Chardike.db'),
        onCreate: (db, version) {
          db.execute(
            'CREATE TABLE $favouriteTable($id TEXT, $slug TEXT, $image TEXT, $name TEXT, $newPrice TEXT, $oldPrice TEXT)',
          );
        },
        version: 1,
      );
      return db;
    }
  }

  ///Create new favourite product
  Future<int> insertFavouriteProduct(FavouriteModel model) async {
    // Get a reference to the database.
    final db = await database;
    try {
      return await db!.insert(
        favouriteTable,
        model.toJson(),
      );
    } catch (_) {
      print("Error to insert new favourite product!");
      return 0;
    }
  }

  ///Get all note folder name
  Future<List<FavouriteModel>> getFavouriteProduct() async {
    final db = await database;
    // Query the table for all The Products.
    final List<Map<String, dynamic>> maps = await db!.query(favouriteTable);
    // Convert the List<Map<String, dynamic> into a List<ProductModel>.
    return List.generate(maps.length, (i) {
      return FavouriteModel(
          id: maps[i][id],
          slug: maps[i][slug],
          image: maps[i][image],
          name: maps[i][name],
          newPrice: maps[i][newPrice],
          oldPrice: maps[i][oldPrice]);
    });
  }

  ///delete from favourite
  Future<int> deleteProduct(String id) async {
    // Get a reference to the database.
    final db = await database;

    try {
      // Remove the Dog from the database.
      return await db!.delete(
        favouriteTable,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (_) {
      print("Ooops! Data is not delete!");
      return 0;
    }
  }
}
