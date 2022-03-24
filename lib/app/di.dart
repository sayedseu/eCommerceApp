import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/data_source/local_data_source.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source.dart';
import 'package:ecommerce_app/data/network/network_info.dart';
import 'package:ecommerce_app/data/network/rest_client.dart';
import 'package:ecommerce_app/data/repository/cart_repository_impl.dart';
import 'package:ecommerce_app/data/repository/product_repository_impl.dart';
import 'package:ecommerce_app/domain/repository/cart_repository.dart';
import 'package:ecommerce_app/domain/repository/product_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton(
    () => Dio(),
  );
  instance.registerLazySingleton(
    () => ImagePicker(),
  );
  instance.registerLazySingleton(
    () => RestClientService(dio: instance.get()),
  );
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(Connectivity()),
  );
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(instance.get()),
  );
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  instance.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(instance.get(), instance.get()),
  );
  instance.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(instance.get(), instance.get(), instance.get()),
  );
}
