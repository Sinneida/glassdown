import 'package:dio/dio.dart';
import 'package:glass_down_v2/app/app.locator.dart';
import 'package:glass_down_v2/models/app_info.dart';
import 'package:glass_down_v2/services/scraper_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const versionErrKey = 'version-err';

class VersionsViewModel extends BaseViewModel {
  final _scraper = locator<ScraperService>();
  final _token = CancelToken();
  final _nav = locator<NavigationService>();

  AppInfo? _app;
  AppInfo? get appWithLinks => _app;

  Future<void> fetchVersions(AppInfo app) async {
    try {
      setBusy(true);
      _app = await _scraper.getVersionList(app, _token);
    } catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }

  void cancel() {
    _token.cancel();
    _nav.previousRoute;
  }
}
