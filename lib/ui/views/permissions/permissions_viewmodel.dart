import 'package:flutter_logs/flutter_logs.dart';
import 'package:glass_down_v2/app/app.locator.dart';
import 'package:glass_down_v2/services/settings_service.dart';
import 'package:glass_down_v2/ui/views/apps/apps_view.dart';
import 'package:glass_down_v2/util/function_name.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shizuku_apk_installer/shizuku_apk_installer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PermissionsViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();
  final _settings = locator<SettingsService>();

  final description =
      'Following permissions are optional. Click on the tile to enable them.';

  bool _storage = false;
  bool get storage => _storage;

  bool _install = false;
  bool get install => _install;

  bool _shizuku = false;
  bool get shizuku => _shizuku;

  bool _updates = false;
  bool get updates => _updates;

  Future<void> init() async {
    final sdk = await _settings.getSdkVersion();
    bool storageGranted = false;
    if (sdk >= 30) {
      storageGranted = await Permission.manageExternalStorage.status.isGranted;
    } else {
      storageGranted = await Permission.storage.status.isGranted;
    }
    final installGranted =
        await Permission.requestInstallPackages.status.isGranted;
    final result = await ShizukuApkInstaller.checkPermission();
    _shizuku = result?.contains('granted') ?? false;
    _storage = storageGranted;
    _install = installGranted;
    _updates = _settings.disableUpdates;
    rebuildUi();
  }

  Future<void> goHome() async {
    await createAppDir();
    _settings.setShownPermissions(true);
    _nav.clearStackAndShowView(const AppsView());
  }

  Future<void> createAppDir() async {
    try {
      await _settings.ensureAppDirExists();
    } catch (e) {
      FlutterLogs.logError(
        runtimeType.toString(),
        getFunctionName(),
        e.toString(),
      );
    }
  }

  Future<void> requestStoragePermission() async {
    final sdk = await _settings.getSdkVersion();
    PermissionStatus storageGranted = PermissionStatus.denied;
    if (sdk >= 30) {
      storageGranted = await Permission.manageExternalStorage.request();
    } else {
      storageGranted = await Permission.storage.request();
    }
    _storage = storageGranted.isGranted;
    rebuildUi();
  }

  Future<void> requestInstallPermission() async {
    final result = await Permission.requestInstallPackages.request();
    _install = result.isGranted;
    rebuildUi();
  }

  Future<void> requestShizukuPermission() async {
    final result = await ShizukuApkInstaller.checkPermission();
    _shizuku = result?.contains('granted') ?? false;
    rebuildUi();
  }

  void requestUpdatesPermission() {
    _updates = !_updates;
    _settings.setDisableUpdates(_updates);
    rebuildUi();
  }
}
