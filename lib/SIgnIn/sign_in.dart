
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yuma_test/SIgnIn/sign_in_info.dart';
import 'package:yuma_test/dashboard.dart';

import '../Repository/repository.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final List<Icon> iconsImage = [
    Icon(Icons.person),
    Icon(Icons.mail),
    Icon(Icons.phone_android),
    Icon(Icons.password_sharp)
  ];
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  bool showPassword=false;
  List store=[];
  Repository repo=Repository();

   @override
  void initState() {
     final SignInInfo infoOfSignIn = Provider.of<SignInInfo>(context, listen: false);
    // TODO: implement initState
    super.initState();
     userNameController=TextEditingController(text: infoOfSignIn.userName);
     passwordController=TextEditingController(text: infoOfSignIn.password);

  }
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
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

            phoneNumberTextBox(),

            passwordTextBox(),


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
                child:  MaterialButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('username', userNameController.text.toString());
                     repo.logInUser(userNameController.text.toString(), passwordController.text.toString());
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashBoard()));

                  },
                  child:const FittedBox(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Sign In', style: TextStyle(color: Colors.white),),
                      )),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:68.0,right: 68.0,top: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){},
                      child: const Text('Forgot password?',style: TextStyle(color: Colors.lightBlue),)

                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                      onTap:(){
                      //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
                      },
                      child: const Text('create account!',style: TextStyle(color: Colors.lightBlue),))
                ],
              ),
            )



          ],
        ),

    );
  }
  Widget phoneNumberTextBox() {
    final infoOfSignIn  = Provider.of<SignInInfo>(context);
    return Padding(
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
              color:Colors.lightBlue.shade300
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: TextField(
            //style:TextStyle(color: Colors.white)  ,
            controller: userNameController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(

                icon: iconsImage[2],
                //iconColor: Colors.white,
                hintText: 'Phone Number....',
               // hintStyle:TextStyle(color: Colors.white) ,

                border: InputBorder.none
              // labelText: hint,
            ),

            onChanged: infoOfSignIn.setUserName,
            onSubmitted: infoOfSignIn.setUserName

          ),
        ),
      ),
    );
  }
  Widget passwordTextBox(){
    final infoOfSignIn  = Provider.of<SignInInfo>(context);
    return  Padding(
      padding: const EdgeInsets.only(left:22.0,top:18.0,bottom: 0.0,right: 22.0),
      child: Container(
        width:266, //266.0,
        height:48.0, //48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
              width: 2.0,
              color:  Colors.lightBlue.shade300
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:18.0),
          child: TextField(
            controller: passwordController,
            obscureText: showPassword==false?true:false,
            decoration:  InputDecoration(
                icon: iconsImage[3],
                hintText:'password....',

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
                  icon:showPassword==true? const Icon(Icons.visibility,color: Colors.grey,):const Icon(Icons.visibility_off,color: Colors.grey,),
                ),
                border: InputBorder.none


            ),

            onChanged:infoOfSignIn.setPassword,
            onSubmitted:infoOfSignIn.setPassword,

          ),
        ),
      ),
    );
  }
}
