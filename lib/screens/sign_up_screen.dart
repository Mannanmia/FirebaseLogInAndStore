import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/helper/custom_text_field.dart';
import 'package:firebase_app/model/user_model.dart';
import 'package:firebase_app/screens/log_in_screen.dart';
import 'package:firebase_app/utils/all_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
FirebaseAuth _auth=FirebaseAuth.instance;
GlobalKey<FormState> _signUpKey=GlobalKey<FormState>();
TextEditingController emailController2=TextEditingController();
TextEditingController passController2=TextEditingController();
TextEditingController confirmpassController=TextEditingController();
TextEditingController nameController=TextEditingController();
TextEditingController phnController=TextEditingController();
AllColor allColor=AllColor();
class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double scHeight=MediaQuery.of(context).size.height;
    double scWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _signUpKey,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              SizedBox(
                height: .1*scHeight,
              ),
              Padding(
                padding: EdgeInsets.only(bottom:5,left: 25,right: 25,top: 5 ),
                child: CustomTextField(controller: nameController,
                    icon: Icons.person,
                    errorMsg1: "email Incorrect",
                    keyBoardType: TextInputType.text,
                    hintText:"Enter Your Name",
                    lebelText: "Name",
                    fieldValue: " "),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:5,left: 25,right: 25,top: 5 ),
                child: CustomTextField(controller: phnController,
                    icon: Icons.phone,
                    errorMsg1: "email Incorrect",
                    keyBoardType: TextInputType.number,
                    hintText:"Enter Your Phone Number",
                    lebelText: "Phone",
                    fieldValue: " "),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:5,left: 25,right: 25,top: 5 ),
                child: CustomTextField(controller: emailController2,
                    icon: Icons.email_outlined,
                    errorMsg1: "email Incorrect",
                    keyBoardType: TextInputType.text,
                    hintText:"Enter Your Email",
                    lebelText: "Email",
                    fieldValue: " "),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:5,left: 25,right: 25,top: 5 ),
                child: CustomTextField(controller: passController2,
                    icon: Icons.password_outlined,
                    errorMsg1: "Password Incorrect",
                    keyBoardType:TextInputType.text,
                    hintText:"Enter Your Password",
                    lebelText: "Password",
                    fieldValue: " "),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:5,left: 25,right: 25,top: 5 ),
                child: CustomTextField(controller: confirmpassController,
                    icon: Icons.password_outlined,
                    errorMsg1: "Password Incorrect",
                    keyBoardType:TextInputType.text,
                    hintText:"Confirm Your Password",
                    lebelText: "Confirm Password",
                    fieldValue: " "),
              ),
              SizedBox(
                height: scHeight*0.05,
              ),
              Padding(
                padding: EdgeInsets.only(bottom:5,left: 25,right: 25,top: 5 ),
                child: InkWell(
                  onTap: (){
                    if(passController2.text==confirmpassController.text){
                        if(_signUpKey.currentState!.validate()){
                             signUp(
                               emailController2.text,
                               passController2.text,
                             );

                        }
                    }else {
                      Fluttertoast.showToast(msg: "Password Doesn't Match");
                    }
                    // signIn(emailController.text, passController.text);
                  },
                  child: Container(
                    height: scHeight*.08,
                    width: scWidth,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("Sign Up",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),),
                    ),
                  ),
                ),
              ),
              // Padding(
            ],
          ),
        ),
      ),
    );
  }
  void signUp(email,pass) async{
    await _auth.createUserWithEmailAndPassword(email: email, password: pass).then((value) {
      saveSignUpDetails();
      Fluttertoast.showToast(msg: "Sign In successful");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogInPage()));
    }).catchError((e){
      Fluttertoast.showToast(msg:e.message);
    });

  }
  void saveSignUpDetails()async{
    FirebaseFirestore firestore=FirebaseFirestore.instance;
    User? user=FirebaseAuth.instance.currentUser;
    UserModel userModel=UserModel();

    userModel.userId=user!.uid;
    userModel.name=nameController.text;
    userModel.phone=phnController.text;
    userModel.email=emailController2.text;

    await firestore.collection("User Info").doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: "Data Save Successful");
  }
}
