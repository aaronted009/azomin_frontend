import 'package:azomin_frontend/login_page.dart';
import 'package:azomin_frontend/utils.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static const List<String> genders = ["Male", "Female"];

  static const List<String> profiles = ["Student", "Teacher", "Tutor"];
  String selectedProfile = profiles.first;

  List<Widget> commonBaseFields = [
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
                  MyTextWidget("Firstname", 14, FontWeight.bold),
                  SizedBox(
                    width: 200,
                    child: TextField(
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
                  MyTextWidget("Lastname", 14, FontWeight.bold),
                  SizedBox(
                    width: 200,
                    child: TextField(
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
            Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextWidget("Email", 14, FontWeight.bold),
                  SizedBox(
                    width: 200,
                    child: TextField(
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
                  MyTextWidget("Address", 14, FontWeight.bold),
                  SizedBox(
                    width: 200,
                    child: TextField(
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
            Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextWidget("Gender", 14, FontWeight.bold),
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField<String>(
                      value: genders.first,
                      items: [
                        for (String gender in genders)
                          DropdownMenuItem(
                              value: gender, child: Text("$gender"))
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                      ),
                      onChanged: (newValue) {
                        // setState(() {
                        //   value = newValue;
                        // });
                        // print(newValue);
                        // Handle dropdown change
                      },
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
                  MyTextWidget("Date of birth", 14, FontWeight.bold),
                  SizedBox(
                    width: 200,
                    child: TextField(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextWidget("Phone number", 14, FontWeight.bold),
              SizedBox(
                width: 400,
                child: TextField(
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
              SizedBox(
                width: 400,
                child: TextField(
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
                child: TextField(
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
                    child: TextField(
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
                    child: TextField(
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

  @override
  void initState() {
    super.initState();
    if (selectedProfile == "Student") {
      commonBaseFields += StudentSpecificFields;
    } else if (selectedProfile == "Teacher") {
      commonBaseFields += TeacherSpecificFields;
    } else if (selectedProfile == "Tutor") {
      commonBaseFields += StudentTutorSpecificFields;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
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
                                      if (selectedProfile == "Student") {
                                        commonBaseFields.removeWhere((field) =>
                                            TeacherSpecificFields.contains(
                                                field) ||
                                            StudentTutorSpecificFields.contains(
                                                field));
                                        commonBaseFields +=
                                            StudentSpecificFields;
                                      } else if (selectedProfile == "Teacher") {
                                        commonBaseFields.removeWhere((field) =>
                                            StudentSpecificFields.contains(
                                                field) ||
                                            StudentTutorSpecificFields.contains(
                                                field));
                                        commonBaseFields +=
                                            TeacherSpecificFields;
                                      } else if (selectedProfile == "Tutor") {
                                        commonBaseFields.removeWhere((field) =>
                                            TeacherSpecificFields.contains(
                                                field) ||
                                            StudentSpecificFields.contains(
                                                field));
                                        commonBaseFields +=
                                            StudentTutorSpecificFields;
                                      }
                                    });
                                    // print(newValue);
                                  },
                                ),
                              ),
                            ],
                          )),
                      Column(children: commonBaseFields),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle login action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              minimumSize:
                                  Size(double.infinity, 50), // Set the height
                            ),
                            child: const Text("Sign up",
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
                                      builder: (context) => LoginPage()),
                                );
                              },
                              child: MyTextWidget("Login", 14, FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )))
      ]),
    );
  }
}
