import 'package:flutter/material.dart';
import 'Page2.dart';
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String _text1='';
  void updateText1(String text){
    setState(() {
      _text1=text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: TextStyle(color: Colors.black,fontSize: 60)),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
          children: [

            Text("Welcome Dear $_text1",style: TextStyle(color: Colors.lightBlue,fontSize: 50)),
            SizedBox(
                width: 400,
                child: TextField(
                  style: TextStyle(color: Colors.lightBlue,fontSize: 50),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),hintText: 'Enter your name:'
                  ),
                  onChanged: (text){updateText1(text);},
                )
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>Page2())
              );
            }, child:Icon(Icons.navigate_next,size: 50)),
          ],
        ),
      ),
    );
  }
}
