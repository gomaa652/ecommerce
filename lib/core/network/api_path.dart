class AppApiPaths {
  static const String mainPath = "/";
  static const String phoneLogin = '${mainPath}login-with-phone';
  static const String verifyPhone = '${mainPath}verify-phone';
  static const String profile = '${mainPath}profile';
  static const String userById = '${mainPath}users/{userId}'; // + userId
  static const String users = '${mainPath}users'; // + username
  static const String checkUserName =
      '${mainPath}check-username/{username}'; // + username
  static const String posts = '${mainPath}posts';
  static const String postsFollowing = '${mainPath}following';
  static const String postById = '${mainPath}posts/{postId}'; // + postId
  static const String toggleReaction =
      '${mainPath}posts/{postId}/reaction'; // + postId
  static const String category = '${mainPath}categories';
  static const String businesses = '${mainPath}businesses';
  static const String deleteBusinesses =
      '${mainPath}businesses/{businessId}'; // + businessId

  static const String room = '${mainPath}rooms';
  static const String updateRoom = '${mainPath}rooms/{roomId}';
  static const String joinRoom = '${mainPath}rooms/{roomId}/join';
  static const String leaveRoom = '${mainPath}rooms/{roomId}/leave';
  static const String roomMessages = '${mainPath}rooms/{roomId}/messages';
  static const String readMessage = '${mainPath}messages/{messageId}/read';
  static const String reactionMessage =
      '${mainPath}messages/{messageId}/reaction';
  static const String updateMessage = '${mainPath}messages/{messageId}';
  static const String deleteMessage = '${mainPath}messages/{messageId}';
  static const String comments = '${mainPath}posts/{postId}/comments';
  static const String updateComment = '${mainPath}comments/{commentId}';
  static const String reactComment = '${mainPath}comments/{commentId}/reaction';
  static const String topics = '${mainPath}topics';
  static const String search = '${mainPath}topics';
}
