// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/HomePage/bloc/home_bloc.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/ProfilePage/bloc/profile_bloc.dart';
import 'package:path_provider/path_provider.dart';
import '../../constants/appwriteconstants.dart';
import '../../constants/tools.dart';
import '../src.dart';

final servicelocator = GetIt.instance;

Future<void> setupAndInitDependencies() async {
  //await Talsec.instance.start(secruity().config());
  ///
  ///
  /// here the appwrite client is initialized
  // Workmanager().initialize(
  //   BackgroundTaskManegers().callbackDispatcher(),
  //   isInDebugMode: true,
  // );
  // log('workmanager is initialised successfully');

  final Client client = Client();
  client
    ..setEndpoint(AppwriteConstants.endpoint)
    ..setProject(AppwriteConstants.projectId)
    ..setSelfSigned(status: true);
  log("AppWrite initialised successfully");

  // await Firebase.initializeApp(options: defaultTargetPlatform);

  servicelocator.registerLazySingleton(() => client);

  servicelocator.registerFactory<Connectivity>(() => Connectivity());

  /// here the cubits are initialized =>
  servicelocator.registerLazySingleton(
      () => InternetCubit(connectivity: servicelocator()));

  /// here the all instances are initialized => client, database, storage, account
  servicelocator.registerFactory<Realtime>(() => Realtime(client));
  servicelocator.registerFactory<Databases>(() => Databases(client));
  servicelocator.registerFactory<Storage>(() => Storage(client));
  servicelocator.registerFactory<Account>(() => Account(client));

  /// here the repositories are initialized =>

  servicelocator.registerFactory<DatabasesRepository>(() => DatabasesRepository(
      databases: servicelocator(), realtime: servicelocator()));
  servicelocator.registerFactory<AuthRepository>(
      () => AuthRepository(account: servicelocator()));
  servicelocator.registerFactory<StorageRepository>(
      () => StorageRepository(storage: servicelocator()));

  servicelocator.registerFactory<HomeBloc>(() => HomeBloc(
      databasesrepository: servicelocator(),
      storagerepository: servicelocator()));

  servicelocator.registerFactory<ProfileBloc>(() => ProfileBloc(
      databasesrepository: servicelocator()));

  /// here the hive storage is intialize =>
  final path = await getApplicationCacheDirectory();
  Hive.defaultDirectory = path.path;
  log('hive local databases is initialised successfully');
  Hive.registerAdapter('Posts', (map) => Post.fromMap(map));
  Hive.registerAdapter("userInfo", (map) => UserModel.fromMap(map));

}
