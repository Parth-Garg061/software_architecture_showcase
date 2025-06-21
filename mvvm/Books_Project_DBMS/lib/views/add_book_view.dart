import 'package:books_project_dbms/view_models/add_book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:books_project_dbms/models/book_model.dart';
import 'package:provider/provider.dart';

class AddBookView extends StatelessWidget {
  const AddBookView({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController bookNameController = TextEditingController();

    try {
      final bookViewModel = Provider.of<AddBookViewModel>(context);

      return Scaffold(
        appBar: AppBar(
          title: Text("Add New Book"),
          centerTitle: true,
          backgroundColor: Color(0xff68548e).withOpacity(0.7),
        ),
        backgroundColor: Color(0xfff9f9f9),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: bookNameController,
                  decoration: InputDecoration(
                      labelText: "Book Name*",
                      hintText: "Enter the Book Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff68548e), width: 1.5)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff68548e), width: 0.5)
                      )
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1.5),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Color(0xff68548e), width: 1.5)
                        ),
                      ),
                      onPressed: () async {
                        final newBook = BookModel(bookName: bookNameController.text);

                        bookViewModel.addBook(newBook);

                        bookNameController.clear();

                        Navigator.of(context).pushNamedAndRemoveUntil("/homeScreen", (context) => false);
                      },

                      child: Text("Add", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      return Scaffold(
        body: Center(child: Text("Provider error: $e")),
      );
    }
  }


  // @override
  // Widget build(BuildContext context) {
  //
  //   final bookViewModel = Provider.of<AddBookViewModel>(context);
  //   TextEditingController bookNameController = TextEditingController();
  //
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Add New Book"),
  //       centerTitle: true,
  //       backgroundColor: Color(0xff68548e).withOpacity(0.7),
  //     ),
  //     backgroundColor: Color(0xfff9f9f9),
  //     body: Container(
  //       child: Padding(
  //         padding: const EdgeInsets.all(20),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             TextFormField(
  //               controller: bookNameController,
  //               decoration: InputDecoration(
  //                   labelText: "Book Name*",
  //                   hintText: "Enter the Book Name",
  //                   enabledBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(10),
  //                       borderSide: BorderSide(color: Color(0xff68548e), width: 1.5)
  //                   ),
  //                   border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(10),
  //                       borderSide: BorderSide(color: Color(0xff68548e), width: 0.5)
  //                   )
  //               ),
  //             ),
  //             SizedBox(height: 15,),
  //             SizedBox(
  //               width: 150,
  //               child: ElevatedButton(
  //                   style: ButtonStyle(
  //                     elevation: MaterialStateProperty.all(1.5),
  //                     side: MaterialStateProperty.all(
  //                         BorderSide(color: Color(0xff68548e), width: 1.5)
  //                     ),
  //                   ),
  //                   onPressed: () async {
  //                     final newBook = BookModel(bookName: bookNameController.text);
  //
  //                     bookViewModel.addBook(newBook);
  //
  //                     bookNameController.clear();
  //
  //                     Navigator.of(context).pushNamedAndRemoveUntil("/homeScreen", (context) => false);
  //                   },
  //
  //                   child: Text("Add", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
