import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:e_commerce_app/constance.dart';
class CartDatabaseHelper{

  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
 static Database _database;
 Future <Database> get database async {
   if(_database !=null) return _database;
   _database = await initDB();
   return _database;
 }

  initDB() async{
   String path = join(await getDatabasesPath(),'CartProduct.db');
return await  openDatabase(path,version: 1,
    onCreate:(Database db, int version)async{
      await db.execute(''' 
      CREATE TABLE $tableCartProduct (
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL,
      $columnProductID TEXT NOT NULL )
      ''');
    } );
  }
    insert (CartProductModel model)async{
      var dbClient = await database;
      await dbClient.insert(
          tableCartProduct, model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);

    }
  Future<List<CartProductModel>>  getAllProducts()async{
   var dbClient = await database;
   List <Map > maps = await dbClient.query(tableCartProduct);
   List<CartProductModel> list = maps.isNotEmpty?
       maps.map((product) =>CartProductModel.
       fromJson(product)).toList():[];
   return list;

    }
    updateDataBase(CartProductModel model)async{
   var dbClient = await database;
   return await dbClient.update(tableCartProduct, model.toJson(),
   where:'$columnProductID=?',whereArgs: [model.productID],);

    }
}