import 'package:flutter/material.dart';

class PracticeTabBar extends StatefulWidget {
  const PracticeTabBar({Key? key}) : super(key: key);

  @override
  State<PracticeTabBar> createState() => _PracticeTabBarState();
}

class _PracticeTabBarState extends State<PracticeTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.coffee, color: Colors.black)),
            Tab(icon: Icon(Icons.local_pizza, color: Colors.black)),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Container(color: Colors.green),
              Container(color: Colors.red),
            ],
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
          flex: 3,
        ),
      ],
    );
  }
}
