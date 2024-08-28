
import 'package:flutter/material.dart';

class Home_page_Template extends StatefulWidget
{
  @override
  State<Home_page_Template> createState() => _Home_page_TemplateState();
}

class _Home_page_TemplateState extends State<Home_page_Template> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        color: Colors.redAccent,
        child: Column(
          children: [
            Container(
              color: Colors.redAccent,
              padding: EdgeInsets.all(20),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white,width: 2)
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.brown,
                  ),
                ),
                title: TitleText('Mountainview Court'),
                subtitle: TitleText('Fresh Meadows,NY 11365'),
                trailing: IconButton(
                  onPressed: () {
      
                  },
                  icon: Icon(Icons.search,color: Colors.white,),
                ),
              ),
            ),//Top Bar
            Container(
              height: ScreenHeight,
              width: screenwidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white
              ),
              child: Center(child: Text('hi')),
            ),
          ],
        ),
      ),
    );
  }


  Widget TitleText(String title) =>
      Text(title, style: TextStyle(fontSize: 15, color: Colors.white),);
}
    
