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
      print("Email: $_email, Password: $_password");
      
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
        key: _fkeyLogin,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Center(
                child: Text("Login",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold))
              ),
              
              const SizedBox(height: 20.0,),

              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return 'Enter your email';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _email = newValue;
                },
              ),

              TextFormField(
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _password = newValue;
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