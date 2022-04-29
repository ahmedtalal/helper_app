import 'package:saied_app/src/data/sources/local/storage_app_theme.dart';
import 'package:saied_app/src/domain/repositories/local/i_shared_repository.dart';

class SharedRepositoryImp implements IsharedRepository {
  const SharedRepositoryImp();
  static const StorageAppTheme _appTheme = StorageAppTheme();
  @override
  Future<bool?> getData() async {
    return await _appTheme.getThemeMode();
  }

  @override
  Future<bool> savedData(data) async {
    return await _appTheme.setThemeMode(data);
  }
}
