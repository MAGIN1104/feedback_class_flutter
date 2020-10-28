import 'dart:io';

import 'package:assets_img/src/models/user_model.dart';
export 'package:assets_img/src/models/user_model.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  static Database _dbusers;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  //METODOS GETTER PARA OBTENER LA INFORMACION DE LA PROPIEDAD PRIVADADA _dbuser
  Future<Database> get dbusers async {
    //Si la base de datos no esta vacio retorna la base de datos.
    if (_dbusers != null) return _dbusers;
    //de lo contrario no existe la base de datos
    _dbusers = await initDB();
    return _dbusers;
  }

  initDB() async {
    //Para inicializar una base de datos necesitamos un path para localizar la base de datos
    //*RECORDAR QUE IMPORTAMOS PATH PROVIDER
    //con esto tenemos la direccion del path
    Directory documentsDyrectory = await getApplicationDocumentsDirectory();

    //para que el join reconozca necesitamos importar path.path.dart
    //los parametros que recibe la direccion donde se encuentra la aplicacion y el nombre del archivo de la base de datos
    final path = join(documentsDyrectory.path, 'UsersDB.db');

    //como necesitamos retornar una base de datos
    //openDatabase en propio de sqflite
    return await openDatabase(path,
        //podemos tener una version de la base de datos
        version: 1,
        onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Users ('
          ' id INTEGER PRIMARY KEY AUTOINCREMENT,'
          ' name TEXT,'
          ' email TEXT,'
          ' pass TEXT'
          ')');
    });
  }

//Isertar Usuario
  Future<int> insertUser(UserModel user) async {
    final db = await dbusers;
    final resp = await db.insert('Users', user.toJson());
    return resp;
  }

//leer Usuario
  Future<List<UserModel>> getAllUser() async {
    final db = await dbusers;
    final resp = await db.query('Users');
    if (resp.isEmpty) {
      return [];
    } else {
      return resp.map((json) => UserModel.fromJson(json)).toList();
    }
  }

//Obtener un usuario
  Future<UserModel> getUser(String email, String password) async {
    final db = await dbusers;
    final resp = await db.query(
        'Users',
        where: 'email = ? AND pass = ?',
        whereArgs: [email, password]
    );
    if (resp.isEmpty) {
      return null;
    } else {
      return resp.map((json) => UserModel.fromJson(json)).toList().first;
    }
  }

//Actualizar Usuario
  // Future<int> updateUser(UserModel user) async {
  //   final db = await dbusers;
  //   final resp = await db.update('Users', user.toJson());
  //   return resp;
  // }

//Borrar un usuario
  // Future<int> deleteUser(UserModel user) async {
  //   final db = await dbusers;
  //   final resp = await db.delete('Users', where: 'id=?', whereArgs: [user.id]);
  //   return resp;
  // }

}
