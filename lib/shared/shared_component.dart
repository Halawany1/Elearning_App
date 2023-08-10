import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Bloc/Cubit/learn_cubit.dart';
import '../Constant.dart';
import '../modules/selectitem_screen.dart';

Widget buildTextFormField({required String hint,
  required IconData icon, TextEditingController ?controller,
   String? Function(String?)? validator,
  bool obscure=false,bool profile=false,bool readonly=false}) {
  return Material(
    shadowColor: Colors.black,
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30),
    child: TextFormField(
      readOnly: readonly,
      validator:validator,
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        prefixIcon: Icon(
          icon,
          size: 20,
          color: Colors.black,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: profile?Colors.black45:Color(0xFFCDCDCD)
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide.none,
    ),


      ),
    ),
  );
}

Widget buildElevatedButton({required String text,
  Color color=colorgreen,double width=274,
   required void Function() ?onpress}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius:
        BorderRadius.circular(30)),
        backgroundColor: color,
        minimumSize: Size(width, 56),
      ),
      onPressed: onpress,
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ));
}

Widget buildSafeArea({
  required Image image,
  required String txt1,
  required String txt2,
}) {
  return SafeArea(
    child:

    Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          image,
          SizedBox(height: 70,),
          Text(txt1,
            style: TextStyle(fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w700),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(txt2,
              textAlign: TextAlign.center
              ,style: TextStyle(fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.w400,),),
          ),
          Container(padding:EdgeInsets.only(top: 40,right: 360)
            ,child: Image(image: AssetImage("images/Ellipse 5.png")),)
        ],
      ),
    ),

  );
}



Widget buildStack({
  required Image image1,
  required String text1,
  required String text2,
  required LearnCubit cubit,
  required int index
}) {
  return InkWell(
    onTap: (){
      cubit.ChangeSelectItem(index);
    },
    child: Stack(
      children: [
        image1,
        Container(
          padding: EdgeInsets.only(top: 5,left: 127),
          child:
          Icon(
            cubit.select[index]?Icons.check_circle:null,
            color: Color.fromRGBO(141, 177, 27, 1),),),
        Positioned(
          bottom: 5,
          left: 15,
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  text2,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 221, 124, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                )
              ]),
        )
      ],
    ),
  );
}

Widget Buildstack({
  required String txt1,
  required int index,
  void Function() ?onpress,
  required context
}) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder:
      (context) =>SelectItemScreen(),));
    },
    child: Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    height: 190,
                    width: double.infinity,
                    fit: BoxFit.cover,
                      image: NetworkImage(courses[index]['image'])
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 15,
                  child: Container(
                    width: 54,
                    height: 27,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 2,),
                        Icon(
                          size: 20,
                          Icons.star,color:
                        CupertinoColors.systemYellow,),
                        SizedBox(width: 5,),
                        Text(courses[index]['review'])
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: IconButton(
                      icon: Icon(Icons.favorite,color: Colors.red,),
                      onPressed: () {

                      },
                    )
                  ),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Text(courses[index]['name'],style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.black
            ),),
            SizedBox(height: 10,),
           Row(children: [
             Text(courses[index]['price'],style: TextStyle(
                 fontWeight: FontWeight.w500,
                 fontSize: 18,
                 color: colorblue
             ),),
             SizedBox(width: 15,),
             Container(
               alignment: Alignment.center,
               child: Text(courses[index]['session'],style: TextStyle(
                      fontWeight: FontWeight.w500,
                            fontSize: 15,
                        color: colorgreen
                            ),),
               width: 100,
               height: 23,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 color: Colors.yellow[100]
               ),
             )
           ],)


          ],
        ),
      )
    ),
  );
}


Container buildFavourite({required int index}) {
  return Container(
    width: 200,
    height: 270,
    decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 220,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    courses[index]['image'] ,
                  ),
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                courses[index]['name'],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                courses[index]['price'],
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                courses[index]['duration'],
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                courses[index]['session'],
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Spacer(),
          Container(

            width: 70,
            height: 27,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 2,),
                Icon(
                  size: 20,
                  Icons.star,color:
                CupertinoColors.systemYellow,),
                SizedBox(width: 12,),
                Text(courses[index]['review'])
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


Widget buildQuestion() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Text("What is Lorem Ipsum?",
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: 5, right: 5, top: 0, bottom: 5),
        child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            style: TextStyle(fontSize: 15, color: Colors.grey)),
      ),
    ],
  );
}
