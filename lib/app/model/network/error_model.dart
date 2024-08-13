class ErrorModel {
  ErrorModel(
    this.errorCode, {
    this.errorMessage,
    this.errorCodeDescription,
    this.error,
    this.errors,
    this.message,
    this.messages,
    this.errorDescription,
  });

  ErrorModel.fromJson(Map<String, dynamic> json) {
    errorCode = int.tryParse(json['errorCode'].toString()) ?? 0;
    errorMessage =
        json['errorMessage'] != null ? json['errorMessage'].toString() : '';
    errorCodeDescription = json['errorCodeDescription'] != null
        ? json['errorCodeDescription'].toString()
        : '';
    error = json['error'] != null ? json['error'].toString() : '';
    errors = json['errors'] != null ? (json['errors'] as List<dynamic>) : [];
    message = json['message'] != null ? json['message'].toString() : '';
    messages =
        json['messages'] != null ? (json['messages'] as List<dynamic>) : [];
    errorDescription = json['error_description'] != null
        ? json['error_description'].toString()
        : '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['errorCode'] = errorCode;
    data['errorMessage'] = errorMessage;
    data['errorCodeDescription'] = errorCodeDescription;
    data['error'] = error;
    data['errors'] = errors;
    data['message'] = message;
    data['messages'] = messages;
    data['error_description'] = errorDescription;
    return data;
  }

  String? getErrorMessageTitle() {
    if (errorCodeDescription?.isNotEmpty == true) {
      return errorCodeDescription;
    } else if (error?.isNotEmpty == true) {
      return error;
    }
    return null;
  }

  String? getErrorMessage() {
    if (errorMessage?.isNotEmpty == true) {
      return errorMessage;
    } else if (errorDescription?.isNotEmpty == true) {
      return errorDescription;
    }
    return null;
  }

  int? errorCode;

  /// error from api response failure
  String? errorMessage;
  String? errorCodeDescription;

  /// error from server common failure
  String? error;
  String? message;
  List<dynamic>? errors;
  List<dynamic>? messages;
  String? errorDescription;

  // bool forbidden() =>
  //     errorCode == HttpErrorCode.unauthorized ||
  //     errorCode == HttpErrorCode.forbidden;
}
