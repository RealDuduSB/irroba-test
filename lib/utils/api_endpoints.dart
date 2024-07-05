class API {
  static const String BASE_URL = 'https://api.irroba.com.br/v1';

  // Auth endpoints
  static const String GET_TOKEN = '$BASE_URL/getToken';
  static const String CUSTOMER_LOGIN = '$BASE_URL/customer/login';

  // Banner endpoints
  static const String GET_BANNER = '$BASE_URL/banner';
  static const String GET_BANNER_V2 = '$BASE_URL/banner/v2';

  // Category endpoints
  static const String GET_CATEGORY = '$BASE_URL/category';
  static String getCategoryById(String id) => '$BASE_URL/category/$id';
  static String getCategoryByReference(String reference) =>
      '$BASE_URL/category/reference/$reference';
  static const String POST_CATEGORY = '$BASE_URL/category';

  // Customer endpoints
  static const String GET_CUSTOMER = '$BASE_URL/customer';
  static String getCustomerById(String id) => '$BASE_URL/customer/$id';
  static String getCustomerAddressList(String id) =>
      '$BASE_URL/customer/address_list/$id';
  static String getCustomerByCpfCnpj(String cpfCnpj) =>
      '$BASE_URL/customer/cpf_cnpj/$cpfCnpj';
  static const String GET_ABANDONED_CART = '$BASE_URL/customer/abandoned_cart';
  static String getAbandonedCartById(String id) =>
      '$BASE_URL/customer/abandoned_cart/$id';
  static const String POST_CUSTOMER = '$BASE_URL/customer';
  static String putCustomerById(String id) => '$BASE_URL/customer/$id';

  // Customer group endpoints
  static const String GET_CUSTOMER_GROUP = '$BASE_URL/customer/group';
  static const String POST_CUSTOMER_GROUP = '$BASE_URL/customer/group';
  static String putCustomerGroupById(String id) =>
      '$BASE_URL/customer/group/$id';

  // Address endpoints
  static const String POST_ADDRESS = '$BASE_URL/address';
  static String deleteAddressById(String id) => '$BASE_URL/address/$id';

  // Manufacturer endpoints
  static const String GET_MANUFACTURER = '$BASE_URL/manufacturer';
  static String getManufacturerById(String id) => '$BASE_URL/manufacturer/$id';
  static const String POST_MANUFACTURER = '$BASE_URL/manufacturer';
  static String putManufacturerById(String id) => '$BASE_URL/manufacturer/$id';
  static String deleteManufacturerById(String id) =>
      '$BASE_URL/manufacturer/$id';

  // Coupon endpoints
  static const String GET_COUPON = '$BASE_URL/coupon';
  static String getCouponByCode(String code) => '$BASE_URL/coupon/$code';
  static const String POST_COUPON = '$BASE_URL/coupon';

  // Option endpoints
  static const String GET_OPTION = '$BASE_URL/option';
  static const String POST_OPTION = '$BASE_URL/option';
  static String putOptionVariationById(String id) =>
      '$BASE_URL/option/variation/$id';
  static String deleteOptionVariationById(String id) =>
      '$BASE_URL/option/variation/$id';

  // Product endpoints
  static const String GET_PRODUCTS = '$BASE_URL/products';
  static String getProductStock() => '$BASE_URL/product';
  static String getProductByIdOrModel(String idOrModel) =>
      '$BASE_URL/product/$idOrModel';
  static String getProductByModel(String model) =>
      '$BASE_URL/product/$model/model';
  static const String GET_PRODUCT_LISTS = '$BASE_URL/product/lists';
  static String getProductByCategory(String id) =>
      '$BASE_URL/product/category/$id';
  static const String POST_PRODUCT = '$BASE_URL/product';
  static String putProductByIdOrModel(String idOrModel) =>
      '$BASE_URL/product/$idOrModel';
  static String putProductModelByModel(String model) =>
      '$BASE_URL/product/$model/model';
  static String putProductStockByIdOrModel(String idOrModel) =>
      '$BASE_URL/product/$idOrModel/stock';
  static String putProductModelStockByModel(String model) =>
      '$BASE_URL/product/$model/model/stock';
  static String putProductStockByReference(String reference) =>
      '$BASE_URL/product/stock/reference/$reference';
  static const String PUT_PRODUCT_STOCK_BATCH = '$BASE_URL/product/stock/batch';
  static String putProductPriceByIdOrModel(String idOrModel) =>
      '$BASE_URL/product/$idOrModel/price';
  static String putProductModelPriceByModel(String model) =>
      '$BASE_URL/product/$model/model/price';
  static String deleteProductById(String id) => '$BASE_URL/product/$id';
  static String deleteProductByModel(String model) =>
      '$BASE_URL/product/$model';

  // Order endpoints
  static const String GET_ORDERS = '$BASE_URL/order';
  static String getOrderById(String id) => '$BASE_URL/order/$id';
  static String updateOrderStatus(String id) => '$BASE_URL/order/$id';
  static const String INIT_ORDER_DATA = '$BASE_URL/initdata';
  static String getOrderStatusById(String id) => '$BASE_URL/order/status/$id';
  static String getOrdersAddedByDate(String date) =>
      '$BASE_URL/order/added/$date';
  static String getOrdersAddedBetweenDates(String dateIni, String dateEnd) =>
      '$BASE_URL/order/added/$dateIni/$dateEnd';
  static const String GET_ORDER_DETAILS = '$BASE_URL/order/details';
  static String getOrderByCustomerId(String id) =>
      '$BASE_URL/order/customer/$id';
  static String postOrderInvoiceById(String id) =>
      '$BASE_URL/order/$id/invoice';
  static String putOrderStatusById(String id) => '$BASE_URL/order/$id/status';
  static String putOrderReferenceById(String id) =>
      '$BASE_URL/order/$id/reference';

  // Affiliate endpoints
  static const String POST_AFFILIATE = '$BASE_URL/affiliate';
  static const String POST_INSERT_AFFILIATE = '$BASE_URL/insertAffiliate';
  static const String PUT_UPDATE_AFFILIATE = '$BASE_URL/updateAffiliate';
  static const String DELETE_DELETE_AFFILIATE = '$BASE_URL/deleteAffiliate';

  // Status endpoint
  static const String GET_STATUS = '$BASE_URL/status';
}
