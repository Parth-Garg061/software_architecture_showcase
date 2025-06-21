import 'package:books_project_dbms/models/data_models/book_model.dart';
import 'package:books_project_dbms/services/database_helper.dart';

class AddBookController {

  addBook(BookModel? bookModelParam) {

    DatabaseHelper.instance.insertBook(bookModelParam!);

    print("Book Added");
  }

}