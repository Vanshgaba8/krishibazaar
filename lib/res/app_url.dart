import 'package:krishibazaar/.env.dart';

class AppUrl {
  static var loginEndPoint = baseUrl + 'user/login';
  static var registerApiEndPoint = '${baseUrl}user/register';
  static var userProfile = '${baseUrl}user/profile';
  static var addProduct = '${baseUrl}product/create';
  static var viewProductList = '${baseUrl}product/get-all';
  static var viewParticularProduct = "${baseUrl}product/";
  static var addCategory = '${baseUrl}cat/create';
  static var categoryList = '${baseUrl}cat/get-all';
  static var paymentOnline = '${baseUrl}order/payments';
}
