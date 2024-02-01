import 'package:bloc_boiler_plate/constants/api_path.dart';
import 'package:bloc_boiler_plate/features/authentication/model/user_model.dart';
import 'package:bloc_boiler_plate/utils/dio_client.dart';
import 'package:bloc_boiler_plate/utils/pref_utils.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  AuthRepository({
    required this.dioClient,
  });

  final DioClient dioClient;
  final PrefUtils prefUtils = PrefUtils();

  bool get isSignedIn => prefUtils.getString("accessToken") != null;

  Future<UserModel> signIn(String username, String password) async {
    try{
      final response = await dioClient.post(
        login,
        data: {
          "username": username,
          "password": password,
        },
      );

      prefUtils.setString(key: "token", value: response.data["token"]);
      prefUtils.setBool("isLoggedIn", true);
      return UserModel.fromSignInResponse(response.data);
    } on DioException{
      rethrow;
    }
  }

  void signOut() {
    prefUtils.clearPreferencesData();
  }
}
