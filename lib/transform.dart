// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TransformExample extends StatefulWidget {
  const TransformExample({super.key});

  @override
  State<TransformExample> createState() => _TransformExampleState();
}

class _TransformExampleState extends State<TransformExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            DefautlAnimationControllerWidget(),
            SizedBox(height: 20),
            TransformScaleWidget(),
            TransformTranslateWidget(),
            TransFomrmRotate(),
            DefaultAnimatedContainerWidget(),
            SizedBox(height: 10),
            DefaultAnimatedCrossFadeWidget(),
            DefaultAnimatedPositionWidget(),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class TransformScaleWidget extends StatefulWidget {
  const TransformScaleWidget({super.key});

  @override
  State<TransformScaleWidget> createState() => _TransformScaleWidgetState();
}

class _TransformScaleWidgetState extends State<TransformScaleWidget> {
  double valrot = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Transform.scale(
            scale: valrot,
            child: DefaultContainer(),
          ),
        ),
        const SizedBox(height: 10),
        DefaultSlider(
          value: valrot,
          min: .0,
          max: 3.0,
          onChange: (val) {
            setState(() {
              valrot = val;
            });
          },
        ),
      ],
    );
  }
}

class TransformTranslateWidget extends StatefulWidget {
  const TransformTranslateWidget({super.key});

  @override
  State<TransformTranslateWidget> createState() =>
      _TransformTranslateWidgetState();
}

class _TransformTranslateWidgetState extends State<TransformTranslateWidget> {
  double x = 0;
  double y = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Transform.translate(
            offset: Offset(x, y),
            child: DefaultContainer(),
          ),
        ),
        const SizedBox(height: 10),
        DefaultSlider(
          value: x,
          min: 0,
          max: 150,
          onChange: (val) {
            setState(() {
              x = val;
            });
          },
        ),
        DefaultSlider(
          value: y,
          min: 0,
          max: 150,
          onChange: (val) {
            setState(() {
              y = val;
            });
          },
        ),
      ],
    );
  }
}

class TransFomrmRotate extends StatefulWidget {
  const TransFomrmRotate({super.key});

  @override
  State<TransFomrmRotate> createState() => _TransFomrmRotateState();
}

class _TransFomrmRotateState extends State<TransFomrmRotate> {
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.rotate(
          angle: angle,
          // التحكم في نقطه الدوران
          origin: const Offset(0, 50),
          child: DefaultContainer(
            width: 200,
            height: 70,
          ),
        ),
        DefaultSlider(
            value: angle,
            min: 0,
            max: 2 * 3.14,
            onChange: (val) {
              setState(() {
                angle = val;
              });
            })
      ],
    );
  }
}

class DefaultAnimatedContainerWidget extends StatefulWidget {
  const DefaultAnimatedContainerWidget({super.key});

  @override
  State<DefaultAnimatedContainerWidget> createState() =>
      _DefaultAnimatedContainerWidgetState();
}

class _DefaultAnimatedContainerWidgetState
    extends State<DefaultAnimatedContainerWidget> {
  bool isTransformed = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: isTransformed ? 200 : 100,
          height: isTransformed ? 200 : 100,
          curve: Curves.bounceIn,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isTransformed ? 100 : 10),
            color: isTransformed ? Colors.blue : Colors.teal,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isTransformed = !isTransformed;
            });
          },
          child: const Text("Transform"),
        ),
      ],
    );
  }
}

class DefaultAnimatedCrossFadeWidget extends StatefulWidget {
  const DefaultAnimatedCrossFadeWidget({super.key});

  @override
  State<DefaultAnimatedCrossFadeWidget> createState() =>
      _DefaultAnimatedCrossFadeWidgetState();
}

class _DefaultAnimatedCrossFadeWidgetState
    extends State<DefaultAnimatedCrossFadeWidget> {
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedCrossFade(
          firstChild: const Icon(
            Icons.person,
            size: 60,
          ),
          secondChild: const CircularProgressIndicator(),
          firstCurve: Curves.bounceIn,
          secondCurve: Curves.easeOutExpo,
          crossFadeState:
              isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isFirst = !isFirst;
            });
          },
          child: const Text("Animated Cross Fade"),
        ),
      ],
    );
  }
}

class DefaultAnimatedPositionWidget extends StatefulWidget {
  const DefaultAnimatedPositionWidget({super.key});

  @override
  State<DefaultAnimatedPositionWidget> createState() =>
      _DefaultAnimatedPositionWidgetState();
}

class _DefaultAnimatedPositionWidgetState
    extends State<DefaultAnimatedPositionWidget> {
  bool isMoved = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400,
          height: 300,
          color: Colors.teal,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(seconds: 3),
                top: isMoved ? 0 : 50,
                right: isMoved ? 0 : 300,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isMoved = !isMoved;
            });
          },
          child: const Text("Animated position"),
        ),
      ],
    );
  }
}

class DefautlAnimationControllerWidget extends StatefulWidget {
  const DefautlAnimationControllerWidget({super.key});

  @override
  State<DefautlAnimationControllerWidget> createState() =>
      _DefautlAnimationControllerWidgetState();
}

class _DefautlAnimationControllerWidgetState
    extends State<DefautlAnimationControllerWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween(begin: 50.0, end: 200.0).animate(_controller!)
      ..addStatusListener((status) {
        print(status);
      })
      ..addListener(() {
        setState(() {});
        // print('value ${_animation!.value}');
      });

    _controller!.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Transform.rotate(
          angle: -3.14 * 2 * _animation!.value,
          child: Container(
            color: Colors.teal,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}

class DefaultSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  Function(double)? onChange;
  DefaultSlider(
      {super.key,
      required this.value,
      required this.min,
      required this.max,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChange,
      min: min,
      max: max,
    );
  }
}

class DefaultContainer extends StatelessWidget {
  double? width;
  double? height;
  DefaultContainer({
    super.key,
    this.height = 100,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.teal,
    );
  }
}
