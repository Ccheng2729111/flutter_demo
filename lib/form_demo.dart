import 'package:flutter/material.dart';

import 'CommonAppBar.dart';

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  late FocusNode unameNode;

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    unameNode = FocusNode();
  }

  @override
  void dispose() {
    unameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CommonAppBar(
          title: 'Row And Column Demo',
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                //每次控件changed都调用validator进行校验
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _phoneController,
                decoration: InputDecoration(
                    hintText: '手机号码',
                    labelText: '手机号码',
                    prefixIcon: Icon(Icons.phone)),
                validator: (value) {
                  RegExp reg = RegExp(r'^\d{11}$');
                  if (!reg.hasMatch(value!)) {
                    return '请输入11位的手机号码';
                  }
                  return null;
                },
              ),
              TextFormField(
                //每次控件changed都调用validator进行校验
                autovalidateMode: AutovalidateMode.onUserInteraction,
                focusNode: unameNode,
                controller: _unameController,
                decoration: InputDecoration(
                    hintText: '账号',
                    labelText: '账号',
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value == '') {
                    return '请输入账号';
                  }
                  return null;
                },
              ),
              TextFormField(
                //每次控件changed都调用validator进行校验
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofocus: true,
                controller: _pwdController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: '密码',
                    labelText: '密码',
                    prefixIcon: Icon(Icons.lock)),
                validator: (value) {
                  if (value == null || value == '') {
                    return '请输入密码';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        if ((_formKey.currentState as FormState).validate()) {
                          //通过controller可以直接获取到对应控件的值
                          print(_unameController.text);
                          print(_pwdController.text);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('success')),
                          );
                        }
                      },
                      child: Text('登录'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          unameNode.requestFocus();
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
