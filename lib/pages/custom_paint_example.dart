import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pages/widgets/custom_painter_example.dart';

class CustomPaintExample extends StatefulWidget {
  @override
  _CustomPaintExampleState createState() => _CustomPaintExampleState();
}

class _CustomPaintExampleState extends State<CustomPaintExample> with SingleTickerProviderStateMixin{
  double percentValue = 0.0;
  double newPercentage = 0.0;
  late AnimationController _percentValueAnimationController;
  late double _height;
  late double _width;

  bool init = true;

  @override
  Widget build(BuildContext context) {

    if(init) {
      init = false;
      _height = MediaQuery.of(context).size.height;
      _width = MediaQuery.of(context).size.width;
      percentValue = 0.0;
      _percentValueAnimationController = AnimationController(
          vsync: this,
          duration: const Duration(seconds: 1)
      )
        ..addListener((){
          setState(() {
            percentValue = lerpDouble(percentValue,newPercentage,_percentValueAnimationController.value)!;
          });
        });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent[200],
        title: const Text('Custom Painter Example'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            CustomPainterExampleWidgets.buildShape(),
            CustomPainterExampleWidgets.buildButtonAnimation(
              height: _height/2,
              width: _width/2,
              percentValue: percentValue,
              onPress: (){
                print('*****************************');
                print(percentValue);

                setState(() {

                  percentValue = newPercentage;
                  newPercentage += 10;
                  if(newPercentage>100.0){
                    percentValue=0.0;
                    newPercentage=0.0;
                  }

                  _percentValueAnimationController.forward(from: 0.0);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}


