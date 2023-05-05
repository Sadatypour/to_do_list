import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_list/bindings/bindings.dart';
import 'package:to_do_list/routes/routs.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeftWithFade,
      initialBinding: mybindings(),
      getPages: Routes.pages,
      initialRoute: "/homescreen",
    );
  }
}
