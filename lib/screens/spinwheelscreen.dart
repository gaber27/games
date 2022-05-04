import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinWheel extends StatefulWidget {
  @override
  _SpinWheelState createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  int selected = 0;
  List<int>numberselected=[10,20,50,100,200];
  int nus=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: const Text("Spin Wheel"),

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text('WON : '+" $nus",
            style: TextStyle(
              wordSpacing: 1,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          Container(
            height: 300,
            child: FortuneWheel(
              animateFirst: false,
              selected: selected,
              physics: CircularPanPhysics(
                duration: Duration(seconds: 3),
                curve: Curves.fastOutSlowIn,
              ),
              onFling: () {
                setState(() {
                  selected = Random().nextInt(4);
                });
              },
              styleStrategy: UniformStyleStrategy(
                borderColor: Colors.black,
                color: Colors.blueAccent[400],
                borderWidth: 3,
              ),
              items: [
                FortuneItem(child: Text("10", style: TextStyle(
                  color: Colors.white,
                ),)),
                FortuneItem(child: Text("20", style: TextStyle(
                  color: Colors.white,
                ),)),
                FortuneItem(child: Text("50", style: TextStyle(
                  color: Colors.white,
                ),)),
                FortuneItem(child: Text("100", style: TextStyle(
                  color: Colors.white,
                ),)),
                FortuneItem(child: Text("200", style: TextStyle(
                  color: Colors.white,
                ),)),
              ],
              onAnimationEnd: () {
                print("Value : " + "$selected");
                if(selected==0)
                {
                  setState(() {
                    nus=10;
                  });
                  print(10);

                }
                if(selected==1)
                {
                  setState(() {
                    nus=20;

                  });
                  print(20);
                }
                if(selected==2)
                {
                  setState(() {
                    nus=50;

                  });
                  print(50);
                }
                if(selected==3)
                {
                  setState(() {
                    nus= 100;
                  });
                  print(100);
                }
                if(selected==4)
                {
                  setState(() {
                    nus=200;
                  });
                  print(200);
                }
                // print(nus);
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selected = Random().nextInt(4);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.blueAccent[400]
                ),
                height: 40,
                width: 100,
                child: Center(child: Text("SPIN",
                    style: TextStyle(fontSize: 15,
                    letterSpacing: 1,
                    color:Colors.white
                    ),
                ),),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
