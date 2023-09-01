import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/Provider/Model/items_model.dart';
import 'package:states/Provider/Views/home_view.dart';
//import 'package:states/Provider/provider_home.dart';

void main() {
  runApp(
    //Entry point of provider
      ChangeNotifierProvider<MovieProvider>(
          create: (context) => MovieProvider(),//creating change notifier object
          child: const MyApp(),
      )
  );
}
///When you have many classes too manage
// void main() {
//   runApp(
//       MultiProvider(
//           providers: [
//             ChangeNotifierProvider(create: (context)=>CartModel()),
//             Provider(create: (context)=>CartModel()),
//
//           ],
//           child: const MyApp())
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'State management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProviderHomeView(),
    );
  }
}

