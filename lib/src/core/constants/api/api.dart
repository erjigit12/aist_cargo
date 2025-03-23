class ApiConst {
  static const domain = 'https://api.aistcargo.kyrgyz-source.com';

  // String get allPartners=>$domain/api/partners/allPartners';

  static const signUp = '$domain/api/auth/signUp';
  static const signIn = '$domain/api/auth/signIn';
  static const verifyCode = '$domain/api/auth/verify';
  static const userProfile = '$domain/api/users/get';
  static const userUpdate = '$domain/api/users/update';
  static const isSubscription = '$domain/api/deliveryApi/deliveriesTrue';
  static const createDelivery = '$domain/api/deliveryApi/create';
  static const createSendings = '$domain/api/sendings/create';
  static const createSubscription = '$domain/api/subscriptions';
  // static const googleSignIn = '$domain/api/auth/withGoogle';
  // static const announcement = '$domain/api/announcements/getAll';
  // static const userUpdateProfile = '$domain/api/users/updateProfile';
  // static const allpartners = '$domain/api/partners/allPartners';
  // static const directionsGetAll = '$domain/api/directions/getAll';
  // static const directionsGetById = '$domain/api/directions';
  // static const String getAllBlogs = '$domain/api/blogs/getAllBlogs';
  // static const String getBlogById = '$domain/api/blogs';
  // static const schedules = '$domain/api/schedules/getAll';
}

ApiConst apiConst = ApiConst();
