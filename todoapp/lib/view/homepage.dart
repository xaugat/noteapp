import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/common_widgets/subtitlewidget.dart';
import 'package:todoapp/common_widgets/titlewidgets.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/view/addnotespage.dart';
import 'package:todoapp/view/homepagedetails.dart';
import 'package:todoapp/viewmodel/notesprovider.dart';
class MyHomePage extends StatefulWidget {




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final List<Widget> _children =const [

   HomePageDetails(),
   AddNotesPage(),
    HomePageDetails()
  ];

  

   int _page = 0;



  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        
    
        child: Column(children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color:appcolor,
          child: const Text(''),
          ),
       const ListTile(title: Text('About app'),
        )

      ],),),
      appBar: AppBar(
     actions: [
       IconButton(onPressed: (){}, icon: const Icon(Icons.notifications, color: Colors.yellow,size: 32,))
     ],
       
        title: const Text('MyNotes'),
        centerTitle: true,
        elevation: 0,
      ),
      body: _children[_page],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: appcolor,
        items:const [
           Icon(Icons.home, size: 30),
      Icon(Icons.add, size: 30),
      Icon(Icons.person, size: 30),

      ],
       onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
          )
      
      
   
    );
  }
}
