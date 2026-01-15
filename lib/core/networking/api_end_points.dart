// class ApiEndPoints {
//   static const String baseUrl = 'http://waster.runasp.net';
//   static const String authBasePath = '/api/Authentication';
//   static const String logIn = '$authBasePath/Login';
//   static const String register = '$authBasePath/Register';
//   static const String refreshToken = '$authBasePath/RefreshToken';
//   static const String revokeToken = '$authBasePath/RevokeToken';
//   static const String signInWithGoogle = '/api/GoogleAuth/google-signin';

//   static const String userBasePath = '/api/Account';
//   static const String userDetails = '$userBasePath/me';
//   static const String updateName = '$userBasePath/update-name';
//   static const String updateBio = '$userBasePath/update-Bio';
//   static const String changePassword = '$userBasePath/change-password';
//   static const String changeEmail = '$userBasePath/change-email';
//   static const String updateLocation = '$userBasePath/update-Location';
//   static const String updatePhoneNumber = '$userBasePath/update-PhoneNumber';
//   static const String deleteAccount = '$userBasePath/Delete-Account';

//   static const String postBasePath = '/api/Post';
//   static const String createPost = '$postBasePath/Create-Post';
//   static const String editPost = '$postBasePath/Edit-post';
//   static const String getAllUsersPosts = '$userBasePath/Get-All-user-Posts';
//   static const String deletePost = '$postBasePath/Delete-Post';

//   static const String browseBasePath = '/api/Browse';
//   static const String feedPosts = '$browseBasePath/feed';
//   static const String expiringSoon = '$browseBasePath/expiring-soon';
//   static const String categories = '$browseBasePath/categories';
//   static const String searchPosts = '$browseBasePath/search';

//   static const String bookMarkBasePath = '/api/BookMarks';
//   static const String deleteBookMark = '$bookMarkBasePath/Remove-Bookmark';

//   static const String claimPostBasePath = '/api/ClaimPost';
//   static const String claimPost = claimPostBasePath;
//   static const String myClaims = '$claimPostBasePath/my-claims';
//   static const String getPostClaims = '$claimPostBasePath/Get-Post-claims';
//   static const String approveClaim = '$claimPostBasePath/approve';
//   static const String rejectClaim = '$claimPostBasePath/reject';
//   static const String cancelClaim = '$claimPostBasePath/cancel';
// }

class ApiEndPoints {
  static const String baseUrl = 'http://waster.runasp.net';

  /* ========================= Auth ========================= */
  static const String authBasePath = '/api/Authentication';
  static const String logIn = '$authBasePath/Login';
  static const String register = '$authBasePath/Register';
  static const String refreshToken = '$authBasePath/RefreshToken';
  static const String revokeToken = '$authBasePath/RevokeToken';

  static const String googleSignIn = '/api/GoogleAuth/google-signin';

  /* ========================= Account ========================= */
  static const String accountBasePath = '/api/Account';
  static const String profile = '$accountBasePath/Profile';
  static const String updateName = '$accountBasePath/Name';
  static const String updateBio = '$accountBasePath/Bio';
  static const String changePassword = '$accountBasePath/Password';
  static const String changeEmail = '$accountBasePath/Email';
  static const String updateLocation = '$accountBasePath/Location';
  static const String updatePhoneNumber = '$accountBasePath/PhoneNumber';
  static const String deleteAccount =
      '$accountBasePath/Account'; // DELETE + password query
  static const String myPosts = '$accountBasePath/Posts'; // GET + pagination

  /* ========================= Posts ========================= */
  static const String postBasePath = '/api/Post';
  static const String createPost = postBasePath; // POST
  static const String updatePost = postBasePath; // PUT + id query
  static const String deletePost = postBasePath; // DELETE + id query

  /* ========================= Browse ========================= */
  static const String browseBasePath = '/api/Browse';
  static const String feedPosts = '$browseBasePath/feed';
  static const String expiringSoon = '$browseBasePath/expiring-soon';
  static const String categories = '$browseBasePath/categories';
  static const String searchPosts = '$browseBasePath/search';

  /* ========================= Bookmarks ========================= */
  static const String bookMarkBasePath = '/api/BookMarks';
  static const String getBookmarks = '$bookMarkBasePath/Bookmarks'; // GET
  static const String addBookmark = bookMarkBasePath; // POST + path {postId}
  static const String removeBookmark =
      '$bookMarkBasePath/Bookmark'; // DELETE + postId query
  static const String isBookmarked = '$bookMarkBasePath/IsBookmarked'; // GET

  /* ========================= Claims ========================= */
  static const String claimPostBasePath = '/api/ClaimPost';
  static const String claimPost = claimPostBasePath; // POST + postId query
  static const String myClaims = '$claimPostBasePath/claims'; // GET
  static const String getPostClaims = '$claimPostBasePath/Post-claims'; // GET
  static const String approveClaim = '$claimPostBasePath/approve'; // PUT
  static const String rejectClaim = '$claimPostBasePath/reject'; // PUT
  static const String cancelClaim = '$claimPostBasePath/Claim'; // DELETE
  static const String completeClaim = '$claimPostBasePath/Complete'; // PUT

  /* ========================= Notifications ========================= */
  static const String notificationsBasePath = '/api/Notifications';
  static const String notifications = notificationsBasePath; // GET
  static const String unreadCount = '$notificationsBasePath/unread-count';
  static const String markAsRead =
      notificationsBasePath; // PUT + /{id}/mark-read
  static const String markAllAsRead = '$notificationsBasePath/mark-all-read';

  /* ========================= Dashboard ========================= */
  static const String dashboard = '/api/Dashboard';
  static const String dashboardCalculate = '/api/Dashboard/Calculate';
}
