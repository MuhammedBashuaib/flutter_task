class EndPoints {
  static const String baseUrl = "https://dummyjson.com/";
  static const String authLogin = "auth/login";
  static const String products = "products?limit=10&skip=0";
}

class ApiKeys {
  static const String statusCode = "status_code";
  static const String message = "message";
}

class AuthKeys {
  static const String password = 'password';
}

class UserKeys {
  static const String id = 'id';
  static const String username = 'username';
  static const String passwrod = 'password';
  static const String email = 'email';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String gender = 'gender';
  static const String image = 'image';
  static const String accessToken = 'accessToken';
  static const String refreshTokenken = 'refreshToken';
}

class ProductKeys {
  // ProductModel keys
  static const String id = 'id';
  static const String title = 'title';
  static const String description = 'description';
  static const String category = 'category';
  static const String price = 'price';
  static const String discountPercentage = 'discountPercentage';
  static const String rating = 'rating';
  static const String stock = 'stock';
  static const String tags = 'tags';
  static const String brand = 'brand';
  static const String sku = 'sku';
  static const String weight = 'weight';
  static const String dimensions = 'dimensions';
  static const String warrantyInformation = 'warrantyInformation';
  static const String shippingInformation = 'shippingInformation';
  static const String availabilityStatus = 'availabilityStatus';
  static const String reviews = 'reviews';
  static const String returnPolicy = 'returnPolicy';
  static const String minimumOrderQuantity = 'minimumOrderQuantity';
  static const String meta = 'meta';
  static const String images = 'images';
  static const String thumbnail = 'thumbnail';

  // Dimensions keys
  static const String width = 'width';
  static const String height = 'height';
  static const String depth = 'depth';

  // Review keys
  static const String comment = 'comment';
  static const String date = 'date';
  static const String reviewerName = 'reviewerName';
  static const String reviewerEmail = 'reviewerEmail';

  // Meta keys
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';
  static const String barcode = 'barcode';
  static const String qrCode = 'qrCode';

  // ProductsResponseModel keys
  static const String products = 'products';
  static const String total = 'total';
  static const String skip = 'skip';
  static const String limit = 'limit';
}
