import 'package:flutter/material.dart';

class PodcastHome extends StatelessWidget{
  final String? title;
  const PodcastHome({Key? k,this.title}):super(key: k);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(title.toString()),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/test');
          },
          child: const Text("Button"),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.widgets_rounded),label: "All categories")
        ],
      ),
      drawer: Drawer(
        elevation: 5.0,
        backgroundColor: Colors.black54,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.amberAccent),
              child: Center(
                child: Text(title.toString(),style: const TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Login"),
              textColor: Colors.white70,
              iconColor: Colors.amberAccent,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/login');
              },
            ),

            ListTile(
              leading: const Icon(Icons.account_circle_rounded),
              title: const Text("Register"),
              textColor: Colors.white70,
              iconColor: Colors.amberAccent,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/register');
              },
            )
          ],
        ),
      ),
    );
  }

}