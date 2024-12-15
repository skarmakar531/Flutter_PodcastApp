import 'package:flutter/material.dart';

class PodcastHome extends StatefulWidget{
  final String? title;
  const PodcastHome({Key? k,this.title}):super(key: k);

  @override
  State<PodcastHome> createState() => _MyPodcastHome();
}

class Pages extends StatelessWidget
{
  final String? text;

  const Pages({Key? k,this.text}):super(key:k);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text.toString(), 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
          )
        ],
      ),
    );
  }
}

class _MyPodcastHome extends State<PodcastHome>
{
  final PageController _myController = PageController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  final List<Widget> _listPages = <Widget>[
    Center(child: Pages(text: "Page1",)),
    Center(child: Pages(text: "Page2",)),
    Center(child: Pages(text: "Page3",)),
    Center(child: Pages(text: "Page4",))
  ];

  int _curr = 0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(widget.title.toString()),
        backgroundColor: Colors.amberAccent,
        actions: [
          Padding(
            padding: EdgeInsets.all(3),
            child: Text(
              "Page: ${(_curr+1).toString()}/${_listPages.length.toString()}",
              textScaler: TextScaler.linear(2.0),
            )
          ),
        ],
      ),
      body: Center(
        child: PageView(
          controller: _myController,
          children: [

            ColoredBox(
              color: Colors.red,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if(_myController.hasClients)
                    {
                      _myController.animateToPage(
                        1, 
                        duration: const Duration(milliseconds: 400), 
                        curve: Curves.easeInOut
                      );
                    }
                  }, 
                  child: const Text("Next")
                ),
              ),
            ),

            ColoredBox(
              color: Colors.blue,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if(_myController.hasClients)
                    {
                      _myController.animateToPage(
                        2, 
                        duration: const Duration(milliseconds: 400), 
                        curve: Curves.easeInOut
                      );
                    }
                  }, 
                  child: const Text("Next")
                ),
              ),
            ),

            ColoredBox(
              color: Colors.yellow,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if(_myController.hasClients)
                    {
                      _myController.animateToPage(
                        0, 
                        duration: const Duration(milliseconds: 400), 
                        curve: Curves.easeInOut
                      );
                    }
                  }, 
                  child: const Text("Previous")
                ),
              ),
            )

          ],
          onPageChanged: (value) {
            setState(() {
              _curr = value;
            });
          },
        )
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
                child: Text(widget.title.toString(),style: const TextStyle(fontSize: 30,fontStyle: FontStyle.italic)),
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