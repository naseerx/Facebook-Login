
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rive/rive.dart';

import 'components.dart';
import 'enum.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);



  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Artboard? riveArtBoard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;
  late RiveAnimationController controllerFail;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerLookDownRight;
  late RiveAnimationController controllerLookDownLeft;
  bool isLookingLeft = false;
  bool isLookingRight = false;
  final passwordFocusNode = FocusNode();
  var testEmail = "naseer@gmail.com";
  var testPassword = "123123";

  var formKey = GlobalKey<FormState>();
  bool  isPassword = true;

  void removeAllControllers()
  {
    riveArtBoard?.artboard.removeController(controllerIdle);
    riveArtBoard?.artboard.removeController(controllerHandsUp);
    riveArtBoard?.artboard.removeController(controllerHandsDown);
    riveArtBoard?.artboard.removeController(controllerFail);
    riveArtBoard?.artboard.removeController(controllerSuccess);
    riveArtBoard?.artboard.removeController(controllerLookDownRight);
    riveArtBoard?.artboard.removeController(controllerLookDownLeft);
    isLookingLeft = false;
    isLookingRight = false;
  }
  void addIdleController()
  {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerIdle);
    debugPrint("idlee");
  }
  void addHandUpController()
  {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerHandsUp);
    debugPrint("Hand up");
  }
  void addHandDownController()
  {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerHandsDown);
    debugPrint("Hand down");
  }
  void addFailController()
  {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerFail);
    debugPrint("faiillll");
  }
  void addSuccessController()
  {
    removeAllControllers();
    riveArtBoard?.artboard.addController(controllerSuccess);
    debugPrint("Success");
  }
  void addLookDownRightController()
  {
    removeAllControllers();
    isLookingRight= true;
    riveArtBoard?.artboard.addController(controllerLookDownRight);
    debugPrint("look right");
  }
  void addLookDownLeftController()
  {
    removeAllControllers();
    isLookingLeft = true;
    riveArtBoard?.artboard.addController(controllerLookDownLeft);
    debugPrint("look left");
  }
  void checkForPasswordFocusNodeToChangeAnimationState()
  {
    passwordFocusNode.addListener(()
    {
      if (passwordFocusNode.hasFocus)
      {
        addHandUpController();
      }
      else if (!passwordFocusNode.hasFocus)
      {
        addHandDownController();
      }

    });
  }


  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHandsUp = SimpleAnimation(AnimationEnum.hands_up.name);
    controllerHandsDown = SimpleAnimation(AnimationEnum.hands_down.name);
    controllerFail = SimpleAnimation(AnimationEnum.fail.name);
    controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerLookDownRight = SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerLookDownLeft = SimpleAnimation(AnimationEnum.Look_down_left.name);


    rootBundle.load('assets/bear.riv').then((data)
    {

      final file = RiveFile.import(data);

      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtBoard = artboard;
      });
    });
    checkForPasswordFocusNodeToChangeAnimationState();
  }
  void validateEmailAndPassword()
  {
    Future.delayed(const Duration(seconds: 1), (){

      if(formKey.currentState!.validate())
      {
        addSuccessController();
      } else
      {
        addFailController();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: HexColor('#d5e4ec'),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 250,
                      width: double.infinity,
                      child:
                      riveArtBoard == null ? SizedBox.shrink() :
                      Rive(artboard: riveArtBoard!)),

                  Container(

                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 5.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),


                            validator: (value) => value != testEmail ? "wrong Email" : null,
                            onChanged: (value)
                            {
                              if (value.isNotEmpty && value.length < 10 && !isLookingLeft )
                              {
                                addLookDownLeftController();
                              }else if (value.isNotEmpty && value.length > 10 && !isLookingRight)
                              {
                                addLookDownRightController();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            focusNode: passwordFocusNode,


                            validator: (value) => value != testPassword ? "wrong password" : null,


                          ),



                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: 'login' ,

                            function: (){
                              passwordFocusNode.unfocus();
                              validateEmailAndPassword();

                            },
                          ),
                        ],
                      ),
                    ),
                  ),




                ],
              ),
            ),
          ),
        ),

      ),

    );
  }
}