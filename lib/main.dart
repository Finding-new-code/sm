import 'dart:developer';
import 'package:flutter/material.dart';
import 'Pages/AuthPage/View/authpage.dart';
import 'Pages/AuthPage/bloc/auth_bloc.dart';
import 'Pages/HomePage/bloc/home_bloc.dart';
import 'Pages/HomePage/VIew/homepage.dart';
import 'package:appwrite/models.dart' as models;
import 'Pages/HomePage/widgets/notfication_view.dart';
import 'Pages/Postcreation/bloc/post_bloc.dart';
import 'Pages/ProfilePage/bloc/profile_bloc.dart';
import 'Pages/SettingsPage/Views/settings_page.dart';
import 'Pages/WelcomePage/welcome.dart';
import 'components/termsandconditions.dart';
import 'constants/constant.dart';
import 'constants/tools.dart';
import 'src/src.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupaAndInitDependencies();


  /// here the all instances are initialized => client, database, storage, account

  final Databases databases = Databases(servicelocator());
  final Storage storage = Storage(servicelocator());
  final Account account = Account(servicelocator());
  final Realtime realtime = Realtime(servicelocator());

  NotficationManeger.init();
  log('notfication is initialised successfully');
  NotficationManeger.newNotification(
      "helloworld", "ProjectSM is initialised successfully");

  runApp(BetterFeedback(
    child: MyApp(
      connectivity: servicelocator(),
      storage: storage,
      account: account,
      databases: databases,
      realtime: realtime,
    ),
  ));
}

class MyApp extends StatefulWidget {
  final Connectivity connectivity;
  final Databases databases;
  final Account account;
  final Realtime realtime;
  final Storage storage;
  const MyApp({
    super.key,
    required this.connectivity,
    required this.account,
    required this.databases,
    required this.realtime,
    required this.storage,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  bool isdark = true;
 final Caches caches = Caches();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(account: widget.account),
        ),
        RepositoryProvider(
          create: (context) => DatabasesRepository(
              databases: widget.databases, realtime: widget.realtime),
        ),
        RepositoryProvider<Account>(
          create: (context) => Account(Client()),
        ),
        RepositoryProvider(
            create: (context) => StorageRepository(storage: widget.storage))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
            create: (context) =>
                InternetCubit(connectivity: widget.connectivity),
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
              lazy: false,
              create: (context) => ProfileBloc(
                    databasesrepository: context.read<DatabasesRepository>(),
                  )),
        ],
        child: MaterialApp(
            title: productName,

            /// here the theme is set
            //  showSemanticsDebugger: true,
            // showPerformanceOverlay: true,
            themeAnimationCurve: Curves.easeInOut,
            darkTheme: AppThemeMode().dark,
            theme: AppThemeMode().light,
            themeMode: ThemeMode.dark,
            //debugShowCheckedModeBanner: false,
            // initialRoute: caches.get('userId').toString().isEmpty? "/welcome" : '/auth',
            // here you can add more routes with means of the pages address for navigator
            routes: {
              '/welcome': (context) => const WelcomePage(),
              '/h': (context) => const NotificationView(),
              '/home': (context) => const HomePage(),
              '/auth': (context) => const AuthPage(),
              'settings': (context) => const SettingsPage(),
              't&c': (context) => const TermsAndConditions(),
            },
            // here the home page is set
            home: StreamBuilder(
              stream: widget.account.get().asStream(),
              builder:
                  (BuildContext context, AsyncSnapshot<models.User> snapshot) {
                if (snapshot.hasData) {
                  return const HomePage();
                }
                return const AuthPage();
              },
            )),
      ),
    );
  }
}
