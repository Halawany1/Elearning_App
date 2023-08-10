import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/home_model.dart';
import 'modules/CreateAccount_screen.dart';



Color AppbarAndStatusColor= Color(0xFF006BB6);

const colorgreen = Color(0xFF8DB11B);
const colorblue = Color(0xFF006BB6);

String ?token;

class AppColor {
  static const primary = Color(0xFFf77080);
  static const secondary = Color(0xFFe96561);

  static const mainColor = Color(0xFF000000);
  static const darker = Color(0xFF3E4249);
  static const cardColor = Colors.white;
  static const appBgColor = Color(0xFFF7F7F7);
  static const appBarColor = Color(0xFFF7F7F7);
  static const bottomBarColor = Colors.white;
  static const inActiveColor = Colors.grey;
  static const shadowColor = Colors.black87;
  static const textBoxColor = Colors.white;
  static const textColor = Color(0xFF333333);
  static const glassTextColor = Colors.white;
  static const labelColor = Color(0xFF8A8989);
  static const glassLabelColor = Colors.white;
  static const actionColor = Color(0xFFe54140);

  static const yellow = Color(0xFFffcb66);
  static const green = Color(0xFFa2e1a6);
  static const pink = Color(0xFFf5bde8);
  static const purple = Color(0xFFcdacf9);
  static const red = Color(0xFFf77080);
  static const orange = Color(0xFFf5ba92);
  static const sky = Color(0xFFABDEE6);
  static const blue = Color(0xFF509BE4);

  static const listColors = [
    green,
    purple,
    yellow,
    orange,
    sky,
    secondary,
    red,
    blue,
    pink,
    yellow,
  ];
}
List categories = [
  {
    "name" : "All",
    "icon" : "images/all.svg"
  },
  {
    "name" : "Coding",
    "icon" : "images/coding.svg"
  },
  {
    "name" : "Education",
    "icon" : "images/education.svg"
  },
  {
    "name" : "Design",
    "icon" : "images/design.svg"
  },
  {
    "name" : "Business",
    "icon" : "images/business.svg"
  },
  {
    "name" : "Cooking",
    "icon" : "images/cooking.svg"
  },
  {
    "name" : "Music",
    "icon" : "images/music.svg"
  },
  {
    "name" : "Art",
    "icon" : "images/art.svg"
  },
  {
    "name" : "Finance",
    "icon" : "images/finance.svg"
  },
];

