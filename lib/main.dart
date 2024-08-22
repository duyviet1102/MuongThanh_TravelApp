import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htx_mh/viewmodels/provider/cart_provider.dart';
import 'package:htx_mh/views/widgets/navigations_menu.dart';
import 'package:htx_mh/views/pages/page_login.dart';
import 'package:htx_mh/views/pages/page_signup.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: const NavigationMenu(),
          home: PageLogin(),
          // PageLogin(),
        );
      })
    );
  }
}
