import 'package:flutter/material.dart';
import 'package:native_features/Screens/Add_places.dart';
import 'package:provider/provider.dart';
import 'package:native_features/Provider/PLaces_Provider.dart';
import 'video_show.dart';

class Places_List extends StatelessWidget {
  static final routee = '\Vid_list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Your Videos"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(add_Product_screen.routee);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Places_Provider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Places_Provider>(
                child: Center(
                  child: const Text("Add a memory"),
                ),
                builder: (ctx, places_provider, ch) => ListView.builder(
                  itemCount: places_provider.items.length,
                  itemBuilder: (ctx, i) => ListTile(
                    tileColor: Color(0xFFE7D7F1),
                    title: Text(
                      places_provider.items[i].Name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              places_provider.items[i].description,
                              style: TextStyle(color: Colors.black),
                            ),
                            // SizedBox(
                            //   width: 20.0,
                            // ),
                            Text(
                              places_provider.items[i].cat,
                              style: TextStyle(color: Colors.black),
                            ),
                            // Text(
                            //   "Location:  ",
                            //   style: TextStyle(color: Colors.black),
                            // ),
                            // Text(
                            //   places_provider.items[i].location,
                            //   style: TextStyle(color: Colors.black, fontSize: 10),
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Location:  ",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              places_provider.items[i].location,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // trailing: Row(
                    //   children: [
                    //     Text(
                    //       "Location:  ",
                    //       style: TextStyle(color: Colors.black),
                    //     ),
                    //     Text(
                    //       places_provider.items[i].location,
                    //       style: TextStyle(color: Colors.black, fontSize: 10),
                    //     ),
                    //   ],
                    // ),

                    //   Text(
                    //   places_provider.items[i].cat,
                    //   style: TextStyle(color: Colors.black),
                    // ),
                    onTap: () {
                      Navigator.of(context).pushNamed(VideoPage.routee);
                      VideoPage.filePath = places_provider.items[i].image;
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
