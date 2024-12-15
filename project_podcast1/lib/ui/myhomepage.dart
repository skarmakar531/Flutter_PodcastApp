import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{

  final String? title;
  const MyHomePage({Key? k, this.title}) : super(key:k);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

//write methods here
    bool toggleview = true;
    void _toggle(){
      setState(() {
        toggleview = !toggleview;
      });
    }

    Drawer _getToggledDrawer()
    {
      if(toggleview){
        return Drawer(
        elevation: 5.0,
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.amberAccent),
              child: Center(
                child: Text("Podcast App1",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
                )
              )
            ),
            
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Option 1"),
              textColor: Colors.black87,
              iconColor: Colors.black54,
              onTap: (){ 
                Navigator.pop(context);                
                _toggle();
              }
            ),
            
            ListTile(
              leading: const Icon(Icons.no_accounts),
              title: const Text("Otion 2"),
              textColor: Colors.black87,
              iconColor: Colors.black54,
              onTap: () => Navigator.pop(context)
            )
            
          ]
        )
      );
      } else {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  accountName: Text("Suman", style: TextStyle(fontSize: 18)), 
                  accountEmail: Text("Suman.karmakar38@gmail.com"),
                  currentAccountPictureSize: Size.square(45),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: Text("A",style: TextStyle(fontSize: 30.0,color: Colors.blue),),
                  ),
                )
              ),

              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                _toggle();
                Navigator.pop(context);
              },
            ),
            ],
          ),
        );
      }

    }

    Widget _getToggledView(){
      if(toggleview) {
        return const Text("Toggle This");
      } else {
        return ElevatedButton(onPressed: () {
          _toggle();
        }, 
        child: const Text("Button"));
      }
    }    
    //end of methods

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title} test"),
        backgroundColor: Colors.amberAccent
      ),
      drawer: _getToggledDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.amberAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.widgets_rounded),label: "All Categories")
        ],
        onTap: (currentIndex) {
          _toggle();
        },
      ),
      body: Center(
        child: _getToggledView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        child: const Icon(Icons.add),
      ),
    );
  }

}