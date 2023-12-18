import 'package:cots_web_admin/api/model/ErrorResponse.dart';
import 'package:cots_web_admin/api/services/AuthService.dart';
import 'package:cots_web_admin/app.dart';
import 'package:cots_web_admin/extensions/snack_bar.dart';
import 'package:cots_web_admin/left-nav.dart';
import 'package:cots_web_admin/utils/local_storage_service.dart';
import 'package:cots_web_admin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

class LoginProvider with ChangeNotifier {
  final BuildContext context;

  LoginProvider(this.context);

  final AuthService _service = AuthService.shared;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    if (!validateEmail(email)) {
      context.showSnackBar('Please enter a valid email',
          type: SnackBarType.error);
      return;
    }
    if (!validatePassword(password)) {
      context.showSnackBar(
          '''Please enter a valid password.\nMinimum 8 characters including uppercase letters, lowercase letters, special letters.
      ''',
          type: SnackBarType.error);
      return;
    }
    isLoading = true;
    await _service
        .dang_nhap(email: email, password: password)
        .onError((ErrorResponse error, stackTrace) {
      context.showSnackBar(error.error?.first ?? 'Error',
          type: SnackBarType.error);
    }).then((value) {
      if (value == null) return;
      if ((JwtDecoder.tryDecode(LocalStorageService.jwt ?? '')?['role'] ??
              '') !=
          'Admin') {
        context.showSnackBar('This account don\'t have permission!',
            type: SnackBarType.error);
        return;
      }
      context.read<App>().user = value;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const LeftNav()));
    }).whenComplete(() => isLoading = false);
  }
}
