import 'package:cots_web_admin/api/BaseApi.dart';

class PaymentService {
  static final shared = PaymentService();
  final _api = BaseApi.shared;

}

class CreatePaymentResponse {
  int? paymentId;
  String? paymentUrl;

  CreatePaymentResponse({this.paymentId, this.paymentUrl});

  CreatePaymentResponse.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    paymentUrl = json['paymentUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentId'] = paymentId;
    data['paymentUrl'] = paymentUrl;
    return data;
  }
}
