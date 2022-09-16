import 'package:firebase_app/helper/custom_text_field.dart';
import 'package:firebase_app/screens/first_screen.dart';
import 'package:firebase_app/screens/sign_up_screen.dart';
import 'package:firebase_app/utils/all_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}
FirebaseAuth _auth=FirebaseAuth.instance;
GlobalKey<FormState> _logInKey=GlobalKey<FormState>();
TextEditingController emailController=TextEditingController();
TextEditingController passController=TextEditingController();
AllColor allColor=AllColor();
class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    double scHeight=MediaQuery.of(context).size.height;
    double scWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _logInKey,
        child: SingleChildScrollView(
         // reverse: true,
          child: Column(
            children: [
              SizedBox(
                height: .2*scHeight,
              ),
              Padding(
                padding: EdgeInsets.only(bottom:5,left: 25,right: 25,top: 5 ),
                child: CustomTextField(controller: emailController,
                    icon: Icons.email_outlined,
                    errorMsg1: "email Incorrect",
                    keyBoardType: TextInputType.text,
                    hintText:"Enter Your Email",
                    lebelText: "Email",
                    fieldValue: " "),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:5,left: 25,right: 25,top: 5 ),
                child: CustomTextField(controller: passController,
                    icon: Icons.password_outlined,
                    errorMsg1: "Password Incorrect",
                    keyBoardType:TextInputType.text,
                    hintText:"Enter Your Password",
                    lebelText: "Password",
                    fieldValue: " "),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10,left: 25,right: 25,),
                child: Text("Forgot Your Password ?",textDirection: TextDirection.ltr,style: TextStyle(
                  color: allColor.textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:5,left: 25,right: 25,top: 5 ),
                child: InkWell(
                  onTap: (){
                    signIn(emailController.text, passController.text);
                  },
                  child: Container(
                    height: scHeight*.08,
                    width: scWidth,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("Log In",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10,left: 25,right: 25,),
                child: Text("OR",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10,left: 25,right: 25,),
                child: Container(
                  height: scHeight*.08,
                  width: scWidth,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook),
                        Text("Continue with Facebook",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20,left: 25,right: 25,),
                child: Container(
                  height: scHeight*.08,
                  width: scWidth,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.g_mobiledata,size: 50,),
                        Text("Continue with Google",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              RichText(text:TextSpan(
                  children: [
                    TextSpan(
                      text: "By continuing,you agree to Meta's",
                    ),
                    TextSpan(
                      text: "Terms of Services ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),TextSpan(
                      text: "& Privacy Policy .",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ]
              ),),
              // Padding(
              Padding(
                padding:  EdgeInsets.only(top: 20,left: scWidth*.3,right: scWidth*.3),
                child: Divider(color: allColor.textColor,),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10,left: 25,right: 25,),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                  },
                  child: Text("Don't have any account?SignUp",textDirection: TextDirection.ltr,style: TextStyle(
                    color: allColor.textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void signIn(email,pass)async{
  if(_logInKey.currentState!.validate()){
    await _auth.signInWithEmailAndPassword(email: email, password: pass).then((value) {
      Fluttertoast.showToast(
        backgroundColor: Colors.teal,
          textColor: Colors.black,
          msg: "Logged In successful.");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }).catchError((e){
       Fluttertoast.showToast(
         backgroundColor: Colors.red,
           msg: e.message);
    });
  }
  }
}
