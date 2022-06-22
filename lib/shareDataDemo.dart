import 'package:flutter/material.dart';
import 'CommonAppBar.dart';
import 'count_container.dart';
import 'notification_widget.dart';
import 'event_bus_page.dart';

class ShareDataDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CommonAppBar(
          title: 'share data Demo',
        ),
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //生成底部tab
      length: 3,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            //底部tab分别控制的三个组件
            CounterPage(),
            NotificationWidget(),
            FirstPage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "InheritedWidget",
            ),
            Tab(
              icon: Icon(Icons.rss_feed),
              text: "Notification",
            ),
            Tab(
              icon: Icon(Icons.perm_identity),
              text: "EventBus",
            )
          ],
          //tab的样式
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}
