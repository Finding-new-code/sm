import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/src/themedata.dart';

import 'Pages/AuthPage/bloc/auth_bloc.dart';
import 'Pages/HomePage/homepage.dart';
import 'Pages/WelcomePage/welcome.dart';
import 'constants/appwriteconstants.dart';
import 'constants/tools.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
  runApp(MyApp(account: account));
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  final Account account;
  const MyApp({
    super.key,
    required this.account,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isdark = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // here the bloc provider for the auth bloc
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(widget.account),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        // showPerformanceOverlay: true,
        themeAnimationCurve: Curves.easeInOut,
        darkTheme: dark,
        theme: light,
        themeMode: ThemeMode.system,
       // debugShowCheckedModeBanner: false,
        initialRoute: "/welcome",
        // here you can add more routes with means of the pages address for navigator
        routes: {'/welcome': (context) => const WelcomePage()},
        home: HomePage(isdark: isdark,),
      ),
    );
  }
}
