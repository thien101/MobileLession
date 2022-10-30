import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatelessWidget {
  FormLogin({super.key});
  var _formkey = GlobalKey<FormState>();
  var _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  const Text(
                    "Quen mat khau",
                    style: TextStyle(fontSize: 10, color: Colors.green),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text("Dang nhap",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
              TextFormField(
                validator: ((value) {
                  if (value == null || value.isEmpty)
                    // ignore: curly_braces_in_flow_control_structures
                    return "Ten dang nhap rong.";
                  return null;
                }),
                decoration: const InputDecoration(
                  hintText: "Nhap Email",
                  label: Text("Tai khoan"),
                ),
                controller: _userNameController,
              ),
              TextFormField(
                validator: ((value) {
                  if (value == null || value.isEmpty)
                    // ignore: curly_braces_in_flow_control_structures
                    return "mật khẩu rong.";
                  return null;
                }),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Dang Nhap",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => FormSubmit())));
                        },
                        child: const Text(
                          "Dang Ky",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormSubmit extends StatelessWidget {
  FormSubmit({super.key});

  var _formSbkey = GlobalKey<FormState>();
  var _userNameSbController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text("Dang Ky",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: ((value) {
                  if (value == null || value.isEmpty)
                    // ignore: curly_braces_in_flow_control_structures
                    return "Ten dang nhap rong.";
                  return null;
                }),
                decoration: const InputDecoration(
                  hintText: "Nhap tên dang nhap",
                  label: Text("Ten dang nhap"),
                ),
                controller: _userNameSbController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: ((value) {
                  if (value == null || value.isEmpty)
                    // ignore: curly_braces_in_flow_control_structures
                    return "mat khau rong.";
                  return null;
                }),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Dang Ky",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Go Back",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
