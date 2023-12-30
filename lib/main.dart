import 'package:flutter/material.dart';

import 'Pages/AuthPage/bloc/auth_bloc.dart';
import 'Pages/HomePage/homepage.dart';
import 'Pages/WelcomePage/welcome.dart';
import 'constants/appwriteconstants.dart';
import 'constants/tools.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Client client =Client();
  client 
  ..setEndpoint(AppwriteConstants.endpoint)
  ..setProject(AppwriteConstants.projectId)
  ..setSelfSigned(status: true);
  debugPrint("AppWrite initialise");
  /// here the all instances are initialized => client, database, storage, account
  final Databases databases = Databases(client);
  final Storage storage = Storage(client);
  final Account account = Account(client);
  runApp( MyApp(account: account));
  
}

class MyApp extends StatelessWidget {
 final Account account ;
  const MyApp({super.key, required this.account,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // here the bloc provider for the auth bloc
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(account),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/welcome",
        routes: {'/welcome': (context) => const WelcomePage()},
        home: const HomePage(),
      ),
    );
  }
}
