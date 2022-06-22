import 'package:flutter/material.dart';

import 'CommonAppBar.dart';

class RouteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CommonAppBar(
          title: 'route Demo',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/xxx'); //跳转不存在的路由 触发兜底页面
              },
              child: Text('跳转不存在页面'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => baseRoute(
                            context))); //基本路由演示 直接用materialPageRoute包裹 形成路由组件
              },
              child: Text('跳转基本路由'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/routeDemo/argument', //命名式路由跳转 带上argument
                    arguments: 'hello');
              },
              child: Text('跳转命名路由带参数'),
            ),
          )
        ],
      ),
    );
  }

  Widget baseRoute(BuildContext context) {
    return (Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('base route'),
            RaisedButton(
              onPressed: () => {Navigator.pop(context)},
              child: Text('返回'),
            )
          ],
        ),
      ),
    ));
  }
}
