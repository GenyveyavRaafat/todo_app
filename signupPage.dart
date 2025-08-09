import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/signup_provider.dart';
import 'form_style.dart';
import 'home.dart';
class signupPage extends StatelessWidget {
      signupPage({super.key}); 

      final _formkey=GlobalKey<FormState>();

      final TextEditingController fullnameeditingController=new TextEditingController();

      final TextEditingController emaileditingController=new TextEditingController();

      final TextEditingController passwordeditingController=new TextEditingController();

      final TextEditingController confirmpasswordeditingController=new TextEditingController();

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView( 
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                child:Image.network(
                ('https://static.vecteezy.com/system/resources/previews/003/689/231/non_2x/online-registration-or-sign-up-login-for-account-on-smartphone-app-user-interface-with-secure-password-mobile-application-for-ui-web-banner-access-cartoon-people-illustration-vector.jpg')
                ,height: 220.0,width: double.infinity,),
                ),
            SizedBox(height: 8.0,),
            Container(
            padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            width:600,
            child:
            TextFormField(
            controller: fullnameeditingController ,
              validator: (text){
              if(text==null || text.isEmpty){
                return "Please enter your name";
              }
              return null;
            },
          cursorColor: Colors.grey,
          decoration: ThemeHyper().textInputDecoration( "Enter your full name",Icon(Icons.person)),
          onSaved: (value) =>fullnameeditingController.text=value! ,
          ),
        ),
            


            Container(
            padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            width:600,
            child:
            TextFormField(
              controller:emaileditingController ,
              validator: (text){
              if( text!.isEmpty){
                return "Please enter email";
              }if(!EmailValidator.validate(text)){
                return "Please enter a valid email";
              }
              return null;
            },
            
          cursorColor: Colors.grey,
          decoration: ThemeHyper().textInputDecoration( "Enter your Email",Icon(Icons.email)),
          onSaved: (value) =>emaileditingController.text=value! ,
    ),
        ),



            Container(
            padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            width:600,
            child:
          TextFormField(
            controller:passwordeditingController ,
            validator: (text){
              if( text!.isEmpty){
                return "Please enter password";
              }if(text.length > 15||text.length < 6){
                return "Passwod must be greater than 6 characters and less than 15 characters";
              }
              return null;
            },
          cursorColor: Colors.grey,
          obscureText: true,
          decoration: ThemeHyper().textInputDecoration( "Enter password",Icon(Icons.lock)),
          onSaved: (value) =>passwordeditingController.text=value! ,
        ),
      ),


            Container(
            padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            width:600,
            child:
            TextFormField(
      
          controller:confirmpasswordeditingController ,
          validator: (text){
              if( text!.isEmpty){
                return "Please confirm password";
              }
              if(passwordeditingController.text!=confirmpasswordeditingController.text){
                return "Password does not mattch";
              }
              return null;
            },
          
          cursorColor: Colors.grey,
          obscureText: true,
          decoration: ThemeHyper().textInputDecoration( "Confirm Password",Icon(Icons.lock)),
          onSaved: (value) =>confirmpasswordeditingController.text=value! ,
          
          ),
        ),


          SizedBox(height: 6.0,),
            Container(
                child: Container( 
                  width: 515,
                  height: 45,
                  margin: EdgeInsets.all(15),
                  child: ElevatedButton (
                     onPressed: (){
                        var formval=_formkey.currentState;
                        if(formval!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                        }else{
                          // print("not valid");
                        }
                      Provider.of<form_provider>
                      (context,listen:false).signUp(
                        fullnameeditingController.text.toString()
                        ,emaileditingController.text.toString(),
                        passwordeditingController.text.toString());
                      },  
                          
                      child: Text('Submit',style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                         padding: EdgeInsets.fromLTRB(146, 12, 146, 12),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        elevation: 8,
                      ),
                  ),
                ),
            ),


            
                SizedBox(height: 8.0,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                  Text( "Already have an account? "),
                 TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>home()),);
                    },
                   child: Text( "SignIn",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),

                  )
                           
                            
                          
                   ],
                 )
                  // Text('Already have an account?'),
                  // TextButton(onPressed: (){}, child:Text('Signin') ,style: TextButton.styleFrom(
                  //   primary: Colors.black,
                  
                  // ),),
                    ],
                  ),
                
                
                
                
                ),
              ),
            ],


          ),
        ),
      ),




    );
  }
}

