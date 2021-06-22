import 'package:flutter/material.dart';
import 'package:shopplift/utils/size_config.dart';
import 'package:shopplift/utils/utils.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'WelcomeScreen.id';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  AnimationController? _controller1;
  Animation<Offset>? _offsetAnimation;

  AnimationController? _controller2;
  Animation<Offset>? _offsetAnimation1;

  AnimationController? _controller3;
  Animation<Offset>? _offsetAnimation2;

  AnimationController? _controller4;
  Animation<Offset>? _offsetAnimation3;

  AnimationController? _controller5;
  Animation<Offset>? _offsetAnimation4;

  AnimationController? _controller6;
  Animation<Offset>? _offsetAnimation5;

  late final AnimationController? _opacity;
  late final AnimationController? _opacity1;
  late final AnimationController? _opacity2;
  late final AnimationController? _opacity3;
  late final AnimationController? _opacity4;
  late final AnimationController? _opacity5;

  double opacity = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
    );

    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 4500),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation = Tween<Offset>(
      begin: Offset(-0.05, 0.6),
      end: const Offset(-0.05, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller1!,
      curve: Curves.easeIn,
    ));
    // Future.delayed(Duration(milliseconds: 1600), () {
    //   _controller1!.stop();
    // });

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 4500),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation1 = Tween<Offset>(
      begin: Offset(-0.3, 0.6),
      end: const Offset(-0.3, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller2!,
      curve: Curves.linear,
    ));

    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 4200),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation2 = Tween<Offset>(
      begin: Offset(0.3, 0.7),
      end: const Offset(0.3, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller3!,
      curve: Curves.linear,
    ));

    _controller4 = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation3 = Tween<Offset>(
      begin: Offset(-0.2, 0.7),
      end: const Offset(-0.2, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller4!,
      curve: Curves.easeIn,
    ));
    // Future.delayed(Duration(milliseconds: 2000), () {
    //   _controller4!.stop();
    // });

    _controller5 = AnimationController(
      duration: const Duration(milliseconds: 4100),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation4 = Tween<Offset>(
      begin: Offset(-0.5, 0.6),
      end: const Offset(-0.5, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller5!,
      curve: Curves.easeIn,
    ));
    // Future.delayed(Duration(milliseconds: 2800), () {
    //   _controller5!.stop();
    // });

    _controller6 = AnimationController(
      duration: const Duration(milliseconds: 4800),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation5 = Tween<Offset>(
      begin: Offset(0.4, 0.7),
      end: const Offset(0.4, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller6!,
      curve: Curves.easeIn,
    ));

    _opacity = AnimationController(
      duration: Duration(milliseconds: 4500),
      vsync: this,
    )..repeat(reverse: true, period: Duration(milliseconds: 4500));
    late final Animation<double> _animation = CurvedAnimation(
      parent: _opacity!,
      curve: Curves.easeIn,
    );
    _opacity!.reverse(from: 1);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _opacity!.reverse(from: 1);
          print(_opacity!.value);
        });
      }
    });

    _opacity1 = AnimationController(
      duration: Duration(milliseconds: 4200),
      vsync: this,
    )..repeat(reverse: true, period: Duration(milliseconds: 4200));
    late final Animation<double> _animation1 = CurvedAnimation(
      parent: _opacity1!,
      curve: Curves.easeIn,
    );
    _opacity1!.reverse(from: 1);
    _animation1.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _opacity1!.reverse(from: 1);
          print(_opacity1!.value);
        });
      }
    });

    _opacity2 = AnimationController(
      duration: Duration(milliseconds: 4000),
      vsync: this,
    )..repeat(reverse: true, period: Duration(milliseconds: 4000));
    late final Animation<double> _animation2 = CurvedAnimation(
      parent: _opacity2!,
      curve: Curves.easeIn,
    );
    _opacity2!.reverse(from: 1);
    _animation2.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _opacity2!.reverse(from: 1);
          print(_opacity2!.value);
        });
      }
    });

    _opacity3 = AnimationController(
      duration: Duration(milliseconds: 4100),
      vsync: this,
    )..repeat(reverse: true, period: Duration(milliseconds: 4100));
    late final Animation<double> _animation3 = CurvedAnimation(
      parent: _opacity3!,
      curve: Curves.easeIn,
    );
    _opacity3!.reverse(from: 1);
    _animation3.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _opacity3!.reverse(from: 1);
          print(_opacity3!.value);
        });
      }
    });

    _opacity4 = AnimationController(
      duration: Duration(milliseconds: 4500),
      vsync: this,
    )..repeat(reverse: true, period: Duration(milliseconds: 4500));
    late final Animation<double> _animation4 = CurvedAnimation(
      parent: _opacity4!,
      curve: Curves.easeIn,
    );
    _opacity4!.reverse(from: 1);
    _animation4.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _opacity4!.reverse(from: 1);
          print(_opacity4!.value);
        });
      }
    });

    _opacity5 = AnimationController(
      duration: Duration(milliseconds: 4800),
      vsync: this,
    )..repeat(reverse: true, period: Duration(milliseconds: 4800));
    late final Animation<double> _animation5 = CurvedAnimation(
      parent: _opacity5!,
      curve: Curves.easeIn,
    );
    _opacity5!.reverse(from: 1);
    _animation5.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _opacity5!.reverse(from: 1);
          print(_opacity5!.value);
        });
      }
    });
  }

  double? h;
  double? w;

  @override
  void dispose() {
    _controller!.dispose();
    _controller1!.dispose();
    _controller2!.dispose();
    _controller3!.dispose();
    _controller4!.dispose();
    _controller5!.dispose();
    _opacity!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    h = SizeConfig.sH!;
    w = SizeConfig.sW!;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              buildSlideTransition(
                Color(0xffBA97F5),
                Color(0xff774EBD),
                SizeConfig.sH! * 21,
                SizeConfig.sH! * 21,
                _opacity4!,
                _offsetAnimation!,
                BorderRadius.circular(SizeConfig.sH! * 30),
              ),
              buildSlideTransition(
                Color(0xffBA97F5),
                Color(0xff774EBD),
                SizeConfig.sH! * 11,
                SizeConfig.sH! * 11,
                _opacity!,
                _offsetAnimation1!,
                BorderRadius.circular(SizeConfig.sH! * 30),
              ),
              buildSlideTransition(
                Color(0xffBA97F5),
                Color(0xff774EBD),
                SizeConfig.sH! * 31,
                SizeConfig.sH! * 31,
                _opacity1!,
                _offsetAnimation2!,
                BorderRadius.circular(SizeConfig.sH! * 30),
              ),
              buildSlideTransition(
                Color(0xffEBC8FD),
                Color(0xffB770D1),
                SizeConfig.sH! * 7,
                SizeConfig.sH! * 7,
                _opacity2!,
                _offsetAnimation3!,
                BorderRadius.circular(SizeConfig.sH! * 30),
              ),
              buildSlideTransition(
                Color(0xffEBC8FD),
                Color(0xffB770D1),
                SizeConfig.sH! * 17,
                SizeConfig.sH! * 17,
                _opacity3!,
                _offsetAnimation4!,
                BorderRadius.circular(SizeConfig.sH! * 30),
              ),
              buildSlideTransition(
                Color(0xffEBC8FD),
                Color(0xffB770D1),
                SizeConfig.sH! * 27,
                SizeConfig.sH! * 27,
                _opacity5!,
                _offsetAnimation5!,
                BorderRadius.circular(SizeConfig.sH! * 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FadeTransition buildSlideTransition(
      Color? innerColor,
      Color? outerColor,
      double? height,
      double? width,
      Animation<double>? opacity,
      Animation<Offset>? position,
      BorderRadius? radius) {
    print(_controller2!.value);
    return FadeTransition(
      opacity: opacity!,
      child: SlideTransition(
        position: position!,
        child: Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.sW! * 0, bottom: SizeConfig.sH! * 0),
          child: Bubbles(
            radius: radius,
            heigth: height,
            width: width,
            innerColor: innerColor,
            outerColor: outerColor,
          ),
        ),
      ),
    );
  }
}
