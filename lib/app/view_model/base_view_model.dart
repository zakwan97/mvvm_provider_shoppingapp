import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider_shoppingapp/app/model/network/error_model.dart';
import 'package:mvvm_provider_shoppingapp/app/model/network/my_response.dart';

abstract class BaseViewModel extends ChangeNotifier {
  /// response that view layer listening for data changes
  /// view layer may perform data update or any Ui logic depends on response status
  MyResponse<dynamic, dynamic> response = MyResponse.initial();

  /// An observable value to notify view layer for any error that required immediate attention
  /// Usage in this project will be:
  /// when JWT Authentication failure, immediately notify the view layer
  ErrorModel urgentError = ErrorModel(0);

  /// Unified method to call Provider [notifyListeners()] to update [response] value.
  void notify(MyResponse<dynamic, dynamic> newResponse) {
    _resetUrgent();
    if (_hasUrgentError(newResponse)) {
      _notifyUrgent(_getUrgentErrorModel(newResponse));
    }
    response = newResponse;
    notifyListeners();
  }

  /// Unified method to call Provider [notifyListeners()] to update [urgentError] value.
  void _notifyUrgent(ErrorModel errorModel) {
    urgentError = errorModel;
    notifyListeners();
  }

  /// Reset [urgentError] to prevent duplicate notify.
  void _resetUrgent() {
    urgentError = ErrorModel(0);
  }

  /// Reset [response] to mark the response as consumed.
  void consumed() {
    response = MyResponse.initial();
    _resetUrgent();
  }

  bool _hasUrgentError(MyResponse<dynamic, dynamic> response) {
    if (response.status == ResponseStatus.ERROR &&
        response.error != null &&
        response.error is DioError) {
      final error = response.error as DioError;
      return error.response?.statusCode == 400 ||
          error.response?.statusCode == 401;
    }
    return false;
  }

  ErrorModel _getUrgentErrorModel(MyResponse<dynamic, dynamic> response) {
    final error = response.error as DioError;
    return ErrorModel(
      error.response?.statusCode,
      errorMessage: "",
    );
  }
}
