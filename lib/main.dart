import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
import 'constants/appwriteconstants.dart';
import 'constants/constant.dart';
import 'constants/tools.dart';
import 'src/notification.dart';
import 'src/scr.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // here the appwrite client is initialized
  //await Talsec.instance.start(secruity().config());
  final Client client = Client();
  client
    ..setEndpoint(AppwriteConstants.endpoint)
    ..setProject(AppwriteConstants.projectId)
    ..setSelfSigned(status: true);
  log("AppWrite initialised successfully");
  Hive.initFlutter();
  log('hive local databases is initialised successfully');
  // Workmanager().initialize(
  //   BackgroundTaskManegers().notify(),
  //   isInDebugMode: true,
  // );
  // log('workmanager is initialised successfully');
  NotficationManeger.init();
  log('notfication is initialised successfully');
  NotficationManeger.newNotification("helloworld", "ProjectSM is initialised successfully");

  /// here the all instances are initialized => client, database, storage, account
  final Teams teams = Teams(client);
  final Databases databases = Databases(client);
  final Storage storage = Storage(client);
  final Account account = Account(client);
  final Realtime realtime = Realtime(client);
  runApp(BetterFeedback(
    child: MyApp(
      teams: teams,
      storage: storage,
      account: account,
      databases: databases,
      realtime: realtime,
    ),
  ));
}

class MyApp extends StatefulWidget {
  final Teams teams;
  final Databases databases;
  final Account account;
  final Realtime realtime;
  final Storage storage;
  const MyApp(
      {super.key,
      required this.account,
      required this.databases,
      required this.realtime,
      required this.storage,
      required this.teams});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isdark = true;

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
          // here the bloc provider for the auth bloc
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
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
            // showSemanticsDebugger: true,
            // showPerformanceOverlay: true,
            themeAnimationCurve: Curves.easeInOut,
            darkTheme: AppThemeMode().dark,
            theme: AppThemeMode().light,
            themeMode: ThemeMode.dark,
            //debugShowCheckedModeBanner: false,
            // initialRoute: "/welcome",
            // here you can add more routes with means of the pages address for navigator
            routes: {
              '/welcome': (context) => const WelcomePage(),
              '/h': (context) => const NotificationView(),
              '/home': (context) => HomePage(
                    isdark: isdark,
                  ),
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
                  return HomePage(
                    isdark: isdark,
                  );
                }
                // ignore: unrelated_type_equality_checks
                return isfirstone() == true
                    ? const WelcomePage()
                    : const AuthPage();
              },
            )),
      ),
    );
  }

  Future<bool?> isfirstone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isfirst');
  }
}
