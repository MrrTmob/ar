import 'package:ar/layout/slider_layout.dart';
import 'package:ar/utility/color.dart';
import 'package:ar/utility/test_data.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'controller/scroll_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

List img = [
  "https://www.earlygame.com/uploads/images/LoL-Seraphine-music.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_Buy37iuF5lb8E5vtg1C-CKUyd4-DLy_lRg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSssvbhinDJpdfkDUSzRsyVy48OOO76nCqIjQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5-PffN5YiTzTcd2A-_aR730WpRyuqRkHGzQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIyvTyuDZdT3Qnu2zWwDllGuMwDs9r2suqiA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCeDFi4bDJcFuNWbQIZTvkSuRFmUkbPD2STA&usqp=CAU",
  "https://www.earlygame.com/uploads/images/LoL-Seraphine-music.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_Buy37iuF5lb8E5vtg1C-CKUyd4-DLy_lRg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSssvbhinDJpdfkDUSzRsyVy48OOO76nCqIjQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5-PffN5YiTzTcd2A-_aR730WpRyuqRkHGzQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIyvTyuDZdT3Qnu2zWwDllGuMwDs9r2suqiA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCeDFi4bDJcFuNWbQIZTvkSuRFmUkbPD2STA&usqp=CAU",
];
List titles = [
  "Seraphine",
  "Seraphine",
  "Seraphine",
  "Seraphine",
  "Seraphine",
  "Seraphine",
  "Seraphine",
  "Seraphine",
  "Seraphine",
  "Seraphine",
  "Seraphine",
  "Seraphine",
];

class _HomeState extends State<Home> {
  final ScrollController _controller = ScrollController();
  final double _bottomNavBarHeight = 125;
  late final ScrollListener _model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = ScrollListener.initialise(_controller);
  }

  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: AnimatedBuilder(
        animation: _model,
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      fGradient,
                      sGradient,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                  ),
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, top: 16, bottom: 8, right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi Tmob,",
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text("Fun with AR",
                                        style: TextStyle(
                                            color: secondaryColor,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: thirdColor,
                                    border:
                                        Border.all(color: sGradient, width: 1)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://notagamer.net/wp-content/uploads/2020/12/photo-1-16012932618821498236597.jpg")),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 290,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: testdata.length,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24, top: 16, right: 8),
                                      child: SlideLayout(
                                        img: testdata[index]["image"],
                                        title: testdata[index]["title"],
                                        subtitle: testdata[index]["subtitle"],
                                      ),
                                    );
                                  } else if (index == img.length - 1) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 16, right: 24),
                                      child: SlideLayout(
                                        img: testdata[index]["image"],
                                        title: testdata[index]["title"],
                                        subtitle: testdata[index]["subtitle"],
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 16, right: 8),
                                      child: SlideLayout(
                                        img: testdata[index]["image"],
                                        title: testdata[index]["title"],
                                        subtitle: testdata[index]["subtitle"],
                                      ),
                                    );
                                  }
                                })),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 32),
                          child: StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            itemCount: img.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Container(
                                    // color: Colors.blue,
                                    child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image(
                                    height: 300,
                                    width: 200,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(img[index]),
                                  ),
                                ),
                              ),
                            )),
                            staggeredTileBuilder: (int index) =>
                                StaggeredTile.count(2, index.isEven ? 3 : 2),
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: _model.bottom,
                  child: _bottomNavBar)
            ],
          );
        },
      ),
    );
  }

  Widget get _bottomNavBar {
    return SizedBox(
      height: _bottomNavBarHeight,
      child: DotNavigationBar(
        backgroundColor: Colors.white,
        margin: EdgeInsets.only(left: 8, right: 8),
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        dotIndicatorColor: primaryColor,
        unselectedItemColor: Colors.grey[400],
        // enableFloatingNavBar: false,
        onTap: _handleIndexChanged,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: primaryColor,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Icon(Icons.favorite),
            selectedColor: primaryColor,
          ),

          /// Search
          DotNavigationBarItem(
            icon: Icon(Icons.search),
            selectedColor: primaryColor,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: primaryColor,
          ),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
