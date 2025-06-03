// lib/utils/session.dart

class Session {
  static String? userToken;

  static bool isLoggedIn() {
    return userToken != null && userToken!.isNotEmpty;
  }

  static void saveToken(String token) {
    userToken = token;
    // Aqui você pode adicionar persistência com SharedPreferences, se quiser
  }

  static void clear() {
    userToken = null;
  }
}
