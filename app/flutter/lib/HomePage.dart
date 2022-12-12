import 'package:WhatsAppClone/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'chatPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  static const List<Widget> _screens = [ChatPage(), SearchPage(), CategoryPage()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(GetStorage().read('jwt'));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: -10,
        backgroundColor:  Colors.white30,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label: "Channels",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
        ],
        onTap: _updateIndex,
        currentIndex: _currentIndex,
      ),
      body: _screens[_currentIndex],
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Envoyer un nouveau message',
      //   onPressed: () => {_showOptions(context)},
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(30),
          height: 200,
          child: Column(
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => {},
                child: const Text("Ajouter"),
              ),
            ],
          ),
        );
      },
    );
  }
}
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
