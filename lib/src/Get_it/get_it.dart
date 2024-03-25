// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../constants/appwriteconstants.dart';
import '../../constants/tools.dart';
import '../src.dart';

final servicelocator = GetIt.instance;

Future<void> setupaAndInitDependencies() async {
  //await Talsec.instance.start(secruity().config());
  ///
  ///
  /// here the appwrite client is initialized
  final Client client = Client();
  client
    ..setEndpoint(AppwriteConstants.endpoint)
    ..setProject(AppwriteConstants.projectId)
    ..setSelfSigned(status: true);
  log("AppWrite initialised successfully");

  servicelocator.registerLazySingleton(() => client);

  servicelocator.registerFactory(() => Connectivity());

  // Workmanager().initialize(
  //   BackgroundTaskManegers().callbackDispatcher('notify'),
  //   isInDebugMode: true,
  // );
  // log('workmanager is initialised successfully');
   servicelocator.registerLazySingleton(() => InternetCubit(connectivity: servicelocator()));
  //
  // servicelocator.registerFactory<>(() => DatabasesRepository(
  //     databases: servicelocator(), realtime: servicelocator()));
  // servicelocator.registerFactory<AuthRepository>(
  //     () => AuthRepository(account: servicelocator()));
  // servicelocator.registerFactory<StorageRepository>(
  //     () => StorageRepository(storage: servicelocator()));

      /// here the hive storage is intialize =>
  final path = await getApplicationCacheDirectory();
  Hive.defaultDirectory = path.path;
  log('hive local databases is initialised successfully');

  servicelocator.registerSingleton(() => Hive.box(name: 'local_databases'));
}
