import 'package:dio/dio.dart';
import 'package:shop_n_goo/api_constants.dart';

class ShoppingDataSource
{
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  
  Future<void> scanCart(String barcodeId, String token)
  async {
    try
        {
          final Response response = await _dio.post("cart/start_session",data: {"cart_barcode" : barcodeId},options: Options(headers: {
          "Authorization" : "Bearer $token"},
          ));
          return response.data;
        }catch(exception)
    {
      throw(exception.toString());
    }
  }
}