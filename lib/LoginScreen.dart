import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  validator(){
    if (_formKey.currentState != null && !_formKey.currentState.validate()){
      print ("validated");
    }else{
      print("Not validated");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sigin Page'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height-60,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          ),
                          labelText: "Enter your Name"
                      ),
                      validator: (val) {
                        if (val == null || val.trim().length == 0) {
                          return "Field is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          ),
                          labelText: "Enter your Email"
                      ),
                      validator: (val) {
                        if (val == null || val.trim().length == 0) {
                          return "Field is required";
                        }
                        if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val)){
                          return "Please Enter valid email address";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          ),
                          labelText: "Enter your Password"
                      ),
                      //decoration: InputDecoration(labelText: "Enter your Password"),
                      validator: (val) {
                        if (val == null || val.trim().length == 0) {
                          return "Field is required";
                        }
                        if (val.length <= 6){
                          return "Password should nor be less than 6 characters ";
                        }
                        return null;

                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        validator();
                      },
                      child: Text(
                        ('SignIn'),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
