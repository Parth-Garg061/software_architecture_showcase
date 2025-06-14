import 'package:books_project_dbms/controllers/add_book%20controller.dart';
import 'package:books_project_dbms/models/database_manager/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:books_project_dbms/views/home_screen.dart';
import 'package:books_project_dbms/models/data_models/book_model.dart';
import 'package:books_project_dbms/models/database_manager/shared_pref.dart';

class AddBookHome extends StatefulWidget {
  const AddBookHome({super.key});

  @override
  State<AddBookHome> createState() => _AddBookHomeState();
}

class _AddBookHomeState extends State<AddBookHome> {

  TextEditingController bookNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      final bookModel = BookModel(bookName: bookNameController.text);

                      await AddBookController().addBook(bookModel);

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
  }
}
