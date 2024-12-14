// import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';

class Registerview extends StatefulWidget{
  final String? title;
  const Registerview({Key?k, this.title}):super(key: k);

  @override
  State<Registerview> createState() => _MyRegisterViewState();
}

class _MyRegisterViewState extends State<Registerview>{

  final GlobalKey<FormState> _fkeyRegister = GlobalKey();

  String? _name,_email,_password,_cpassword;

  void _submitForm()
  {
    if(_fkeyRegister.currentState!.validate())
    {
      _fkeyRegister.currentState!.save();
      _fkeyRegister.currentState!.reset();
      log("$_name   $_email    $_password   $_cpassword");
      
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
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _fkeyRegister,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    //Logo
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,15,0,15),
                      child: Center(
                        child: Container(
                          height: 160,
                          width: 160,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black87)
                          ),
                          child: Image.asset("assets/images/logo.png"),
                        ),
                      )
                    ),

                    //Name field
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Name",
                          labelText: "Name",
                          prefixIcon: Icon(Icons.chat_bubble,color: Colors.green),
                          errorStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.redAccent)
                          )
                        ),
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                           _name = newValue;
                        },
                      ),
                    ),

                    //email 
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email, color: Colors.green),
                          errorStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.redAccent)
                          )
                        ),
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Please enter your email id";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                           _email = newValue;
                        },
                      ),
                    ),

                    //password
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.key, color: Colors.green,),
                          errorStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.redAccent)
                          )
                        ),
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Please enter password";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                           _password = newValue;
                        },
                      ),
                    ),

                    //confirm password
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: "Re-enter password",
                          labelText: "Re-enter password",
                          prefixIcon: Icon(Icons.key,color: Colors.orange,),
                          errorStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.redAccent)
                          )
                        ),
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Re enter the password";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                           _cpassword = newValue;
                        },
                      ),
                    ),

                    //Button
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: _submitForm, 
                        child: Text("Submit",style: TextStyle(fontSize: 22,color: Colors.black87))
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0,30,0,10),
                      child: Text(
                        "Or sign up using!", 
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    )
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}