import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  // 한번만 실행
  @override
  void initState() {
    super.initState();
    // 클릭 했을 경우 싱크를 맞춤
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(child: _buildTabBarView()),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(icon: Icon(Icons.directions_car)),
        Tab(icon: Icon(Icons.directions_transit)),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // 가로 사이 넓이
              crossAxisSpacing: 10,
              // 컬럼 수
              crossAxisCount: 3,
              // 새로 사이 넓이
              mainAxisSpacing: 10),
          // 총 이미지 갯수
          itemCount: 42,
          itemBuilder: (context, index) {
            // 이미지 불러오기
            return Image.network(
                "https://picsum.photos/id/${index + 1}/200/200");
          },
        ),
        Container(color: Colors.green),
      ],
    );
  }
}
