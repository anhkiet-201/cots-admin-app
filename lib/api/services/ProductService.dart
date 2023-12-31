import 'package:cots_web_admin/api/BaseApi.dart';
import 'package:cots_web_admin/api/model/BaseResponseModel.dart';
import 'package:cots_web_admin/api/model/Product.dart';
import 'package:cots_web_admin/extensions/network.dart';

class ProductService {
  static final shared = ProductService();
  final _api = BaseApi.shared;

  Future<Pageable<Product>> list_product_info_homepage({
    String? keyword,
    required int pageIndex,
    int pageSize = 10,
    int? categoryId
  }) async {
    final response = await _api.post(
        path: '/list-product-info-homepage',
        params: {
          'Filter': keyword ?? '',
          'PageIndex': pageIndex,
          'PageSize': pageSize,
          'CategoryId': categoryId ?? ''
        }
    );
    final pageResponse = response.pageableResponse;
    return pageResponse.to(type: Product.new);
  }

  Future<Product?> get_product({required int id}) async {
    final response = await _api.get(
      path: '/api/Product/$id'
    );
    if(response.baseResponse.data == null) return null;
    return Product.fromJson(response.baseResponse.data!);
  }
}