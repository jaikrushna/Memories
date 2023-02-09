import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:native_features/Models/Place.dart';
import 'dart:io';
import 'package:native_features/helpers/db_helper.dart';

class Places_Provider with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  Place findByTitle(String id) {
    return _items.firstWhere((place) => place.Name == id);
  }

  void getplace(
    String pickedTitle,
    File PickedImage,
    String PickedDescription,
    String PickedCategory,
    String Pickedloc,
  ) {
    final new_place = Place(
      Name: pickedTitle,
      description: PickedDescription,
      image: PickedImage,
      cat: PickedCategory,
      location: Pickedloc,
    );
    _items.add(new_place);
    notifyListeners();
    DBHelper.insert('user_places', {
      'description': new_place.description,
      'category': new_place.cat,
      'location': new_place.location,
      'title': new_place.Name,
      'image': new_place.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final datalist = await DBHelper.getData('user_places');
    _items = datalist
        .map((item) => Place(
              location: item['location'],
              cat: item['category'],
              description: item['description'],
              Name: item['title'],
              image: File(item['image']),
            ))
        .toList();
    notifyListeners();
  }
}
