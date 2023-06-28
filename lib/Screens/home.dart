import 'package:flutter/material.dart';
import 'package:recipidia/Models/hormenu.dart';
import 'package:recipidia/Models/vermenu.dart';
import 'package:recipidia/Screens/recipe.dart';
import 'package:recipidia/Screens/searchScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Hormenu> hormenuList = [];
  List<VerMenu> vermenuList = [];
  List<VerMenu> found = [];
  int? hcount;
  int? vcount;
  bool isExpand = true;
  bool isVerExpand = true;

  _HomeState() {
    hormenuList = Hormenu.hmenuList();
    double half1 = hormenuList.length / 2;
    hcount = (hormenuList.length <= 4) ? 3 :half1.toInt();

    vermenuList = VerMenu.vmenuList();
    double half2 = vermenuList.length / 2;
    vcount = half2.toInt();

    found = vermenuList;
  }

  void toggleText() {
    setState(() {
      isExpand = !isExpand;
    });
  }

  void toggleVerText() {
    setState(() {
      isVerExpand = !isVerExpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApp(),
      backgroundColor: (Colors.white),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Something will be changed',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Hellix"),
              ),
              searchBox(),
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' Fresh Recipe',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Hellix"),
                    ),
                    GestureDetector(
                      onTap: () {
                        toggleText();
                      },
                      child: Text(
                        isExpand ? 'See More ' : 'See Less',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Hellix"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: isExpand ? hcount : hormenuList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Recipe(
                            hormenuList[index].name.toString(),
                            hormenuList[index].id.toString(),
                            hormenuList[index].ingredients.toString(),
                            hormenuList[index].decription.toString()),
                      )),
                      child: Container(
                        height: 200,
                        width: 160,
                        padding: EdgeInsets.only(
                          top: 10,
                          left: 20,
                        ),
                        margin: EdgeInsets.only(top: 20, left: 20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 225, 238, 254),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: 100,
                                    width: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          hormenuList[index].id.toString()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              hormenuList[index].name.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Hellix"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
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
                              margin: EdgeInsets.only(top: 10),
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
                                    hormenuList[index].time.toString(),
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
                    );
                  }),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommanded',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Hellix"),
                    ),
                    GestureDetector(
                      onTap: () {
                        toggleVerText();
                      },
                      child: Text(
                        isVerExpand ? 'See More ' : 'See Less',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Hellix"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // height: 280,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  // scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: isVerExpand ? vcount : vermenuList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Recipe(
                            vermenuList[index].name.toString(),
                            vermenuList[index].id.toString(),
                            vermenuList[index].ingredients.toString(),
                            vermenuList[index].decription.toString()),
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
                                    vermenuList[index].id.toString()),
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
                                            vermenuList[index].name.toString(),
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
            ],
          ),
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
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => SearchScreen())
        )
      ),
      child: Container(
        
        margin: EdgeInsets.only(top: 20, right: 10, bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 225, 238, 254),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
         onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => SearchScreen())
        )
        ), 
        
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
