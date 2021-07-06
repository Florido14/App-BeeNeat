import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text('BeeNeat',
          textAlign: TextAlign.center,
          )
          ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget> [
          Expanded(
        child: ListView(
          children: <Widget>[
            miCard(),
            miCardDesign(),
          ],
        )
        ),
        ]
        )
        );
  }

  Card miCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
     child: Stack(
       children: [
         Ink.image(
           image: AssetImage('assets/images/Proyectos_A.png'),
           child: InkWell(
             onTap: (){},
           ),
           height: 240,
           fit: BoxFit.cover,
           )
       ],
     ),
      
      
    );
  }


 
  Card miCardDesign() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
       child: Stack(
       children: [
         Ink.image(
           image: AssetImage('assets/images/Proyectos_B.png'),
           child: InkWell(
             onTap: (){},
           ),
           height: 240,
           fit: BoxFit.cover,
           )
       ],
     ),
        );
  }
}