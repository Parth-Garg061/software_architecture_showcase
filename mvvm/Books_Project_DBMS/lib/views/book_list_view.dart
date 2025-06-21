import 'package:books_project_dbms/view_models/book_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:books_project_dbms/models/book_model.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {

    final bookListViewModel = Provider.of<BookListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Reading List", style: TextStyle(fontWeight: FontWeight.w600),),
        centerTitle: true,
        backgroundColor: Color(0xff68548e).withOpacity(0.7),
      ),
      backgroundColor: Color(0xfff9f9f9),
      body: FutureBuilder(
          future: bookListViewModel.loadBooks(),
          builder: (context, asyncSnapshot) {

            List<BookModel>? booksData = asyncSnapshot.data;
            if(booksData != null){
              return Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                            itemCount: booksData.length,
                            itemBuilder: (context, index) {
                              final book = booksData![index];
                              return Card(
                                elevation: 3,
                                shadowColor: Colors.black12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side:
                                  BorderSide(color: Color(0xff68548e), width: 1.5),
                                ),
                                child: ListTile(
                                  leading: Icon(Icons.book),
                                  title: Text(
                                    book.bookName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400, fontSize: 18),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Checkbox(
                                        value: book.isChecked == 1,
                                        onChanged: (value) async {
                                          if (value == null) return;

                                          final updatedBook = BookModel(
                                            bookName: book.bookName,
                                            bookID: book.bookID,
                                            isChecked: value ? 1 : 0,
                                          );

                                          await bookListViewModel.updateBook(updatedBook);
                                          // final filtered = await BookListController().getFilteredBooks(selectedIndex - 1);
                                          // setState(() {
                                          //   booksData = filtered;
                                          // });
                                        },
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            final query = book.bookName;
                                            final searchQueryURL = "https://www.google.com/search?q=$query book";
                                            launchUrl(Uri.parse(searchQueryURL));
                                          },
                                          icon: Icon(Icons.search_outlined)),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    BottomNavigationBar(
                      elevation: 10,
                      items: bookListViewModel.bottomItems,
                      currentIndex: bookListViewModel.selectedIndex,
                      onTap: (index) async {
                        booksData = await bookListViewModel.loadBooks();
                      },
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}
