
//import 'package:dhopai/SignUp/sign_up_info.dart';

//import 'package:dhopai/database/db-handlar.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
//import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yuma_test/Repository/repository.dart';
import 'package:yuma_test/SIgnUp/sign_up_info.dart';

import '../SIgnIn/sign_in.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool checkedValue = false;
  bool showPassword=false;
  bool showRePassword=false;
  final List<Icon> iconsImage = [
    Icon(Icons.person),
    Icon(Icons.mail),
    Icon(Icons.phone_android),
    Icon(Icons.password_sharp)
  ];
   Repository rp=Repository();
  final _formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();
  //DBHelper? dbHelper;

  @override
  void initState() {
    final SignUpInfo infoOfSignUp = Provider.of<SignUpInfo>(
        context, listen: false);
    super.initState();
    usernameController = TextEditingController(text: infoOfSignUp.name);
    firstNameController = TextEditingController(text: infoOfSignUp.firstName);
    lastNameController = TextEditingController(text: infoOfSignUp.lastName);
    emailController = TextEditingController(text: infoOfSignUp.email);
   // dbHelper=DBHelper();
  }
  String? validatePassword(String? value) {
    if (value!.length < 5)
      {
        return 'Password must be more than 5 charater';
      }
    else
     {
       return null;
     }
  }
  String? validateRePassword(String? value) {
    if (value!=passwordController.text)
    {
      return 'Typed password must be same ';
    }
    else
    {
      return null;
    }
  }


  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    SignUpInfo infoOfSignUp = Provider.of<SignUpInfo>(context);
    return Scaffold(
      backgroundColor: Colors.white,

      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 150,
              // color: Colors.blue,
              child: Center(
                child: Image.asset(
                  'assets/images/yuma.png', height: 140, width: 140,),
              ),
            ),
            // nameTextBox(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 22.0, top: 18.0, bottom: 0.0, right: 22.0),
              child: Container(
                width: 266, //266.0,
                height: 48.0, //48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  // color: const Color(0xffe7ebee),
                  border: Border.all(
                      width: 2.0,
                      color: Colors.lightBlue.shade300
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: iconsImage[0],
                        hintText: 'User name....',
                        border: InputBorder.none
                      // labelText: hint,
                    ),

                    onChanged: infoOfSignUp.setUserName,
                    //onSubmitted:infoOfSignUp.setName ,

                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 22.0, top: 18.0, bottom: 0.0, right: 22.0),
              child: Container(
                width: 266, //266.0,
                height: 48.0, //48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  // color: const Color(0xffe7ebee),
                  border: Border.all(
                      width: 2.0,
                      color: Colors.lightBlue.shade300
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextFormField(
                    controller: firstNameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: iconsImage[0],
                        hintText: 'first name....',
                        border: InputBorder.none
                      // labelText: hint,
                    ),

                    onChanged: infoOfSignUp.setFirstName,
                    //onSubmitted: infoOfSignUp.setPhoneNumber,

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 22.0, top: 18.0, bottom: 0.0, right: 22.0),
              child: Container(
                width: 266, //266.0,
                height: 48.0, //48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  // color: const Color(0xffe7ebee),
                  border: Border.all(
                      width: 2.0,
                      color: Colors.lightBlue.shade300
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextFormField(
                    controller: lastNameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: iconsImage[0],
                        hintText: 'last name....',
                        border: InputBorder.none

                    ),

                    onChanged: infoOfSignUp.setLastName,


                  ),
                ),
              ),
            ),
            //  eMailTextBox(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 22.0, top: 18.0, bottom: 0.0, right: 22.0),
              child: Container(
                width: 266, //266.0,
                height: 48.0, //48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),

                  border: Border.all(
                      width: 2.0,
                      color: Colors.lightBlue.shade300
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: iconsImage[1],
                        hintText: 'Email....',
                        border: InputBorder.none

                    ),

                    onChanged: infoOfSignUp.setEmail,


                  ),
                ),
              ),
            ),
            //passwordTextBox(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 22.0, top: 18.0, bottom: 0.0, right: 22.0),
              child: Container(
                width: 266, //266.0,
                height: 48.0, //48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(
                      width: 2.0,
                      color: Colors.lightBlue.shade300
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextFormField(
                    controller: passwordController,
                    validator: validatePassword,
                    obscureText: showPassword==false?true:false,
                    decoration: InputDecoration(
                        icon: iconsImage[3],
                        hintText: 'password....',
                        suffixIcon: IconButton(
                          onPressed: (){
                            if(showPassword==false){
                              setState(() {
                                showPassword=true;
                              });
                            }
                            else{
                              setState(() {
                                showPassword=false;
                              });
                            }

                          },
                          icon:showPassword==true? Icon(Icons.visibility,color: Colors.grey,):Icon(Icons.visibility_off,color: Colors.grey,),
                        ),
                        border: InputBorder.none
                      // labelText: hint,
                    ),

                    onChanged: infoOfSignUp.setPassword,
                    // onSubmitted: infoOfSignUp.setPassword,

                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 22.0, top: 18.0, bottom: 0.0, right: 22.0),
              child: Container(
                width: 266, //266.0,
                height: 48.0, //48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),

                  border: Border.all(
                      width: 2.0,
                      color: Colors.lightBlue.shade300
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextFormField(
                    controller: confirmPassController,
                    validator: validateRePassword,
                    obscureText: showRePassword==false?true:false,

                    decoration: InputDecoration(
                        icon: iconsImage[3],
                        hintText: 'Retype password....',
                        suffixIcon: IconButton(
                          onPressed: (){
                            if(showRePassword==false){
                              setState(() {
                                showRePassword=true;
                              });
                            }
                            else{
                              setState(() {
                                showRePassword=false;
                              });
                            }

                          },
                          icon:showRePassword==true? Icon(Icons.visibility,color: Colors.grey,):Icon(Icons.visibility_off,color: Colors.grey,),
                        ),
                        border: InputBorder.none,



                    ),

                    onChanged: infoOfSignUp.setConfirmPassword,

                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 22.0, top: 38.0, bottom: 0.0, right: 22.0),
              child: Container(
                width: 266, //266.0,
                height: 48.0, //48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.lightBlue.shade500,
                ),
                child: MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      rp.registerUser(
                          usernameController.text.toString(),
                          firstNameController.text.toString(),
                          lastNameController.text.toString(),
                          emailController.text.toString(),
                          passwordController.text.toString()
                      );
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage()));
                    }

                  },
                  child: const FittedBox(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Sign Up', style: TextStyle(color: Colors.white),),
                      )),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            CheckboxListTile(
              title: const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text("You need to agree with the terms and conditions"),
              ),
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = !checkedValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
            )


          ],
        ),
      ),
    );
  }


}