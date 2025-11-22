class ApiEndPoints {
  static const String baseUrl = 'http://waster.runasp.net';
  static const String authBasePath = '/api/Authentication';
  static const String logIn = '$authBasePath/Login';
  static const String register = '$authBasePath/Register';
  static const String refreshToken = '$authBasePath/RefreshToken';
  static const String revokeToken = '$authBasePath/RevokeToken';

  static const String userBasePath = '/api/Account';
  static const String userDetails = '$userBasePath/me';
  static const String updateName = '$userBasePath/update-name';
  static const String updateBio = '$userBasePath/update-Bio';
  static const String changePassword = '$userBasePath/change-password';
  static const String changeEmail = '$userBasePath/change-email';
  static const String updateLocation = '$userBasePath/update-Location';
  static const String updatePhoneNumber = '$userBasePath/update-PhoneNumber';

  static const String postBasePath = '/api/Post';
  static const String createPost = '$postBasePath/Create-Post';
  static const String editPost = '$postBasePath/Edit-post';
  static const String getAllUsersPosts = '$userBasePath/Get-All-user-Posts';
  static const String deletePost = '$postBasePath/Delete-Post';
}
