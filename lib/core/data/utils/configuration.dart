import 'package:balanced_meal/core/data/utils/app_environment.dart';
import 'package:balanced_meal/core/presentation/utils/configuration.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: Configuration, env: [AppEnvironment.staging])
class StagingConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://uz8if7.buildship.run/';

  @override
  String get name => 'stage';
}

@LazySingleton(as: Configuration, env: [AppEnvironment.prod])
class ProdConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://uz8if7.buildship.run/';

  @override
  String get name => 'production';
}
