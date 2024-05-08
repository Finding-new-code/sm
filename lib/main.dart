import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/src/Theme/cubit/theme_cubit.dart';
import 'Pages/AuthPage/bloc/auth_bloc.dart';
import 'Pages/HomePage/bloc/home_bloc.dart';
import 'Pages/Postcreation/bloc/post_bloc.dart';
import 'Pages/ProfilePage/bloc/profile_bloc.dart';
import 'constants/constant.dart';
import 'constants/tools.dart';
import 'src/src.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupAndInitDependencies();

  NotficationManeger.init();
  log('notfication is initialised successfully');
  NotficationManeger.newNotification(
      "helloworld", "ProjectSM is initialised successfully");

  runApp(const BetterFeedback(
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isdark = true;
  final Caches caches = Caches();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              AuthRepository(account: servicelocator.get<Account>()),
        ),
        RepositoryProvider(
          create: (context) => DatabasesRepository(
              databases: servicelocator.get<Databases>(),
              realtime: servicelocator.get<Realtime>()),
        ),
        RepositoryProvider<Account>(
          create: (context) => Account(Client()),
        ),
        RepositoryProvider(
            create: (context) =>
                StorageRepository(storage: servicelocator.get<Storage>()))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
          BlocProvider<InternetCubit>(
            create: (context) =>
                InternetCubit(connectivity: servicelocator.get<Connectivity>()),
          ),
          // here the bloc provider for the auth bloc
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
                internetCubit: servicelocator(),
                authRepository: context.read<AuthRepository>(),
                databasesrepsitory: context.read<DatabasesRepository>()),
          ),

          /// here the bloc provider for the home bloc
          BlocProvider<HomeBloc>(
              lazy: false,
              create: (context) => HomeBloc(
                  storagerepository: context.read<StorageRepository>(),
                  databasesrepository: context.read<DatabasesRepository>())),

          /// here the bloc provider for the post bloc
          BlocProvider<PostBloc>(
              create: (context) => PostBloc(
                  storageRespository: context.read<StorageRepository>(),
                  databasesRepository: context.read<DatabasesRepository>())),

          /// here the bloc provider for the profile bloc
          BlocProvider<ProfileBloc>(
              create: (context) => ProfileBloc(
                    databasesrepository: context.read<DatabasesRepository>(),
                  )),
        ],
        child: MaterialApp.router(
          title: productName,

          /// here the theme is set
          //  showSemanticsDebugger: true,
          // showPerformanceOverlay: true,
          themeAnimationCurve: Curves.easeInOut,
          darkTheme: AppThemeMode().dark,
          theme: AppThemeMode().light,
          themeMode: ThemeMode.dark,
          //debugShowCheckedModeBanner: false,
          // here you can add more routes with means of the pages address for navigator
          // here the home page is set
          routerConfig: appRoutes,
          
        ),
      ),
    );
  }

}
