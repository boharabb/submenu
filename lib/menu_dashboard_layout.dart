import 'package:flutter/material.dart';
import 'language.dart'
final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}
class _MenuDashboardPageState extends State<MenuDashboardPage> with SingleTickerProviderStateMixin {
bool isCollapsed = true;
double screenWidth, screenHeight;
final Duration duration = const Duration(milliseconds: 300);
AnimationController _controller;
Animation <double> _scaleAnimation;
Animation <double> _menuScaleAnimation;
Animation<Offset> _slideAnimation;
@override
  void initState() {   
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end:0.9).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end:1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-2, 0), end: Offset(0, 0)).animate(_controller);
  }
  @override
  void dispose() {   
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor:backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
       ),
    );
  }

  Widget menu(context){
    return SlideTransition(
      position: _slideAnimation,
          child: ScaleTransition(
            scale: _menuScaleAnimation,
                      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
            alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                leading: Icon(Icons.language, color:Colors.blueGrey),
                title: Text(
                  "language", style: TextStyle(color: Colors.blue, fontSize: 22.0)),
                  onTap: (){
                    Navigator
                  },
              ),
              
                SizedBox(height: 13.0),
                ListTile(
                  leading: Icon(Icons.book, color:Colors.blueGrey),
                  title: Text("Korean Grammar", style: TextStyle(color: Colors.blue, fontSize: 22.0)),
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(
                      builder: ((context) => language()),
                    ));
                  } ,
                  ),
                SizedBox(height: 13.0),
                ListTile(
                  leading: Icon(Icons.person, color:Colors.blueGrey),
                  title: Text("EPS-TOPIK", style: TextStyle(color: Colors.blue, fontSize: 22.0)),
                  onTap:(){} ),
                SizedBox(height: 13.0),
                ListTile(
                  leading: Icon(Icons.search, color:Colors.blueGrey),
                  title: Text("Practice", style: TextStyle(color: Colors.blue, fontSize: 22.0)),
                  onTap:(){} ),
                SizedBox(height: 13.0),
                ListTile(
                  leading: Icon(Icons.laptop, color:Colors.blueGrey),
                  title: Text("About us", style: TextStyle(color: Colors.blue, fontSize: 22.0)),
                  onTap:(){} ),
            ],
            ),
        ),
      ),
          ),
    );
  }
 

Widget dashboard(context){
  return AnimatedPositioned(
    duration: duration,
    top: 0,
    bottom:0 ,
    left: isCollapsed?0: 0.6 *screenWidth,
    right:isCollapsed?0: -0.4 *screenWidth,
    child: ScaleTransition(
        scale: _scaleAnimation,
          child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          elevation: 8.0,
          color: Colors.teal,
         
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
                      child: Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      InkWell(child: Icon(Icons.menu, color: Colors.black87, size: 30.0,), 
                      onTap:(){
                        setState(() {
                          if(isCollapsed)
                          _controller.forward();
                          else
                          _controller.reverse();
                         isCollapsed = !isCollapsed ;
                        });
                      } ,),
                      Text("EPS-TOPIK", style:TextStyle(fontSize: 20.0, color:Colors.lime)),
                      Icon(Icons.search, color: Colors.grey,),
                    ],
                  ),
                  
                  SizedBox(height: 20.0,),
                  Container(
                    height: 200.0,
                      child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9.0),
                          color: Colors.blueGrey,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9.0),
                          color: Colors.indigo,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9.0),
                          color: Colors.purple,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:18.0,),
                  Text("Best Institute in Kathmandu", style: TextStyle(color:Colors.black54, fontSize: 25.0),),
                  SizedBox(height:1.0,),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                    return ListTile(
                      title: Text("Sejong institute"),
                      subtitle: Text("Gongabu"),
                      
                    );
                  }, separatorBuilder: (context, index){
                    return Divider(height: 16);
                  }, itemCount: 1,),
                  SizedBox(height:1.0,), 
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                    return ListTile(
                      title: Text("Km"),
                      subtitle: Text("Gongabu"),
                      
                    );
                  }, separatorBuilder: (context, index){
                    return Divider(height: 16);
                  }, itemCount: 1,),
                  SizedBox(height:1.0,),
                   ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                    return ListTile(
                      title: Text("vally"),
                      subtitle: Text("Kritipur"),
                    );
                  }, separatorBuilder: (context, index){
                    return Divider(height: 16);
                  }, itemCount: 1,),

                ],
              ),
            ),
          ),
    
    ),
      ),
  );
}
}