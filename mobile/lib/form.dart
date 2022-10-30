import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  var _formkey = GlobalKey<FormState>();
  var _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                validator: ((value) {
                  if (value == null || value.isEmpty)
                    // ignore: curly_braces_in_flow_control_structures
                    return "Ten dang nhap rong.";
                  return null;
                }),
                decoration: const InputDecoration(
                  hintText: "nhập tên đăng nhâp",
                  label: Text("Ten dang nhap"),
                  prefixIcon: Icon(Icons.person),
                ),
                controller: _userNameController, // thuộc tính tranng trí form
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      var snackBar = SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.person, color: Colors.white),
                            Text("Xin chao: ${_userNameController.text}"),
                          ],
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text("Dang nhap")),
            ],
          ),
        ),
      ),
    );
  }
}
