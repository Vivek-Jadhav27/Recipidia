import 'package:flutter/material.dart';
import 'package:recipidia/Models/vermenu.dart';
import 'package:recipidia/Screens/recipe.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<VerMenu> vermenuList = [];
  List<VerMenu> found = [];
    int? vcount;

_SearchScreenState(){
    vermenuList = VerMenu.vmenuList();
    double half2 = vermenuList.length / 2;
    vcount = half2.toInt();
    found = vermenuList;
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 50,
          ),
          Icon(
            Icons.notifications_none_outlined,
            size: 30,
            color: Colors.black87,
          )
        ],
      ),
    ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(right: 15, left: 15),
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              searchBox(),
              Container(
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: found.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Recipe(
                              found[index].name.toString(),
                              found[index].id.toString(),
                              found[index].ingredients.toString(),
                              found[index].decription.toString()),
                        )),
                        child: Container(
                          height: 100,
                          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 225, 238, 254),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                margin: EdgeInsets.only(left: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                      found[index].id.toString()),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 20, left: 10),
                                            child: Text(
                                              found[index].name.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  fontFamily: "Hellix"),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.only(top: 5, left: 10),
                                            child: Row(children: [
                                              Icon(
                                                Icons.star,
                                                size: 14,
                                                color: Colors.red,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 14,
                                                color: Colors.red,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 14,
                                                color: Colors.red,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 14,
                                                color: Colors.red,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 14,
                                                color: Colors.red,
                                              ),
                                            ]),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 10),
                                            padding: EdgeInsets.only(right: 20),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.alarm,
                                                  size: 12,
                                                  color: Colors.black87,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '10 Mins',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black87,
                                                      fontFamily: "Hellix"),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]
            ),
      ),
    );
  }

  void _runFilter(String value) {
    List<VerMenu> result = [];
     
    if (value.isEmpty) {
      result = vermenuList;
    } else {
      result = vermenuList
          .where(
              (item) => item.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      found = result;
    });
  }

  Widget searchBox() {
    return GestureDetector(
      
      child: Container(
        
        margin: EdgeInsets.only(top: 20, right: 10, bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 225, 238, 254),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
         onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black12,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            hintText: 'Search Recipe',
            hintStyle: TextStyle(fontFamily: "Hellix"),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  AppBar _buildApp() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.notifications_none_outlined,
            size: 30,
            color: Colors.black87,
          )
        ],
      ),
    );
  }
}
