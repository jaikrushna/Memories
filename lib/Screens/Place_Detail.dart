import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:native_features/Provider/PLaces_Provider.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Titt = ModalRoute.of(context)!.settings.arguments;
    final selectedPLace = Provider.of<Places_Provider>(context, listen: false)
        .findByTitle(Titt.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPLace.Name),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPLace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            selectedPLace.description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.blueGrey),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            selectedPLace.cat,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.blueGrey),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
