import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'pages': CategoriesScreen(), 'title': 'Categories'},
    {
      'page': FavouritesScreen(),
      'title': 'Your Favourite',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return /*DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.category,
              ),
              text: 'categories',
            ),
            Tab(
              icon: Icon(
                Icons.star,
              ),
              text: 'Favourites',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavouritesScreen(),
          ],
        ),
      ),
    );*/
        Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('categroies'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favourites'),
            ),
          ]),
    );
  }
}
