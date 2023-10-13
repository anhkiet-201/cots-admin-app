import 'package:cots_web_admin/api/BaseApi.dart';
import 'package:cots_web_admin/api/model/User.dart';
import 'package:cots_web_admin/extensions/network.dart';

class AuthService {
  static final shared = AuthService();
  final _api = BaseApi.shared;

  Future<User?> dang_ky(
      {required String name,
      required String email,
      required String password}) async {
    final response = await _api.post(
        path: '/dang-ky',
        body: {"name": name, "email": email, "password": password});
    final baseResponse = response.baseResponse;
    if (!baseResponse.result || baseResponse.data == null) return null;
    BaseApi.jwt = response['token'];
    return User.fromJson(baseResponse.data!);
  }

  Future<User?> dang_nhap(
      {required String email, required String password}) async {
    final response = await _api.post(
        path: '/dang-nhap', body: {"userName": email, "password": password});
    final baseResponse = response.baseResponse;
    if(!baseResponse.result || baseResponse.data == null) return null;
    BaseApi.jwt = response['token'];
    return User.fromJson(baseResponse.data!);
  }

  Future<void> dang_xuat() async {

  }
}
