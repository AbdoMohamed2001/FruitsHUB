import 'package:fruits_app/core/repos/products_repos/product_repo.dart';
import 'package:fruits_app/core/repos/products_repos/product_repo_impl.dart';
import 'package:fruits_app/core/services/database_services.dart';
import 'package:fruits_app/core/services/firebase_auth_services.dart';
import 'package:fruits_app/core/services/firebase_firestore_services.dart';
import 'package:fruits_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(),
    databaseServices: getIt<DatabaseServices>(),
  ));
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(
    databaseServices: getIt<DatabaseServices>(),
  ));
}
