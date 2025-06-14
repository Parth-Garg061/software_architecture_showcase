import 'package:books_project_dbms/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:books_project_dbms/views/add_book_home.dart';
import 'package:books_project_dbms/views/book_list_home.dart';
import 'package:books_project_dbms/main.dart';
import 'package:books_project_dbms/models/database_manager/shared_pref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? savedValue;

  @override
  void initState() {
    super.initState();
    HomeController().loadSavedValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        backgroundColor: Color(0xff68548e).withOpacity(0.7),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(savedValue == "dark" ? Icons.dark_mode : Icons.light_mode),
              onPressed: () {
                themeNotifier.value = savedValue == "dark" ? ThemeMode.light : ThemeMode.dark;
                setState(() {
                  savedValue = savedValue == "dark" ? "light" : "dark";
                });
                HomeController().saveValue(savedValue!);
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddBookHome()));
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookListHome()));
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
