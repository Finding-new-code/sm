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
  ..setEndpoint(endpoint)
  ..setProject(projectId);
  //..setSelfSigned(status: true);
  //final Account account = Account();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // here the bloc provider for the auth bloc
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
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
