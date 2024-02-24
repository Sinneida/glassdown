import 'package:glass_down_v2/app/app.locator.dart';
import 'package:glass_down_v2/app/app.snackbar.dart';
import 'package:glass_down_v2/services/font_importer_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ImportFontModel extends BaseViewModel {
  final _snackbar = locator<SnackbarService>();
  final _fontImporter = locator<FontImporterService>();

  final fontImportMessage =
      'Put the fonts you want to use into zip file. If you want to use a new ones, just load different font zip, it will overwrite the previous ones.';

  Future<void> showImportFontDialog() async {
    try {
      await _fontImporter.showImportFontDialog();
      await _fontImporter.loadFonts();
      _snackbar.showCustomSnackBar(
        title: 'Fonts',
        message: 'Fonts imported',
        variant: SnackbarType.info,
      );
    } catch (e) {
      _snackbar.showCustomSnackBar(
        variant: SnackbarType.info,
        title: 'Error',
        message: e.toString(),
      );
    }
  }
}