import 'package:books_project_dbms/models/data_models/book_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database.db');

    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE books(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        isRead INTEGER NOT NULL
      )
    ''');
  }

  Future performTransaction(String title, String newTitle, bool isRead, int id) async {

    final db = await database;

    await db.transaction((txn) async {

      await txn.insert('books',
          {'title': title, 'isRead': 0}
      );

      await txn.update(
        'books',
        {'title': newTitle, 'isRead': isRead ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  Future<int> insertBook(BookModel book) async {
    final db = await database;

    return await db.insert('books', {'title': book.bookName, 'isRead': 0});
  }

  void updateBook(BookModel bookModel) async {
    final db = await database;

    await db.update(
      'books',
      {'title': bookModel.bookName, 'isRead': bookModel.isChecked},
      where: 'id = ?',
      whereArgs: [bookModel.bookID],
    );
  }

  getBooks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('books');

    return List.generate(maps.length, (i) {
      return BookModel.fromJson(maps[i]);
    });
  }


  getFilteredBooks(int index) async {
    final db = await database;

    if (index != -1) {
      final List<Map<String, dynamic>> maps = await db.query(
        'books',
        where: 'isRead = ?',
        whereArgs: [index],
      );

      return List.generate(maps.length, (i) {
        return BookModel.fromJson(maps[i]);
      });
    } else {
      return await getBooks();
    }
  }

}
