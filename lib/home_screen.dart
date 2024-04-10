import 'package:flutter/material.dart';
import 'package:form_app/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _formkey = GlobalKey<FormState>();
  TextEditingController uname = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  bool sv = false;
  bool cv = false;
  var rv;
  var ssv;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        centerTitle: true,
        title: Text("Form"),
      ),
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                TextFormField(
                  controller: uname,
                  validator: (value) {
                    if (value == "") {
                      return "username can not be empty";
                    }
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      label: Text("Username"),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: pcontroller,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == "") {
                      return "password can not be empty";
                    }
                  },
                  decoration: InputDecoration(
                      label: Text("Password"),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Are you developer?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: sv,
                      onChanged: (value) {
                        setState(() {
                          sv = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CheckboxListTile(
                  title: Text("Accept all terms and conditions"),
                  value: cv,
                  onChanged: (value) {
                    setState(() {
                      cv = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Gender:"),
                RadioListTile(
                  title: Text("Male"),
                  value: 1,
                  groupValue: rv,
                  onChanged: (value) {
                    setState(() {
                      rv = value;
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Female"),
                  value: 2,
                  groupValue: rv,
                  onChanged: (value) {
                    setState(() {
                      rv = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButton(
                  value: ssv,
                  hint: Text("Address"),
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      child: Text("Kathmandu"),
                      value: "Kathmandu",
                    ),
                    DropdownMenuItem(
                      child: Text("Lalitpur"),
                      value: "Lalitpur",
                    ),
                    DropdownMenuItem(
                      child: Text("Bhaktapur"),
                      value: "Bhaktapur",
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      ssv = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        if (ssv == null || rv == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please complete the form")));
                        } else {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen(
                                username: uname.text,
                                password: pcontroller.text,
                                sv: sv,
                                rv: rv,
                                cv: cv,
                                ssv: ssv,
                              );
                            },
                          ));
                        }
                      } else {}
                    },
                    child: Text("Submit"))
              ],
            ),
          )),
    );
  }
}
