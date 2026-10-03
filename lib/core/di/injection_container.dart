import 'package:get_it/get_it.dart';

import '../../feature/auth/view/cubit/auth_cubit.dart';

// إنشاء كائن GetIt العام
final sl = GetIt.instance; // sl تعني Service Locator

Future<void> initDependencies() async {
  sl.registerFactory<AuthCubit>(() => AuthCubit());
}
