import 'package:books_project_dbms/view_models/add_book_view_model.dart';
import 'package:books_project_dbms/view_models/book_list_view_model.dart';
import 'package:books_project_dbms/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:books_project_dbms/views/add_book_view.dart';
import 'package:books_project_dbms/views/book_list_view.dart';
import 'package:books_project_dbms/main.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    final homeViewModel = Provider.of<HomeViewModel>(context);
    ThemeMode savedThemeMode = homeViewModel.themeMode;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        backgroundColor: Color(0xff68548e).withOpacity(0.7),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(savedThemeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
              onPressed: () {
                savedThemeMode = savedThemeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                homeViewModel.saveValue(savedThemeMode);
              },
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xfff9f9f9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(1.5),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Color(0xff68548e), width: 1.5)
                  ),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, "/addBook");
                },
                child: Text("Add New Book", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(1.5),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Color(0xff68548e), width: 1.5)
                    )
                ),
                onPressed: (){
                  Navigator.pushNamed(context, "/bookList");
                  },
                child: Text("Book List", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
