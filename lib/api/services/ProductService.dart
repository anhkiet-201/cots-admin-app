// import 'package:cdio_web/api/BaseApi.dart';
// import 'package:cdio_web/api/model/Product.dart';
// import 'package:cdio_web/extensions/network.dart';
//
// class ProductService {
//   static final shared = ProductService();
//   final _api = BaseApi.shared;
//
//   Future<List<Product>?> list_product_info_homepage({
//     String? keyword,
//     required int index,
//     int size = 10,
//     int? categoryId
// }) async {
//     final response = await _api.post(
//         path: '/dang-ky',
//         params: {
//           'Filter':'',
//           'PageIndex':'',
//           'PageSize':'',
//           'CategoryId':''
//         }
//     );
//     final baseResponse = response.baseResponse;
//     if (!baseResponse.result || baseResponse.data == null) return null;
//     LocalStorageService.jwt = response['token'];
//     LocalStorageService.shared
//         .saveValue(key: LocalStorageKey.jwtKey, value: LocalStorageService.jwt);
//   }
// }