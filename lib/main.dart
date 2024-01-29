import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/AuthPage/View/authpage.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/ProfilePage/View/profilepage.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/SettingsPage/Views/settings_page.dart';
import 'package:myapp658d7b3746ed317621f8/components/termsandconditions.dart';
import 'package:myapp658d7b3746ed317621f8/constants/constant.dart';
import 'Pages/AuthPage/bloc/auth_bloc.dart';
import 'Pages/HomePage/bloc/home_bloc.dart';
import 'Pages/HomePage/VIew/homepage.dart';
import 'package:appwrite/models.dart' as models;
import 'Pages/Postcreation/bloc/post_bloc.dart';
import 'Pages/WelcomePage/welcome.dart';
import 'constants/appwriteconstants.dart';
import 'constants/tools.dart';
import 'src/repository/auth.dart';
import 'src/repository/databases.dart';
import 'src/themedata.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // here the appwrite client is initialized
  final Client client = Client();
  client
    ..setEndpoint(AppwriteConstants.endpoint)
    ..setProject(AppwriteConstants.projectId)
    ..setSelfSigned(status: true);
  debugPrint("AppWrite initialise");

  /// here the all instances are initialized => client, database, storage, account
  final Databases databases = Databases(client);
  final Storage storage = Storage(client);
  final Account account = Account(client);
  final Realtime realtime = Realtime(client);
  runApp(MyApp(
    account: account,
    databases: databases,
    realtime: realtime,
  ));
}

class MyApp extends StatefulWidget {
  final Databases databases;
  final Account account;
  final Realtime realtime;
  const MyApp({
    super.key,
    required this.account,
    required this.databases,
    required this.realtime,
  });

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
              create: (context) => HomeBloc(
                  databasesrepository: context.read<DatabasesRepository>())),
          /// here the bloc provider for the post bloc
          BlocProvider<PostBloc>(
              create: (context) => PostBloc(
                  databasesRepository: context.read<DatabasesRepository>()))
        ],
        child: MaterialApp(
          title: productName,
          // here the theme is set
          // showSemanticsDebugger: true,
          // showPerformanceOverlay: true,
          themeAnimationCurve: Curves.easeInOut,
          darkTheme: AppThemeMode().dark,
          theme: AppThemeMode().light,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          // initialRoute: "/welcome",
          // here you can add more routes with means of the pages address for navigator
          routes: {'/welcome': (context) => const WelcomePage(),
                    '/home': (context) =>  HomePage(isdark: isdark,),
                    '/auth': (context) => const AuthPage(),
                    'settings':(context) => const SettingsPage(),
                    't&c':(context) => const TermsAndConditions(),
                    '/profile':(context) => const ProfilePage()
                    },
          // here the home page is set
          home: StreamBuilder<models.User?>(
            stream: AuthRepository(account: widget.account)
                .currentUser()
                .asStream(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return HomePage(
                  client: widget.account.client,
                  isdark: isdark,
                );
              }
              return const WelcomePage();
            },
          ),
        ),
      ),
    );
  }
}
