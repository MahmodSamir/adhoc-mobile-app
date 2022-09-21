import 'dart:convert';

import 'package:adhoc/screens/home.dart';
import 'package:adhoc/widgets/bezier_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart' as loc;
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
//import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  void initState() {
    super.initState(); //comes first for initState();
    _checkGps();
  }

  loc.Location location = loc.Location(); //explicit reference to the Location class
  Future _checkGps() async {
    if (!await location.serviceEnabled()) {
      location.requestService();
    }
  }

  Future getUser(String username, String password) async {
    try {
      Response res = await Dio()
          .post('https://system.adhoc.et3.co/api-token-auth/', data: {
        'username': username,
        'password': password,
      });

      if (res.statusCode == 200) {
        //print('w res $res');
        //print({res.data['token']}');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('key', '${res.data['token']}');
        final String? key = prefs.getString('key');
        print('token $key');
        // return(res.data['token'].toString());
        //var obj = jsonDecode(res.data);
        //return (obj);
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  var _formkey = GlobalKey<FormState>();
  var username_validator = RequiredValidator(errorText: "خانة مطلوبة");
  var password_validator = RequiredValidator(errorText: "خانة مطلوبة");
  bool visiblityPassword = true;
  String UserName = '';
  String password = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Widget _nameField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    validator: username_validator,
                    onChanged: (val) {
                      UserName = val;
                    },
                    decoration: const InputDecoration(
                      hintText: "اسم المستخدم",
                      labelText: "اسم المستخدم",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passController,
                    keyboardType: TextInputType.text,
                    validator: password_validator,
                    obscureText: visiblityPassword,
                    onChanged: (val) {
                      password = val;
                    },
                    decoration: InputDecoration(
                      hintText: "كلمة المرور",
                      labelText: "كلمة المرور",
                      suffixIcon: IconButton(
                        icon: Icon(
                            visiblityPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.teal[500]),
                        onPressed: () {
                          setState(() {
                            visiblityPassword = !visiblityPassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

/*  Widget _passField(String title) {
    String password = '';
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              controller: passController,
              keyboardType: TextInputType.text,
              validator: password_validator,
              obscureText: visiblityPassword,
              decoration: InputDecoration(
                hintText: "كلمة المرور",
                labelText: "كلمة المرور",
                suffixIcon: IconButton(
                  icon: Icon(
                      visiblityPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.teal[500]),
                  onPressed: () {
                    setState(() {
                      visiblityPassword = !visiblityPassword;
                    });
                  },
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }*/

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        if (_formkey.currentState!.validate()) {
          getUser(nameController.text, passController.text);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home()));
        }
        //print(token);
        //Navigator.push(
        //  context, MaterialPageRoute(builder: (context) => home()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffFCB040), Color(0xffCF1D5C)]),
        ),
        child: Text(
          'تسجيل الدخول',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'دخول مستخدم جديد',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'هل لديك حساب ؟',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Image.asset('assets/images/adhoc-logo.png'),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _nameField(),
        //  _passField("كلمة السر"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -height * .05,
                right: -MediaQuery.of(context).size.width * .26,
                child: BezierContainer()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _logo(),
                    SizedBox(height: 50),
                    _emailPasswordWidget(),
                    SizedBox(height: 20),
                    _submitButton(),
                    // Container(
                    //   padding: EdgeInsets.symmetric(vertical: 10),
                    //   alignment: Alignment.centerRight,
                    //   child: Text('Forgot Password ?',
                    //       style: TextStyle(
                    //           fontSize: 14, fontWeight: FontWeight.w500)),
                    // ),
                    SizedBox(height: height * .055),
                    _createAccountLabel(),
                  ],
                ),
              ),
            ),
            //Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      )),
    );
  }
}
