import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 107, 182, 1),
        elevation: 0,
        title: Text("Search"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(40),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.search,color: Colors.grey,),
                  hintText: "Search for anything",
                  hintStyle: TextStyle(
                      color: Color.fromRGBO(160, 165, 189, 1),
                      fontSize: 18),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none
                    //   color:  Color.fromRGBO(245, 245, 247, 1),
                  )
                  ,
                  fillColor: Color.fromRGBO(245, 245, 247, 1),
                  filled: true,
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
