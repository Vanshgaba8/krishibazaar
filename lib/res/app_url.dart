class AppUrl {
  static var baseUrl = 'https://backend-krishibazaar.onrender.com/api/v1/';
  // static var baseUrl = 'https://reqres.in/api/';
  static var loginEndPoint = baseUrl + 'user/login';
  static var registerApiEndPoint = '${baseUrl}user/register';
  static var addProduct = '${baseUrl}product/create';
  static var viewProductList = '${baseUrl}product/get-all';
  static var addCategory = '${baseUrl}cat/create';
  static var categoryList = '${baseUrl}cat/get-all';
}
