import 'package:cots_web_admin/api/model/BaseResponseModel.dart';

extension Response on Map<String, dynamic> {
  BaseResponseModel get baseResponse => BaseResponseModel.fromJson(this);
}