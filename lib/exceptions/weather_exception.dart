// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherException implements Exception {
  String message;
  WeatherException([this.message = 'Someting went wrong']) {
    message = 'Weather Exception: $message';
  }

  @override
  String toString() {
    return message;
  }
}
