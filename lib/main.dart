import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:native_features/Screens/Places_LIst.dart';
import 'package:native_features/Screens/video_show.dart';
import 'package:provider/provider.dart';
import 'Provider/PLaces_Provider.dart';
import 'Screens/Add_places.dart';
import 'package:native_features/Screens/Authentication_Screen.dart';
import 'Provider/Auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Places_Provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Places Wishlist',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        initialRoute: 'Open',
        routes: {
          'Open': (context) => open(),
          'Otp': (context) => otpsc(),
          add_Product_screen.routee: (ctx) => add_Product_screen(),
          Places_List.routee: (ctx) => Places_List(),
          VideoPage.routee: (ctx) => VideoPage(),
        },
      ),
    );
  }
}
