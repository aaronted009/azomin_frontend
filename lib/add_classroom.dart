import 'package:flutter/material.dart';
import 'package:azomin_frontend/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Classroom extends StatefulWidget {
  const Classroom({super.key});

  @override
  State<Classroom> createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
  final GlobalKey<FormState> _classroomFormKey = GlobalKey<FormState>();
  static final _classNameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _classNameController.dispose();
    super.dispose();
  }

  void _addClassroom() async {
    if (_classroomFormKey.currentState!.validate()) {
      String registerClassroomUrl = "http://127.0.0.1:8000/classrooms/";
      var data = {
        'className': _classNameController.text,
      };
      try {
        var response = await http.post(Uri.parse(registerClassroomUrl),
            headers: {'content-type': 'application/json'},
            body: json.encode(data));
        print(response.reasonPhrase);
        print(response.statusCode);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Classroom'),
        ),
        body: Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xffF2CECF),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 50, top: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage("images/school-icon.png"),
                                width: 24, // Adjust the width as needed
                                height: 24, // Adjust the height as needed
                              ),
                              SizedBox(
                                  width:
                                      8), // Add some spacing between the icon and text
                              MyTextWidget("AZOMIN", 15, FontWeight.bold),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(
                              bottom: 200), // Adjust the margin as needed
                          child: Image(
                            image: AssetImage("images/login.png"),
                            width: 300, // Adjust the width as needed
                            height: 300, // Adjust the height as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
                  color: Color(0xffFFFFFF),
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Form(
                          key: _classroomFormKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 30.0),
                                child: Text(
                                  "Classroom",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyTextWidget(
                                        "Classroom name", 14, FontWeight.bold),
                                    SizedBox(
                                      width: 400,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please provide your class name';
                                          }
                                          return null;
                                        },
                                        controller: _classNameController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: SizedBox(
                                  width: 200,
                                  child: ElevatedButton(
                                    onPressed: _addClassroom,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[200],
                                      minimumSize: Size(double.infinity,
                                          50), // Set the height
                                    ),
                                    child: const Text("Create classroom",
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]))))
        ]));
  }
}
