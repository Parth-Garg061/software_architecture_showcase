import 'package:books_project_dbms/models/data_models/book_model.dart';
import 'package:books_project_dbms/models/database_manager/database_helper.dart';

class BookListController {

  getFilteredBooks(int indexParam) {
    List<BookModel> filteredBooks = [];
    if(indexParam != -1) {
      filteredBooks = DatabaseHelper().getFilteredBooks(indexParam);
    } else {
      filteredBooks = DatabaseHelper().getBooks();
    };
    return filteredBooks;
  }

  updateBook(BookModel bookModelParam) {
    DatabaseHelper().updateBook(bookModelParam);
  }

}