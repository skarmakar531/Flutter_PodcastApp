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
      }
      else{
        return Drawer(
        elevation: 5.0,
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.amberAccent),
              child: Center(
                child: Text("Podcast App2",
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
                _toggle();
                Navigator.pop(context);                
              }
            ),
            
            ListTile(
              leading: const Icon(Icons.no_accounts),
              title: const Text("Otion 2"),
              textColor: Colors.black87,
              iconColor: Colors.black54,
              onTap: () => Navigator.pop(context)
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Option 1"),
              textColor: Colors.black87,
              iconColor: Colors.black54,
              onTap: (){ 
                _toggle();
                Navigator.pop(context);                
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
        title: Text(widget.title.toString()),
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