import 'dart:io';

class Place {
  final String Name;
  final String description;
  final String location;
  final File image;
  final String cat;

  Place({
    required this.Name,
    required this.cat,
    required this.description,
    required this.location,
    required this.image,
  });
}
