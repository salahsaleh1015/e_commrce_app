import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/cart/model/cart_product_model.dart';


const String cartProductTable = 'cartProduct';
const String columnName = 'name';
const String columnImage = 'image';
const String columnPrice = 'price';
const String columnQuantity = 'quantity';
const String columnProductId = 'productId';





class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final db = CartDatabaseHelper._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(''' 
      CREATE TABLE $cartProductTable(
       $columnName TEXT NOT NULL,
       $columnImage TEXT NOT NULL, 
       $columnPrice TEXT NOT NULL,
       $columnQuantity INTEGER NOT NULL,
       $columnProductId TEXT NOT NULL
      )
      ''');
        });
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    dbClient!.insert(cartProductTable, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> getAllProducts() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(cartProductTable);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product as Map<String, dynamic>)).toList()
        : [];
    return list;
  }

  update(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient!.update(cartProductTable, model.toJson(),
        where: '$columnProductId = ?', whereArgs: [model.productId]);
  }


}