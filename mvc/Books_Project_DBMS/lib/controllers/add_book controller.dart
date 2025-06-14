import 'package:books_project_dbms/models/data_models/book_model.dart';
import 'package:books_project_dbms/models/database_manager/database_helper.dart';

class AddBookController {

  Future<void> addBook(BookModel? bookModelParam) async {

    await DatabaseHelper().insertBook(bookModelParam!);
    print("Book Added");

  }

}