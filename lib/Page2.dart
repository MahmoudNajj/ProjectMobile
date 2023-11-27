import 'package:flutter/material.dart';
class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  List<String>images=[
    'assets/r1.jpg',
    'assets/r2.jpg',
    'assets/r3.jpg',
    'assets/r4.jpg',
    'assets/r5.jpg',
    'assets/r6.jpg',
    'assets/r7.jpg',
    'assets/r8.jpg',
    'assets/r9.jpg',
    'assets/r10.jpg',
    'assets/arduino.jpg',
    'assets/notfound.jpg'
  ];
  String _text='';
  String _text1='';

  int _x1=-1;
  void updateText(){
    setState(() {
      _text=images[0].toString();
      if(_x1==-1){
        _text=images[11].toString();
      }else {
        for (int i = 0; i < 10; i++) {
          if(_x1==i+1){
            _text=images[i].toString();
            _text1="$_x1";
            break;
          }
        }
      }


    });

  }
  void updateX1(String x){
    if(x.trim()==''){
      _x1=-1;
    }
    else{
      _x1=int.parse(x);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resistor App",style: TextStyle(color: Colors.black,fontSize: 60)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Enter Your Resistor Number:",style: TextStyle(color: Colors.lightBlue,fontSize: 30)),
            MytextField(f: updateX1),

            ElevatedButton(onPressed:updateText, child: Text('Enter')),
            Text("The Result is $_text1 Ω",style: TextStyle(color: Colors.red,fontSize: 30),),
            Image.asset(_text,width: 250,height: 250),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Icon(Icons.navigate_before,size: 50)),
          ],
        ),
      ) ,
    );
  }
}
class MytextField extends StatelessWidget {
  Function(String)f;
  MytextField({required this.f,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        style: TextStyle(color: Colors.black,fontSize: 40),
        decoration: InputDecoration(
            border: OutlineInputBorder(),hintText: "enter nb"
        ),
        onChanged: (value){f(value);},
      ),
    );
  }
}






