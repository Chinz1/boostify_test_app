import 'package:boostify_test_app/auth/database_helper.dart';

class AuthRepository {
  final DatabaseHelper databaseHelper;

  AuthRepository({required this.databaseHelper});

  Future<Map<String, dynamic>?> getUser(String email, String password) {
    return databaseHelper.getUser(email, password);
  }
}
