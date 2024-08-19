import 'package:flutter/material.dart';
import 'package:lilac/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  logo,
                  width: 50,
                  height: 50,
                ),
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Home',
                      ),
                      Tab(
                        text: 'Search',
                      ),
                      Tab(
                        text: 'Profile',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Center(
                    child: Text('Home'),
                  ),
                  Center(
                    child: Text('Search'),
                  ),
                  Center(
                    child: Text('Profile'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
