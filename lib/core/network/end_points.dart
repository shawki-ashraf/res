abstract class EndPoints {
  static const String baseURL =
      'https://nti-ecommerce-api-production-f760.up.railway.app/api/';
  static const String register = 'register';
  static const String login = 'login';
  static const String refreshToken = 'refresh_token';
  static const String updateProfile = 'update_profile';
  static const String getUserData = 'get_user_data';
  static const String deleteUser = 'delete_user';
  static const String placeOrder = 'place_order';
  static const String cancelOrder = 'orders/cancel/1';
  static const String completeOrder = 'orders/complete/3';
  static const String getOrders = 'orders';
  static const String addToFavourite = 'add_to_favorite';
  static const String getProducts = 'products';
  static const String search = 'products/search?q=p';
  static const String bestSellers = 'best_seller_products';
  static const String topRatedProducts = 'top_rated_products';
  static const String getCategories = 'categories';
  static const String getSliders = 'sliders';
}
