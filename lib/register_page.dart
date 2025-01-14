import 'package:azomin_frontend/add_classroom.dart';
import 'package:azomin_frontend/login_page.dart';
import 'package:azomin_frontend/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final _firstnameController = TextEditingController();
  static final _lastnameController = TextEditingController();
  static final _emailController = TextEditingController();
  static final _addressController = TextEditingController();
  static final _dateOfBirthController = TextEditingController();
  static final _phoneNumberController = TextEditingController();
  static final _classroomController = TextEditingController();
  static final _hireDateController = TextEditingController();
  static final _qualificationController = TextEditingController();
  static final _studentController = TextEditingController();
  static const List<String> genders = ["Male", "Female"];
  String? _selectedGender = genders.first;

  static const List<String> profiles = ["Student", "Teacher", "Tutor"];
  String selectedProfile = profiles.elementAt(1);

  @override
  void initState() {
    super.initState();
    // if (selectedProfile == "Student") {
    //   correspondingFields = StudentSpecificFields;
    // } else
    if (selectedProfile == "Teacher") {
      correspondingFields = TeacherSpecificFields;
    } else if (selectedProfile == "Tutor") {
      correspondingFields = StudentTutorSpecificFields;
    }
  }

  List<Widget> correspondingFields = [];

  Future fetchClassrooms() async {
    var classrooms = [];
    try {
      var response =
          await http.get(Uri.parse("http://127.0.0.1:8000/classrooms/"));
      classrooms = json.decode(response.body);
    } catch (e) {
      print(e);
    }
    return classrooms;
  }

  String? selectedClassroom;

  List<Widget> StudentTutorSpecificFields = [
    Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget("Student", 14, FontWeight.bold),
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: _studentController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    )
  ];
  List<Widget> TeacherSpecificFields = [
    Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextWidget("Hire date", 14, FontWeight.bold),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: _hireDateController,
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
              padding: EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextWidget("Qualification", 14, FontWeight.bold),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the qualification';
                        }
                        return null;
                      },
                      controller: _qualificationController,
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
          ],
        )),
  ];

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Handle date format variables
      var hireDate =
          _hireDateController.text == "" ? null : _hireDateController.text;
      var dateOfBirth = _dateOfBirthController.text == ""
          ? null
          : _dateOfBirthController.text;
      if (selectedProfile == "Student") {
        String registerStudentUrl = "http://127.0.0.1:8000/students/";
        var classroomId = int.parse(selectedClassroom!); //retrieve classroom id
        var data = {
          "firstName": _firstnameController.text,
          "lastName": _lastnameController.text,
          "dateOfBirth": dateOfBirth,
          "gender": _selectedGender,
          "address": _addressController.text,
          "phoneNumber": _phoneNumberController.text,
          "email": _emailController.text,
          "classroom_id": classroomId,
        };
        try {
          var response = await http.post(Uri.parse(registerStudentUrl),
              headers: {'content-type': 'application/json'},
              body: json.encode(data));
          print(response.reasonPhrase);
          print(response.statusCode);
          if (response.statusCode == 200) {
            _formKey.currentState!.reset();
          }
        } catch (e) {
          print(e);
        }
      } else if (selectedProfile == "Teacher") {
        String registerTeacherUrl = "http://127.0.0.1:8000/teachers/";
        var data = {
          "firstName": _firstnameController.text,
          "lastName": _lastnameController.text,
          "dateOfBirth": dateOfBirth,
          "gender": _selectedGender,
          "address": _addressController.text,
          "phoneNumber": _phoneNumberController.text,
          "email": _emailController.text,
          "hireDate": hireDate,
          "qualification": _qualificationController.text,
        };
        try {
          var response = await http.post(Uri.parse(registerTeacherUrl),
              headers: {'content-type': 'application/json'},
              body: json.encode(data));
          print(response.reasonPhrase);
          print(response.statusCode);
          if (response.statusCode == 200) {
            _formKey.currentState!.reset();
          }
        } catch (e) {
          print(e);
        }
      } else if (selectedProfile == "Tutor") {
        String registerTutorUrl = "http://127.0.0.1:8000/student_tutors/";
        var data = {
          "firstName": _firstnameController.text,
          "lastName": _lastnameController.text,
          "dateOfBirth": dateOfBirth,
          "gender": _selectedGender,
          "address": _addressController.text,
          "phoneNumber": _phoneNumberController.text,
          "email": _emailController.text,
          "student": _studentController.text,
        };
        try {
          var response = await http.post(Uri.parse(registerTutorUrl),
              headers: {'content-type': 'application/json'},
              body: json.encode(data));
          print(response.reasonPhrase);
          print(response.statusCode);
          if (response.statusCode == 200) {
            _formKey.currentState!.reset();
          }
        } catch (e) {
          print(e);
        }
      }
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _dateOfBirthController.dispose();
    _phoneNumberController.dispose();
    _classroomController.dispose();
    _hireDateController.dispose();
    _qualificationController.dispose();
    _studentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> StudentSpecificFields = [
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextWidget("Classroom", 14, FontWeight.bold),
                FutureBuilder(
                  future: fetchClassrooms(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      var classrooms = snapshot.data as List;
                      return SizedBox(
                        width: 400,
                        child: DropdownButtonFormField<String>(
                          value: selectedClassroom,
                          items: classrooms
                              .map<DropdownMenuItem<String>>((classroom) {
                            return DropdownMenuItem<String>(
                              value: classroom['id'].toString(),
                              child: Text(classroom['className']),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: InputBorder.none,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedClassroom = newValue!;
                            });
                          },
                        ),
                      );
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Classroom()),
                    );
                  },
                  child: MyTextWidget("Add", 14, FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      )
    ];
    return Scaffold(
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
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 30.0),
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 5.0),
                                        child: MyTextWidget(
                                            "Profile", 14, FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: DropdownButtonFormField<String>(
                                          value: selectedProfile,
                                          items: [
                                            for (String profile
                                                in _RegisterPageState.profiles)
                                              DropdownMenuItem(
                                                  value: profile,
                                                  child: Text("$profile"))
                                          ],
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedProfile = newValue!;
                                              if (selectedProfile ==
                                                  "Student") {
                                                correspondingFields =
                                                    StudentSpecificFields;
                                              } else if (selectedProfile ==
                                                  "Teacher") {
                                                correspondingFields =
                                                    TeacherSpecificFields;
                                              } else if (selectedProfile ==
                                                  "Tutor") {
                                                correspondingFields =
                                                    StudentTutorSpecificFields;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                              Column(children: [
                                Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MyTextWidget("Firstname", 14,
                                                  FontWeight.bold),
                                              SizedBox(
                                                width: 200,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please provide your first name';
                                                    }
                                                    return null;
                                                  },
                                                  controller:
                                                      _firstnameController,
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
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MyTextWidget("Lastname", 14,
                                                  FontWeight.bold),
                                              SizedBox(
                                                width: 200,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please provide your last name';
                                                    }
                                                    return null;
                                                  },
                                                  controller:
                                                      _lastnameController,
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
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MyTextWidget(
                                                  "Email", 14, FontWeight.bold),
                                              SizedBox(
                                                width: 200,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter your mail';
                                                    }
                                                    return null;
                                                  },
                                                  controller: _emailController,
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
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MyTextWidget("Address", 14,
                                                  FontWeight.bold),
                                              SizedBox(
                                                width: 200,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter your address';
                                                    }
                                                    return null;
                                                  },
                                                  controller:
                                                      _addressController,
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
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MyTextWidget("Gender", 14,
                                                  FontWeight.bold),
                                              SizedBox(
                                                width: 200,
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  value: _selectedGender,
                                                  items: [
                                                    for (String gender
                                                        in genders)
                                                      DropdownMenuItem(
                                                          value: gender,
                                                          child:
                                                              Text("$gender"))
                                                  ],
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.grey[200],
                                                    border: InputBorder.none,
                                                  ),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      _selectedGender =
                                                          newValue;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MyTextWidget("Date of birth", 14,
                                                  FontWeight.bold),
                                              SizedBox(
                                                width: 200,
                                                child: TextFormField(
                                                  controller:
                                                      _dateOfBirthController,
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
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyTextWidget("Phone number", 14,
                                              FontWeight.bold),
                                          SizedBox(
                                            width: 400,
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter your phone number';
                                                }
                                                return null;
                                              },
                                              controller:
                                                  _phoneNumberController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[200],
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                ...correspondingFields,
                              ]),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: SizedBox(
                                  width: 300,
                                  child: ElevatedButton(
                                    onPressed: _submitForm,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[200],
                                      minimumSize: Size(double.infinity,
                                          50), // Set the height
                                    ),
                                    child: const Text("Create account",
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Already have an account?",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()),
                                        );
                                      },
                                      child: MyTextWidget(
                                          "Login", 14, FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                )))
      ]),
    );
  }
}
