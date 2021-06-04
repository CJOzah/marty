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

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
    );

    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation = Tween<Offset>(
      begin: Offset(-0.05, 5.0),
      end: const Offset(-0.05, 3.4),
    ).animate(CurvedAnimation(
      parent: _controller1!,
      curve: Curves.elasticInOut,
    ));
    Future.delayed(Duration(milliseconds: 1600), () {
      _controller1!.stop();
    });

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation1 = Tween<Offset>(
      begin: Offset(0.0, 7.0),
      end: const Offset(0.0, 4.2),
    ).animate(CurvedAnimation(
      parent: _controller2!,
      curve: Curves.elasticInOut,
    ));
    Future.delayed(Duration(milliseconds: 1800), () {
      _controller2!.stop();
    });

    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation2 = Tween<Offset>(
      begin: Offset(0.05, 3.0),
      end: const Offset(0.05, 0.7),
    ).animate(CurvedAnimation(
      parent: _controller3!,
      curve: Curves.elasticInOut,
    ));
    Future.delayed(Duration(milliseconds: 2000), () {
      _controller3!.stop();
    });
    // Future.delayed(Duration(milliseconds: 2600), () {
    //   _controller3!.stop();
    // });

    _controller4 = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation3 = Tween<Offset>(
      begin: Offset(0.0, 4),
      end: const Offset(0.0, -1.0),
    ).animate(CurvedAnimation(
      parent: _controller4!,
      curve: Curves.elasticInOut,
    ));
    Future.delayed(Duration(milliseconds: 2000), () {
      _controller4!.stop();
    });

    _controller5 = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation4 = Tween<Offset>(
      begin: Offset(0.0, 1.7),
      end: const Offset(0.0, -1.0),
    ).animate(CurvedAnimation(
      parent: _controller5!,
      curve: Curves.elasticInOut,
    ));
    Future.delayed(Duration(milliseconds: 2800), () {
      _controller5!.stop();
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SlideTransition(
                    position: _offsetAnimation!,
                    child: FractionalTranslation(
                      child: Transform.rotate(
                        angle: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.sW! * 0,
                              bottom: SizeConfig.sH! * 0),
                          child: Bubbles(
                            radius: BorderRadius.circular(SizeConfig.sH! * 30),
                            heigth: SizeConfig.sH! * 21,
                            width: SizeConfig.sH! * 21,
                            innerColor: Color(0xffBA97F5),
                            outerColor: Color(0xff774EBD),
                          ),
                        ),
                      ),
                      translation:
                          Offset(SizeConfig.sW! / -11, SizeConfig.sH! / 15),
                    ),
                  ),
                  SlideTransition(
                    position: _offsetAnimation1!,
                    child: FractionalTranslation(
                      child: Transform.rotate(
                        angle: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.sW! * 0,
                              bottom: SizeConfig.sH! * 0),
                          child: Bubbles(
                            radius: BorderRadius.circular(SizeConfig.sH! * 30),
                            heigth: SizeConfig.sH! * 11,
                            width: SizeConfig.sH! * 11,
                            innerColor: Color(0xffBA97F5),
                            outerColor: Color(0xff774EBD),
                          ),
                        ),
                      ),
                      translation:
                          Offset(SizeConfig.sW! / -12, SizeConfig.sH! / 21),
                    ),
                  ),
                  SlideTransition(
                    position: _offsetAnimation2!,
                    child: FractionalTranslation(
                      child: Transform.rotate(
                        angle: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.sW! * 0,
                              bottom: SizeConfig.sH! * 0),
                          child: Bubbles(
                            radius: BorderRadius.circular(SizeConfig.sH! * 30),
                            heigth: SizeConfig.sH! * 31,
                            width: SizeConfig.sH! * 31,
                            innerColor: Color(0xffEBC8FD),
                            outerColor: Color(0xffB770D1),
                          ),
                        ),
                      ),
                      translation:
                          Offset(SizeConfig.sW! / 14, SizeConfig.sH! / 16),
                    ),
                  ),
                  SlideTransition(
                    position: _offsetAnimation3!,
                    child: FractionalTranslation(
                      child: Transform.rotate(
                        angle: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.sW! * 0,
                              bottom: SizeConfig.sH! * 0),
                          child: Bubbles(
                            radius: BorderRadius.circular(SizeConfig.sH! * 30),
                            heigth: SizeConfig.sH! * 7,
                            width: SizeConfig.sH! * 7,
                            innerColor: Color(0xffEBC8FD),
                            outerColor: Color(0xffB770D1),
                          ),
                        ),
                      ),
                      translation:
                          Offset(SizeConfig.sW! / 10, SizeConfig.sH! / 34),
                    ),
                  ),
                  SlideTransition(
                    position: _offsetAnimation4!,
                    child: FractionalTranslation(
                      child: Transform.rotate(
                        angle: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.sW! * 0,
                              bottom: SizeConfig.sH! * 0),
                          child: Bubbles(
                            radius: BorderRadius.circular(SizeConfig.sH! * 30),
                            heigth: SizeConfig.sH! * 17,
                            width: SizeConfig.sH! * 17,
                            innerColor: Color(0xffEBC8FD),
                            outerColor: Color(0xffB770D1),
                          ),
                        ),
                      ),
                      translation:
                          Offset(SizeConfig.sW! / 90.5, SizeConfig.sH! / 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
