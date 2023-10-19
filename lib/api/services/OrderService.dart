import 'package:cots_web_admin/api/BaseApi.dart';
import 'package:cots_web_admin/api/model/Order.dart';
import 'package:cots_web_admin/extensions/network.dart';

class OrderService {
  static final shared = OrderService();
  final _api = BaseApi.shared;

  Future<Order?> create_order(
      {required String name,
      required String address,
      required String email,
      required String phone,
      required List<OrderRequest> list}) async {
    final listProductOrder =
        list.map((e) => {'productId': e.id, 'quantity': e.quantity}).toList();
    final response = await _api.post(path: '/api/order', body: {
      "orderDate": DateTime.now(),
      "shipName": name,
      "shipAddress": address,
      "shipEmail": email,
      "shipPhoneNumber": phone,
      "listProductOrder": listProductOrder
    });
    final baseResponse = response.baseResponse;
    if(baseResponse.data == null) return null;
    return Order.fromJson(baseResponse.data!);
  }

  Future<List<Order>> get_all() async {
    final response = await _api.get(path: '/api/order');
    final pageableResponse = response.pageableResponse;
    return pageableResponse.data.map((e) => Order.fromJson(e)).toList();
  }
}

class OrderRequest {
  final int id;
  final int quantity;

  OrderRequest(this.id, this.quantity);
}
