import 'package:books_project_dbms/models/book_model.dart';
import 'package:books_project_dbms/services/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookListViewModel with ChangeNotifier{

  List<BookModel> _filteredBooks = [];
  int _selectedIndex = 0;

  List<BookModel> get filteredBooks => _filteredBooks;
  int get selectedIndex => _selectedIndex;

  Future loadBooks() async {
    _filteredBooks = await DatabaseHelper.instance.getFilteredBooks(_selectedIndex);
    notifyListeners();
  }

  updateBook(BookModel bookModelParam) {
   DatabaseHelper.instance.updateBook(bookModelParam);
   notifyListeners();
  }

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.my_library_books_outlined), label: "All"),
    BottomNavigationBarItem(
        icon: Icon(Icons.menu_book_outlined), label: "Active"),
    BottomNavigationBarItem(
        icon: Icon(Icons.check_box_rounded), label: "Completed"),
  ];

}