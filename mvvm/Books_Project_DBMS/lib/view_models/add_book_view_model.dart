import 'package:books_project_dbms/models/book_model.dart';
import 'package:books_project_dbms/services/database_helper.dart';
import 'package:flutter/cupertino.dart';

class AddBookViewModel with ChangeNotifier{

  addBook(BookModel? bookModelParam) {

    DatabaseHelper.instance.insertBook(bookModelParam!);
    notifyListeners();

    print("Book Added");
  }

}