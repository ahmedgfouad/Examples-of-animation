import 'package:flutter/material.dart';

class AnimateScrollHorizental extends StatelessWidget {
  const AnimateScrollHorizental({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: 250,
          child: RotatedBox(
            quarterTurns: 1,
            child: ListWheelScrollView(
                physics: const FixedExtentScrollPhysics(),
                itemExtent: 250, // طول العنصر
                // perspective: .009,
                diameterRatio: 2, // مدي ميلان العنصر
                squeeze: 1, // المسافه بين العناصر
                offAxisFraction: -1, // اتجاه العناصر في اللاسكرول
                children: List.generate(
                    6,
                    (index) => RotatedBox(
                          quarterTurns: 3,
                          child: Container(
                            width: 300,
                            color: Colors.blue,
                            child: Center(child: Text("Item $index")),
                          ),
                        ))),
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final int index;
  const CardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.blue,
      child: Center(child: Text("Item $index")),
    );
  }
}
