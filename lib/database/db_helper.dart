import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_model.dart';

class UserController {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'users.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, sobrenome TEXT, email TEXT UNIQUE, senha TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<int> insertUser(UserModel user) async {
    final db = await database;
    return await db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  static Future<UserModel?> getUserByEmail(String email) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('users', where: 'email = ?', whereArgs: [email]);
    if (maps.isNotEmpty) {
      return UserModel(
        id: maps[0]['id'],
        nome: maps[0]['nome'],
        sobrenome: maps[0]['sobrenome'],
        email: maps[0]['email'],
        senha: maps[0]['senha'],
      );
    }
    return null;
  }

  static Future<UserModel?> authenticate(String email, String senha) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users',
        where: 'email = ? AND senha = ?', whereArgs: [email, senha]);
    if (maps.isNotEmpty) {
      return UserModel(
        id: maps[0]['id'],
        nome: maps[0]['nome'],
        sobrenome: maps[0]['sobrenome'],
        email: maps[0]['email'],
        senha: maps[0]['senha'],
      );
    }
    return null;
  }
}
