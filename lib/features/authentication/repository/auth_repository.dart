import 'package:bloc_boiler_plate/constants/api_path.dart';
import 'package:bloc_boiler_plate/features/authentication/model/user_model.dart';
import 'package:bloc_boiler_plate/utils/dio_client.dart';
import 'package:bloc_boiler_plate/utils/pref_utils.dart';

class AuthRepository {
  const AuthRepository({
    required this.dioClient,
    required this.prefUtils,
  });

  final DioClient dioClient;
  final PrefUtils prefUtils;

  bool get isSignedIn => prefUtils.getString("accessToken") != null;

  Future<UserModel> signIn(String username, String password) async {
    final response = await dioClient.post(
      "$authentication/$login",
      data: {
        "username": username,
        "password": password,
      },
    );
    prefUtils.setString(key: "token", value: response.data["token"]);
    prefUtils.setBool("isLoggedIn", true);
    return UserModel.fromJson(response.data);
  }

  void signOut() {
    prefUtils.clearPreferencesData();
  }
}
