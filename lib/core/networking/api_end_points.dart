class ApiEndPoints {
  static const String baseUrl = 'http://waster.runasp.net';
  static const String authBasePath = '/api/Authentication';
  static const String logIn = '$authBasePath/Login';
  static const String register = '$authBasePath/Register';
  static const String refreshToken = '$authBasePath/RefreshToken';
  static const String revokeToken = '$authBasePath/RevokeToken';
}
