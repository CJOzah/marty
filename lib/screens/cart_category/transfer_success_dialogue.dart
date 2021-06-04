import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopplift/utils/size_config.dart';
import '../../home.dart';

class TransferSuccessDialogue extends StatefulWidget {
  static String id = 'TransferSuccessDialogue';

  const TransferSuccessDialogue({Key? key}) : super(key: key);

  @override
  _TransferSuccessDialogueState createState() =>
      _TransferSuccessDialogueState();
}

class _TransferSuccessDialogueState extends State<TransferSuccessDialogue>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  AnimationController? _controller1;
  Animation<Offset>? _offsetAnimation;

  AnimationController? _controller2;
  Animation<Offset>? _offsetAnimation1;

  AnimationController? _controller3;
  Animation<Offset>? _offsetAnimation2;

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
      begin: Offset(0.0, 1.5),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller1!,
      curve: Curves.elasticInOut,
    ));
    Future.delayed(Duration(milliseconds: 1400), () {
      _controller1!.stop();
    });

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation1 = Tween<Offset>(
      begin: Offset(0.0, 1.7),
      end: const Offset(0.0, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller2!,
      curve: Curves.elasticInOut,
    ));
    Future.delayed(Duration(milliseconds: 1600), () {
      _controller2!.stop();
    });

    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: false);
    _offsetAnimation2 = Tween<Offset>(
      begin: Offset(0.0, 1.7),
      end: const Offset(0.0, 0.2),
    ).animate(CurvedAnimation(
      parent: _controller3!,
      curve: Curves.elasticInOut,
    ));
    Future.delayed(Duration(milliseconds: 1800), () {
      _controller3!.stop();
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    _controller1!.dispose();
    _controller2!.dispose();
    _controller3!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.sH! * 25,
                  bottom: SizeConfig.sH! * 1,
                ),
                child: Lottie.asset(
                  'images/success_animation.json',
                  width: SizeConfig.sW! * 60,
                  height: SizeConfig.sH! * 40,
                  fit: BoxFit.fill,
                  controller: _controller,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    _controller!
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SlideTransition(
                    position: _offsetAnimation!,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.sH! * 2,
                      ),
                      child: Center(
                        child: Text(
                          "Congratulations!",
                          style: TextStyle(
                            fontSize: SizeConfig.sH! * 7,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _offsetAnimation1!,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.sW! * 5,
                        right: SizeConfig.sW! * 5,
                        bottom: SizeConfig.sH! * 39,
                      ),
                      child: Center(
                        child: Text(
                          "You have Successfully transferred the sum of  to  you will receive a debit alert soon",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: SizeConfig.sH! * 5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _offsetAnimation2!,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.sW! * 5.5,
                        right: SizeConfig.sW! * 5.5,
                        bottom: SizeConfig.sH! * 6,
                      ),
                      child: MaterialButton(
                        height: SizeConfig.sH! * 12,
                        minWidth: double.infinity,
                        color: Colors.blue.shade900,
                        child: Text(
                          "OK",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.sH! * 5,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            {
                              _controller!.reverse();
                              _controller1!.reverse();
                              _controller2!.reverse();
                              _controller3!.reverse().then((value) =>
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, FancyDraw.id, (route) => false));
                            }
                            // Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
