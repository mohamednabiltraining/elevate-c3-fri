class BaseServerError {
  String? message;
  String? statusMsg;
  BaseServerError({
    this.message,
    this.statusMsg,
  });

  BaseServerError.fromJson(Map<String, dynamic> json){
  message =  json['message'] as String?;
  statusMsg =  json['statusMsg'] as String?;
  }

  String toString() {
    return 'BaseServerError{message: $message, statusMessage: $statusMsg}';
  }
}