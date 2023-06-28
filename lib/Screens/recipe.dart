import 'package:flutter/material.dart';

class Recipe extends StatefulWidget {
  final String name , image , ingredient , discription;
  Recipe(this.name , this.image , this.ingredient , this.discription);

  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      elevation: 0,
        title: Row(
      
          children: [
            
          ],
        ),
        
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
          padding: EdgeInsets.only(left: 20,top: 5),
          decoration: BoxDecoration(
            
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 30,color: Colors.black,fontFamily: "Hellix"),
                  ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Container(
                    width: MediaQuery.of(context).size.width/2,  
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(bottom: 10,top: 20),
                        child: Text(
                          "Ingredients :",
                        style: TextStyle(color: Colors.black,fontFamily: "Hellix", fontSize: 18 ,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(
                        height: 200,
                        child: 
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            widget.ingredient,
                            style: TextStyle(fontSize: 15 ,color: Colors.grey ,fontFamily: "Hellix"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                    Align(
                      
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 150,
                      width: 150,
                      margin: EdgeInsets.only(top: 25),
                      child: ClipRRect(
                      child: Image.asset(widget.image),
                        ),
                    ),
                  ),]
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10 , top: 20),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Decription',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Hellix",
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        widget.discription,
                      style: TextStyle(color: Colors.grey,
                        fontSize: 15,
                        fontFamily: "Hellix"),
                      ),
                    ),
                  ],
                ),
      
              ),
             ],
          ),
        ),
      ),
    );
  }
}
