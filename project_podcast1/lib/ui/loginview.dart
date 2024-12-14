import 'dart:developer';

import 'package:flutter/material.dart';

class Loginview extends StatefulWidget{
  final String? title;
  const Loginview({Key? k,this.title}):super(key: k);

  @override
  State<Loginview> createState() => _MyLoginState();
}

class _MyLoginState extends State<Loginview>
{
  final GlobalKey<FormState> _fkeyLogin = GlobalKey();

  String? _email, _password;

  void _submitForm()
  {
    if(_fkeyLogin.currentState!.validate())
    {     
      _fkeyLogin.currentState!.save();
      _fkeyLogin.currentState!.reset();
      // print("Email: $_email, Password: $_password");
      log("Email: $_email, Password: $_password");

      
      
      Navigator.pop(context);
     }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(widget.title.toString()),
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _fkeyLogin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    //Logo
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blueGrey),
                          ),
                          child: Image.asset("assets/images/logo.jpg")
                          //child: const Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500))
                        ),
                      ),
                    ),

                    //Email field
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        autofocus: true,
                        validator: (value) {
                          if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) { 
                            return 'Enter a valid email!'; 
                            } 
                          return null; 
                        },
                        onSaved: (newValue) {
                          _email = newValue;
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email,color: Colors.green,),
                          errorStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent),
                            borderRadius: BorderRadius.all(Radius.circular(9.0))
                          )
                        ),
                      ),
                    ),

                    //Password field
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                        onSaved: (newValue) {
                          _password = newValue;
                        },
                        validator: (value) {
                          if (value!.isEmpty)
                          { 
                            return 'Enter a valid password'; 
                          }
                          else if(value.length<4)
                          {
                            return "Must contain more than 4 characters";
                          }
                          return null; 
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.key,color: Colors.green),
                          errorStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent),
                            borderRadius: BorderRadius.all(Radius.circular(9.0))
                          )
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: _submitForm, 
                          child: Text("Submit",style: TextStyle(fontSize: 22,color: Colors.black87))
                        ),
                      )
                    ),
                    
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0,30,0,0),
                        child: Text(
                          "Or Sign in using!", 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54)
                        ),
                      )
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            children: [
                              
                              Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.black87)
                                ),
                                child: Icon(Icons.golf_course, color: Colors.orange,)
                              ),

                              Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.black87)
                                ),
                                child: Icon(Icons.table_bar_outlined, color: Colors.orange,)
                              ),

                              Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.black87)
                                ),
                                child: Icon(Icons.ice_skating, color: Colors.orange,)
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}