import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant.dart';
import '../shared/shared_component.dart';
import 'category.dart';

class  HomeScreen extends StatelessWidget{
  const HomeScreen ({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:
      Container(
          padding:EdgeInsets.only(left: 28,right: 28,top:25) ,
          child:SingleChildScrollView(
              child:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon:Icon(Icons.search),
                        hintText: "Search for anything",
                        hintStyle: TextStyle(color: Color.fromRGBO(160, 165, 189, 1),
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
                    SizedBox(height: 20),
                    Text("Check the Courses",style:
                    TextStyle(
                        color: Color.fromRGBO(0,0,0, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),),
                    SizedBox(height: 20),
                    SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categories.length,
                  (index) => Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CategoryBox(
                  selectedColor: Colors.white,
                  data: categories[index],
                  onTap: null,
                ),
              ),
            ),
          ),
        ),
                    SizedBox(height: 17),
                    Text("Features",style:
                    TextStyle(
                        color: Color.fromRGBO(0,0,0, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),),
                    SizedBox(height: 17),
                    Container(
                      height: 270,

                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildFavourite(index: index) ,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 20,) ,
                          itemCount: courses.length),
                    ),
                    SizedBox(height: 17),
                    Text("Check the Courses",style:
                    TextStyle(
                        color: Color.fromRGBO(0,0,0, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),),
                    SizedBox(height: 20,),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>Buildstack(
                          context: context,
                      index: index,
                      txt1: courses[index]['name'],

                    ) ,
                        separatorBuilder: (context, index) => SizedBox(height: 20,),
                        itemCount: courses.length)
                  ])
          )),


    );}

  Widget buildStack({
    required Image img,
    required String txt1,
    required String txt2,
  }) {
    return Stack(
      children: [
        img,
        Container(
          padding: EdgeInsets.only(top: 12,left: 10,right: 10),
          child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(txt1,
                  style: TextStyle(color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),),
                SizedBox(height: 5,),
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                  style: TextStyle(color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("20+",style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),),
                        SizedBox(height: 5,),
                        Text(txt2,style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),),
                      ],
                    ),
                    SizedBox(width: 27,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("25+",style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),),
                        SizedBox(height: 5,),
                        Text("Q&A",style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),),

                      ],
                    )
                  ],
                ),
                SizedBox(height: 7,),
                FloatingActionButton(onPressed: (){},
                    backgroundColor: Color.fromRGBO(229, 229, 229, 1),
                    // CircleAvatar(backgroundColor:Color.fromRGBO(229, 229, 229, 1),
                    child: Icon(CupertinoIcons.heart,color: Color.fromRGBO(141, 177, 27, 1),
                      size: 30,)),



              ]),
        )

      ],
    );
  }}