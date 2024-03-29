// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:glass_down_v2/ui/dialogs/edit_app/edit_app_dialog_model.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String AppNameValueKey = 'appName';
const String AppUrlValueKey = 'appUrl';

final Map<String, TextEditingController> _EditAppDialogTextEditingControllers =
    {};

final Map<String, FocusNode> _EditAppDialogFocusNodes = {};

final Map<String, String? Function(String?)?> _EditAppDialogTextValidations = {
  AppNameValueKey: EditAppDialogValidators.validateAppName,
  AppUrlValueKey: EditAppDialogValidators.validateAppUrl,
};

mixin $EditAppDialog {
  TextEditingController get appNameController =>
      _getFormTextEditingController(AppNameValueKey);
  TextEditingController get appUrlController =>
      _getFormTextEditingController(AppUrlValueKey);

  FocusNode get appNameFocusNode => _getFormFocusNode(AppNameValueKey);
  FocusNode get appUrlFocusNode => _getFormFocusNode(AppUrlValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_EditAppDialogTextEditingControllers.containsKey(key)) {
      return _EditAppDialogTextEditingControllers[key]!;
    }

    _EditAppDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditAppDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditAppDialogFocusNodes.containsKey(key)) {
      return _EditAppDialogFocusNodes[key]!;
    }
    _EditAppDialogFocusNodes[key] = FocusNode();
    return _EditAppDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    appNameController.addListener(() => _updateFormData(model));
    appUrlController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    appNameController.addListener(() => _updateFormData(model));
    appUrlController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          AppNameValueKey: appNameController.text,
          AppUrlValueKey: appUrlController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EditAppDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditAppDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _EditAppDialogTextEditingControllers.clear();
    _EditAppDialogFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get appNameValue => this.formValueMap[AppNameValueKey] as String?;
  String? get appUrlValue => this.formValueMap[AppUrlValueKey] as String?;

  set appNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AppNameValueKey: value}),
    );

    if (_EditAppDialogTextEditingControllers.containsKey(AppNameValueKey)) {
      _EditAppDialogTextEditingControllers[AppNameValueKey]?.text = value ?? '';
    }
  }

  set appUrlValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AppUrlValueKey: value}),
    );

    if (_EditAppDialogTextEditingControllers.containsKey(AppUrlValueKey)) {
      _EditAppDialogTextEditingControllers[AppUrlValueKey]?.text = value ?? '';
    }
  }

  bool get hasAppName =>
      this.formValueMap.containsKey(AppNameValueKey) &&
      (appNameValue?.isNotEmpty ?? false);
  bool get hasAppUrl =>
      this.formValueMap.containsKey(AppUrlValueKey) &&
      (appUrlValue?.isNotEmpty ?? false);

  bool get hasAppNameValidationMessage =>
      this.fieldsValidationMessages[AppNameValueKey]?.isNotEmpty ?? false;
  bool get hasAppUrlValidationMessage =>
      this.fieldsValidationMessages[AppUrlValueKey]?.isNotEmpty ?? false;

  String? get appNameValidationMessage =>
      this.fieldsValidationMessages[AppNameValueKey];
  String? get appUrlValidationMessage =>
      this.fieldsValidationMessages[AppUrlValueKey];
}

extension Methods on FormStateHelper {
  setAppNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AppNameValueKey] = validationMessage;
  setAppUrlValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AppUrlValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    appNameValue = '';
    appUrlValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AppNameValueKey: getValidationMessage(AppNameValueKey),
      AppUrlValueKey: getValidationMessage(AppUrlValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _EditAppDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _EditAppDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      AppNameValueKey: getValidationMessage(AppNameValueKey),
      AppUrlValueKey: getValidationMessage(AppUrlValueKey),
    });
