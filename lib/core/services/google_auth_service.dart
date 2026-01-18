import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleAuthService {
  Future<String> signIn();
  Future<void> signOut();
}

class GoogleAuthServiceImpl implements GoogleAuthService {
  final GoogleSignIn _googleSignIn;
  final String serverClientId;

  GoogleAuthServiceImpl({required this.serverClientId})
    : _googleSignIn = GoogleSignIn.instance;

  bool _isInitialized = false;

  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await _googleSignIn.initialize(serverClientId: serverClientId);
      _isInitialized = true;
    }
  }

  @override
  Future<String> signIn() async {
    await _ensureInitialized();

    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email', 'profile', 'openid'],
      );

      final String? idToken = googleUser.authentication.idToken;

      if (idToken == null || idToken.isEmpty) {
        throw const GoogleAuthException(
          'Failed to obtain ID token from Google',
        );
      }

      return idToken;
    } on GoogleSignInException catch (e) {
      throw GoogleAuthException('Google sign-in failed: ${e.message}');
    } catch (e) {
      throw GoogleAuthException('Unexpected error during Google sign-in: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await _ensureInitialized();
    await _googleSignIn.signOut();
  }
}

class GoogleAuthException implements Exception {
  final String message;
  const GoogleAuthException(this.message);

  @override
  String toString() => 'GoogleAuthException: $message';
}

class GoogleSignInException implements Exception {
  final String message;
  const GoogleSignInException(this.message);
}
