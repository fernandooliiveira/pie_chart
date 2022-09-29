import 'package:flutter/material.dart';
import 'package:pie_chart/pages/widgets/clipper/custom_shape_class.dart';
import 'package:pie_chart/pages/widgets/painter/button_painter.dart';

class CustomPainterExampleWidgets {
  static Widget buildShape() {
    return ClipPath(
      //COMO CRIAR EFFEITO QUE SERA USADO NO FUNDO COM GRAFICOS
      clipper: CustomShapeClass(),
      child: Container(
        color: Colors.greenAccent.withOpacity(0.7),
      ),
    );
  }

  static Widget buildButtonAnimation({
    required double height,
    required double width,
    required double percentValue,
    required Function() onPress,
  }) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CustomPaint(
          foregroundPainter: ButtonPainter(
            buttonBorderColor: Colors.grey,
            progressColor: Colors.black,
            percentage: percentValue,
            width: 10.0,
          ),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                shape: const CircleBorder(),
              ),
              onPressed: onPress,
              child: const Text(
                "Press",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }
}
