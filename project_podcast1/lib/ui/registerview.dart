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
      print("$_name   $_email    $_password   $_cpassword");
      
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
      body: Form(
        key: _fkeyRegister,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Center(
                child: Text("Register", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
              ),

              const SizedBox(height: 20.0,),

              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _name = newValue;
                },
              ),

              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(labelText: "Email Id"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your Email id';
                  }
                  // else if(value.trim()!.compareTo(other))
                  return null;
                },
                onSaved: (newValue) {
                  _email = newValue;
                },
              ),

              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your password';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _password = newValue;
                },
              ),

              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(labelText: "Re-enter password"),
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter the password again';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _cpassword = newValue;
                },
              ),

              const SizedBox(height: 20.0,),

              ElevatedButton(onPressed: _submitForm, child: const Text("Submit"))
            ],
          ),
        ),
      )
    );
  }
}