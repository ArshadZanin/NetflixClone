import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_latest/pages/row_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  int list = 0;

  ScrollController? _scrollController;
  double _scrollOffset = 0.5;


  @override
  void initState(){
    _scrollController = ScrollController()..addListener(() {
      setState(() {
        _scrollOffset = _scrollController!.offset;
      });
    });
    super.initState();
  }

  @override
  void dispose(){
    _scrollController!.dispose();
    super.dispose();
  }
  Key? _key;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            key: _key,
            child: Container(
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 3 / 5,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Image.network(
                              'https://m.media-amazon.com/images/M/MV5BZmFkMzc2NTctN2U1Ni00MzE5LWJmMzMtYWQ4NjQyY2MzYmM1XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_FMjpg_UX1000_.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                    ),
                                    BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: -20.0,
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(onPressed: (){
                                      setState(() {
                                        list == 0 ? list = 1 : list = 0;
                                      });
                                    }, icon: Icon(list == 0 ? Icons.add : Icons.done, color: Colors.white,size: 35,)),

                                    FlatButton.icon(onPressed: (){}, icon: const Icon(Icons.play_arrow), label: const Text('Play'),color: Colors.white,),

                                    IconButton(onPressed: (){},
                                        icon: const Icon(Icons.info_outline, color: Colors.white,size: 35,)),

                                  ],
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Trending Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    const RowMovie(),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Top 10 in india Today',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                    const RowMovie(),
                  ],
                )
            ),
          ),
          Container(
            height: 200,
            child: NestedScrollView(
              key: _key,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    snap: true,
                    pinned: true,
                    floating: true,
                    expandedHeight: 130,
                    backgroundColor: Colors.black.withOpacity(_scrollOffset),
                    leading: Image.asset('assets/images/icon.png'),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.search_sharp),
                        tooltip: 'Comment Icon',
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.purple,
                          ),
                          height: 10,
                          width: 20,
                        ),
                      ),
                    ],
                    bottom: PreferredSize(
                      preferredSize: Size(screenSize.width, 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(onPressed: (){}, child: const Text('TV Shows',style: TextStyle(color: Colors.white,fontSize: 18),)),
                          TextButton(onPressed: (){}, child: const Text('Movies',style: TextStyle(color: Colors.white,fontSize: 18),)),
                          TextButton(onPressed: (){}, child: const Text('Categories',style: TextStyle(color: Colors.white,fontSize: 18),)),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                height: 0.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
