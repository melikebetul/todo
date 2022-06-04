import 'package:flutter/material.dart';
import 'package:todo/page/ToDoPage.dart';

class CatigoryW extends StatelessWidget{

  String image;
  String text;
  
  
  CatigoryW({required this.image, required this.text});

  @override
  Widget build(BuildContext context){
    return 
    GestureDetector(
      child: Container(
        height: 177,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(159, 233, 30, 98),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 120,
              height: 120,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color.fromARGB(255, 249, 249, 249),
                fontSize: 18
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ToDoPage()),
      ),
    );
  }
}