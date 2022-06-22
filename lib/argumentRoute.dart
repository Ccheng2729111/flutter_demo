import 'package:flutter/material.dart';

class ArgumentsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //取出路由参数
    String arg = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('this is arguments：$arg'),
            RaisedButton(
              onPressed: () => {Navigator.pop(context)},
              child: Text('返回'),
            )
          ],
        ),
      ),
    );
  }
}