List courses = [
  {
    "id" : 100,
    "name" : "UI/UX Design",
    "image" : "https://images.unsplash.com/photo-1596638787647-904d822d751e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$110.00",
    "duration" : "10 hours",
    "session" : "6 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 101,
    "name" : "Programming",
    "image" : "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$155.00",
    "duration" : "20 hours",
    "session" : "12 lessons",
    "review" : "4.3",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 102,
    "name" : "English Writing",
    "image" : "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$65.00",
    "duration" : "12 hours",
    "session" : "4 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 103,
    "name" : "Mix Salad",
    "image" : "https://images.unsplash.com/photo-1507048331197-7d4ac70811cf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$80.00",
    "duration" : "4 hours",
    "session" : "3 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 104,
    "name" : "Guitar Class",
    "image" : "https://images.unsplash.com/photo-1549298240-0d8e60513026?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$125.00",
    "duration" : "12 hours",
    "session" : "4 lessons",
    "review" : "4.2",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 105,
    "name" : "Painting",
    "image" : "https://images.unsplash.com/photo-1596548438137-d51ea5c83ca5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$65.00",
    "duration" : "12 hours",
    "session" : "8 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 106,
    "name" : "Skills",
    "image" : "https://images.unsplash.com/photo-1552664730-d307ca884978?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$135.00",
    "duration" : "6 hours",
    "session" : "4 lessons",
    "review" : "4.7",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 107,
    "name" : "Caster",
    "image" : "https://images.unsplash.com/photo-1554446422-d05db23719d2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$95.00",
    "duration" : "8 hours",
    "session" : "4 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 108,
    "name" : "Management",
    "image" : "https://images.unsplash.com/photo-1542626991-cbc4e32524cc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$75.00",
    "duration" : "9 hours",
    "session" : "5 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 100,
    "name" : "UI/UX Design",
    "image" : "https://images.unsplash.com/photo-1596638787647-904d822d751e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$110.00",
    "duration" : "10 hours",
    "session" : "6 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 101,
    "name" : "Programming",
    "image" : "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$155.00",
    "duration" : "20 hours",
    "session" : "12 lessons",
    "review" : "3.2",
    "is_favorited" : true,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 102,
    "name" : "English Writing",
    "image" : "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$65.00",
    "duration" : "12 hours",
    "session" : "4 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 103,
    "name" : "Photography",
    "image" : "https://images.unsplash.com/photo-1472393365320-db77a5abbecc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$80.00",
    "duration" : "4 hours",
    "session" : "3 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 104,
    "name" : "Guitar Class",
    "image" : "https://images.unsplash.com/photo-1549298240-0d8e60513026?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$125.00",
    "duration" : "12 hours",
    "session" : "4 lessons",
    "review" : "2.7",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 105,
    "name" : "Painting",
    "image" : "https://images.unsplash.com/photo-1596548438137-d51ea5c83ca5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$65.00",
    "duration" : "12 hours",
    "session" : "8 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 106,
    "name" : "Social Media",
    "image" : "https://images.unsplash.com/photo-1611162617213-7d7a39e9b1d7?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$135.00",
    "duration" : "6 hours",
    "session" : "4 lessons",
    "review" : "2.9",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 107,
    "name" : "Caster",
    "image" : "https://images.unsplash.com/photo-1554446422-d05db23719d2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$95.00",
    "duration" : "8 hours",
    "session" : "4 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 108,
    "name" : "Management",
    "image" : "https://images.unsplash.com/photo-1542626991-cbc4e32524cc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$75.00",
    "duration" : "9 hours",
    "session" : "5 lessons",
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 100,
    "name" : "UI/UX Design",
    "image" : "https://images.unsplash.com/photo-1596638787647-904d822d751e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$110.00",
    "duration" : "10 hours",
    "session" : "6 lessons",
    "progress" : "4 lessons",
    "completed" : "2 lessons",
    "complete_percent" : 0.33,
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 105,
    "name" : "Painting",
    "image" : "https://images.unsplash.com/photo-1596548438137-d51ea5c83ca5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$65.00",
    "duration" : "12 hours",
    "session" : "10 lessons",
    "progress" : "3 lessons",
    "completed" : "7 lessons",
    "complete_percent" : 0.7,
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 106,
    "name" : "Mobile App",
    "image" : "https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$135.00",
    "duration" : "30 hours",
    "session" : "10 lessons",
    "progress" : "2 lessons",
    "completed" : "8 lessons",
    "complete_percent" : 0.8,
    "review" : "4.1",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 104,
    "name" : "Photography",
    "image" : "https://images.unsplash.com/photo-1472393365320-db77a5abbecc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$125.00",
    "duration" : "12 hours",
    "session" : "5 lessons",
    "progress" : "2 lessons",
    "completed" : "3 lessons",
    "complete_percent" : 0.6,
    "review" : "4.9",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 100,
    "name" : "Graphic Design",
    "image" : "https://images.unsplash.com/photo-1602576666092-bf6447a729fc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$110.00",
    "duration" : "10 hours",
    "session" : "6 lessons",
    "progress" : "0 lessons",
    "completed" : "6 lessons",
    "complete_percent" : 1,
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 101,
    "name" : "Web",
    "image" : "https://images.unsplash.com/photo-1534972195531-d756b9bfa9f2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$155.00",
    "duration" : "20 hours",
    "session" : "12 lessons",
    "progress" : "0 lessons",
    "completed" : "12 lessons",
    "complete_percent" : 1,
    "review" : "1.9",
    "is_favorited" : true,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 102,
    "name" : "English Speaking",
    "image" : "https://images.unsplash.com/photo-1565538420870-da08ff96a207?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$65.00",
    "duration" : "10 hours",
    "session" : "8 lessons",
    "progress" : "0 lessons",
    "completed" : "8 lessons",
    "complete_percent" : 1,
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 106,
    "name" : "Social Media",
    "image" : "https://images.unsplash.com/photo-1611162617213-7d7a39e9b1d7?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$135.00",
    "duration" : "6 hours",
    "session" : "4 lessons",
    "progress" : "0 lessons",
    "completed" : "4 lessons",
    "complete_percent" : 1,
    "review" : "4.3",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 104,
    "name" : "Internet Course",
    "image" : "https://images.unsplash.com/photo-1603791440384-56cd371ee9a7?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$125.00",
    "duration" : "8 hours",
    "session" : "5 lessons",
    "progress" : "0 lessons",
    "completed" : "5 lessons",
    "complete_percent" : 1,
    "review" : "3.9",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 102,
    "name" : "English Writing",
    "image" : "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$65.00",
    "duration" : "12 hours",
    "session" : "5 lessons",
    "progress" : "0 lessons",
    "completed" : "5 lessons",
    "complete_percent" : 1,
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 103,
    "name" : "Mix Salad",
    "image" : "https://images.unsplash.com/photo-1507048331197-7d4ac70811cf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$80.00",
    "duration" : "4 hours",
    "session" : "4 lessons",
    "progress" : "0 lessons",
    "completed" : "4 lessons",
    "complete_percent" : 1,
    "review" : "4.5",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
  {
    "id" : 104,
    "name" : "Guitar Class",
    "image" : "https://images.unsplash.com/photo-1549298240-0d8e60513026?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$125.00",
    "duration" : "12 hours",
    "session" : "10 lessons",
    "progress" : "0 lessons",
    "completed" : "10 lessons",
    "complete_percent" : 1,
    "review" : "4.1",
    "is_favorited" : false,
    "description" : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
  },
];






List lessons = [
  {
    "name" : "Introduction to UI/UX Design",
    "image" : "https://images.unsplash.com/photo-1541462608143-67571c6738dd?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "duration" : "45 minutes",
    "video_url" : "",
  },
  {
    "name" : "UI/UX Research",
    "image" : "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "duration" : "55 minutes",
    "video_url" : "",
  },
  {
    "name" : "Wireframe and Prototype",
    "image" : "https://images.unsplash.com/photo-1586717799252-bd134ad00e26?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "duration" : "65 minutes",
    "video_url" : "",
  },
  {
    "name" : "Usability Testing",
    "image" : "https://images.unsplash.com/photo-1618761714954-0b8cd0026356?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "duration" : "45 minutes",
    "video_url" : "",
  },
  {
    "name" : "Tools and Mockup",
    "image" : "https://images.unsplash.com/photo-1634084462412-b54873c0a56d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "duration" : "80 minutes",
    "video_url" : "",
  },
  {
    "name" : "UI/UX Design Jobs",
    "image" : "https://images.unsplash.com/photo-1609921212029-bb5a28e60960?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhc2hpb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "duration" : "50 minutes",
    "video_url" : "",
  }
];
