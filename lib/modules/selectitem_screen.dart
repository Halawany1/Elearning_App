
import 'package:flutter/material.dart';

import '../Constant.dart';
import '../shared/shared_component.dart';

class SelectItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Color.fromRGBO(0, 107, 182, 1),
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new,size: 20,)),
        title: Text(
          "Back",
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: Image(
                        width: double.infinity,
                        image: AssetImage(
                          "images/online1.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 10,
                      child: CircleAvatar(
                        child: Image(image: AssetImage("images/passion 1.png")),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Marketing E-Learning Course",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Text("Marcin",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            VerticalDivider(
                              color: Colors.yellow,
                              thickness: 1,
                            ),
                            Text("marcin@gmail.com",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            VerticalDivider(
                              color: Colors.yellow,
                              thickness: 1,
                            ),
                            Text("+212 123 456",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 337,
                            height: 163,
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, It has survived not only five centuries,",
                              style: TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Question & Answers",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("See more",
                              style: TextStyle(fontSize: 15, color: Colors.blue)),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => buildQuestion(),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Material(
              elevation: 15,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                topLeft: Radius.circular(60),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$120.00",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(width: 60),
                    buildElevatedButton(
                      text: "BUY NOW",
                      onpress: () {},
                      width: 204,
                    )
                  ],
                ),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60),
                  ),
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
