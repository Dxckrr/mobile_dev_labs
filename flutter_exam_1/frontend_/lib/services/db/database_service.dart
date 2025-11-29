import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites (
        article_id INTEGER PRIMARY KEY
      )
    ''');
  }

  Future<void> addFavorite(int id) async {
    final db = await database;

    await db.insert(
      'favorites',
      {'article_id': id},
      conflictAlgorithm: ConflictAlgorithm.ignore, 
    );
  }

  Future<void> removeFavorite(int id) async {
    final db = await database;

    await db.delete('favorites', where: 'article_id = ?', whereArgs: [id]);
  }

  Future<List<int>> getFavorites() async {
    final db = await database;

    final result = await db.query('favorites');

    return result.map((row) => row['article_id'] as int).toList();
  }

  Future<void> clearFavorites() async {
    final db = await database;
    await db.delete('favorites');
  }

  Future<void> syncApiFavoritesToSQLite(List<dynamic> apiItems) async {
    final db = await database;
    for (var item in apiItems) {
      if (item['is_favorite'] == 1) {
        await db.insert('favorites', {
          'article_id': item['id'],
        }, conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
  }
}
