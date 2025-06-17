import 'package:books_project_dbms/models/data_models/book_model.dart';
import 'package:books_project_dbms/services/database_helper.dart';

class BookListController {

  Future<List<BookModel>> getFilteredBooks(int indexParam) async {
    List<BookModel> filteredBooks = [];
    filteredBooks = await DatabaseHelper.instance.getFilteredBooks(indexParam);
    return filteredBooks;
  }

  updateBook(BookModel bookModelParam) {
   DatabaseHelper.instance.updateBook(bookModelParam);
  }

}