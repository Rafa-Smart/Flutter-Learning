// Custom exceptions untuk menangani error dari API
// Exception handling yang baik membantu debugging dan user experience

// nah jadi disni kita buat beberapa class exception

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  // nah jadi dinsi message itu wjib dan nanti ga perlu pakai named parameer
  // tapi kalo yang statuscode itu nanti bisa di isi bisa juga enggak
  // dan harus pakai named parameter
  ApiException(this.message, {this.statusCode});

  @override
  // nah jaid n tuh fungis yang otomatis di panggil kalo kita manggil objek ini
  // jadi kalo kia print(objekApiException) maka akan otomatis manggil fungsi ini
  String toString() {
    return 'ApiException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
  }
}

// nah disni baru kita akna membuat class class exceptionnya yang lebih spesifik lagi

class BadRequestException extends ApiException {
  // nah jadi disni itu kita seperti meneruskan dari class ini ke class induknya, denan message nya iu dari class ini dan statusCodea itu kita hardcode 400
  BadRequestException(String message) : super(message, statusCode: 400);
}

class UnauthorzedException extends ApiException {
  UnauthorzedException(String message) : super(message, statusCode: 401);
}

class NotFoundException extends ApiException {
  NotFoundException(String message) : super(message, statusCode: 404);
}

class ServerException extends ApiException {
  ServerException(String message) : super(message, statusCode: 500);
}

class NetworkException extends ApiException {
  NetworkException(String message) : super(message);
}
class TimeoutException extends ApiException {
  TimeoutException(String message) : super(message);
}