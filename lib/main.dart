import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reserveapp/calendar_page.dart';
//import 'package:google_fonts/google_fonts.dart';

const d_green = Color(0xFF54D3C2);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Hotels', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchSection(),
              HotelSection(),
            ],
          ),
        ));
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: null,
        icon: Icon(Icons.arrow_back),
        color: Colors.grey[800],
        iconSize: 20,
      ),
      title: Text(
        'Explore',
        style: GoogleFonts.nunito(
            color: Colors.black, fontWeight: FontWeight.w800),
      ),
      actions: [
        IconButton(
          onPressed: null,
          icon: Icon(Icons.favorite_outline_rounded),
          color: Colors.grey[800],
          iconSize: 20,
        ),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.place),
          color: Colors.grey[800],
          iconSize: 20,
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        color: Colors.grey[200],
        padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'London',
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none),
                    ),
                    padding: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ]),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ], borderRadius: BorderRadius.circular(30)),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CalendarPage();
                              },
                            ),
                          );
                        },
                        child: Icon(
                          Icons.search,
                          size: 26,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: d_green,
                          padding: EdgeInsets.all(10),
                        )),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 25, 0, 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose data",
                          style: GoogleFonts.nunito(
                              color: Colors.grey, fontSize: 15),
                        ),
                        Text(
                          "12 Dec - 22 Dec",
                          style: GoogleFonts.nunito(
                              color: Colors.black, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose data",
                            style: GoogleFonts.nunito(
                                color: Colors.grey, fontSize: 15),
                          ),
                          Text(
                            "30 Avril - 5 Mai",
                            style: GoogleFonts.nunito(
                                color: Colors.black, fontSize: 20),
                          )
                        ]),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class HotelSection extends StatelessWidget {
  final List hotelList = [
    {
      'title': "Grand royal Hotel",
      'Place': 'Webley, London',
      'distance': 2,
      'review': 36,
      'picture': 'images/pexel3.jpg',
      'price': '180'
    },
    {
      'title': "Hotel 2 fevrier",
      'Place': 'Webley, London',
      'distance': 18,
      'review': 36,
      'picture': 'images/pexel4.jpg',
      'price': '180'
    },
    {
      'title': "EDA OBA Hotel ",
      'Place': 'Webley, London',
      'distance': 5,
      'review': 36,
      'picture': 'images/pexel3.jpg',
      'price': '180'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("widget text",
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                    )),
                Row(
                  children: [
                    Text("Filter",
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                        )),
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.filter_list_outlined,
                          color: d_green,
                          size: 20,
                        ))
                  ],
                )
              ],
            ),
            height: 50,
          ),
          Column(
            children: hotelList.map((hotel) {
              return HotelCard(hotel);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map hotelData;
  HotelCard(this.hotelData);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      margin: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 4,
                offset: Offset(0, 3))
          ]),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18)),
                image: DecorationImage(
                    image: AssetImage(hotelData['picture']),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                Positioned(
                    top: 5,
                    right: -15,
                    child: MaterialButton(
                      color: Colors.white,
                      shape: CircleBorder(),
                      onPressed: null,
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        color: d_green,
                        size: 20,
                      ),
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(hotelData['title']),
                Text("\$" + hotelData['price']),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(hotelData['Place']),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: d_green,
                      size: 18,
                    ),
                    Text(hotelData['distance'].toString() + 'km to city')
                  ],
                ),
                Text('Per night'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              children: [
                Row(children: [
                  Icon(
                    Icons.star,
                    color: d_green,
                    size: 14,
                  ),
                  Icon(
                    Icons.star,
                    color: d_green,
                    size: 14,
                  ),
                  Icon(
                    Icons.star,
                    color: d_green,
                    size: 14,
                  ),
                  Icon(
                    Icons.star,
                    color: d_green,
                    size: 14,
                  ),
                  Icon(
                    Icons.star_border,
                    color: d_green,
                    size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  )
                ]),
                Text(
                  hotelData['review'].toString() + ' reviews',
                  style: GoogleFonts.nunito(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
