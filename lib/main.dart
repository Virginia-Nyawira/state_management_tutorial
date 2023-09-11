import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:states/Bloc/Presentation/Routing/router.dart';
import 'package:states/Bloc/Presentation/bloc_home.dart';
import 'package:states/Bloc/Presentation/internet_cubit.dart';
import 'package:states/Bloc/Presentation/second_screen.dart';
import 'package:states/Bloc/Service/counter_cubit.dart';
import 'package:states/GetX/Presentation/getx_first_home.dart';
import 'package:states/Provider/API_Call_using_Provider/Services/provider_service.dart';
import 'package:states/Provider/API_Call_using_Provider/home_view.dart';
import 'package:states/Provider/Model/items_model.dart';
import 'package:states/Provider/Views/home_view.dart';
//import 'package:states/Provider/provider_home.dart';

// void main() {
//   runApp(
//       const MyApp()
//   );
// }


/// Provider with no API--Movies
// void main() {
//   runApp(
//     //Entry point of provider
//       ChangeNotifierProvider<MovieProvider>(
//           create: (context) => MovieProvider(),//creating change notifier object
//           child: const MyApp(),
//       )
//   );
// }

///Provider with API
// void main() {
//   runApp(
//     //Entry point of provider
//       ChangeNotifierProvider(
//           create: (context) => ToDoProvider(),//creating change notifier object
//           child: const MyApp(),
//       )
//   );
// }

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

// class MyApp extends StatefulWidget {
//   // final Connectivity connectivity;
//   // final AppRouter appRouter;
//
//   const MyApp({super.key,
//   });
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   //final CounterCubit _counterCubit= CounterCubit();
//   final AppRouter _appRouter=AppRouter();
//   late Connectivity connectivity;
//   //late AppRouter appRouter;
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     ///Bloc Provider entry point
//     return MultiBlocProvider(providers:
//     [
//       BlocProvider<InternetCubit>(create:(context)=>
//       InternetCubit(connectivity: connectivity),
//       ),
//       BlocProvider<CounterCubit>(
//           create: (context)=>CounterCubit(internetCubit: context.read<InternetCubit>())),
//       //Try .watch
//     ],
//
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'State management',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             useMaterial3: true,
//           ),
          //  home: const ProviderHomeView(),
          // home:  const BlockHomeView(
          //   color: Colors.blueAccent,
          // ),
          ///Named Routes
          // routes: {
          //   '/': (context)=> BlocProvider.value(
          //     value: _counterCubit ,
          //     child: const BlockHomeView(
          //       color: Colors.blueAccent,
          //     ),
          //   ),
          //   '/secondScreen' : (context)=> BlocProvider.value(
          //     value: _counterCubit ,
          //     child: const SecondScreen(
          //       color: Colors.blueAccent,
          //     ),
          //   ),
          // },
          ///Generated Routes
          // onGenerateRoute: _appRouter.generateThisRoute,
//         ),
//     );
//
//   }
//   @override
//   void dispose() {
//     //_counterCubit.close();
//     _appRouter.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }
// }


///Provider Movie generator
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//           title: 'State management',
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             useMaterial3: true,
//           ),
//        home: const ProviderHomeView_Movie(),
//     );
//   }
// }

///GetX

void main() {
  runApp(
      const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State management-GetX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetxFirstHome(),
    );
  }
}
