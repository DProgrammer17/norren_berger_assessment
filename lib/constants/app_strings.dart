abstract class AppStrings {
  static const appTitle = 'Norren_Assessment';
  static const welcomeToNorren = 'Welcome to Norren';
  static const signInBelow = 'Please input your details and sign in below';
  static String hiUsername(String name) => 'Hi! $name';
  static const pleaseFillOTPBelow = 'Please fill in your otp below';
  static const nameText = 'Name';
  static const nameText2 = 'Please enter name';
  static const emailText = 'Email';
  static const emailSubtitle = 'Please enter email';
  static const login = 'Login';
  static const ok = 'Okay';
  static const clickHere = 'Click Here';
  static const otpSentToMail = 'Your OTP has been sent to specified mail';
  static const otpVerified = 'Your OTP has been verified!';
  static const unavailable = 'Unavailable';
  static const na = 'N/A';
  static const minFund = 'Min Fund:';
  static const naira = 'naira';
  static const dollar = 'dollar';
  static const products = 'Products';
  static const subProductsTitle = 'Sub Products:';
  static const productDetails = 'Product Details';
  static const productIDTitle = 'Product ID:';
  static const productNameTitle = 'Product Name:';
  static const productDescriptionTitle = 'Product Description:';
  static const productMinWithdrawalTitle = 'Min Withdrawal:';
  static const productMinFundTitle = 'Min Fund:';
  static const productFeaturesTitle = 'Features:';
  static const productCreatedAtTitle = 'Features:';
  static const productsRetrievedSuccessfully = 'Products retrieved successfully';
  static const noProducts = 'No Products Available';
  static const noProductsSubtitle = 'You currently have no products, refresh or add some products.';
  static const refresh = 'Refresh';
  static const logout = 'LogOut';
}

abstract class ErrorStrings {
  static const textValidateShort = 'Too short';
  static const textValidateEmpty = 'Cannot be empty';
  static const textValidateName =
      'Name must contain only letters, a hyphen';
  static const invalidEmail = "Email is not valid";
  static const pleaseFillAllFields = "Please fill all fields";
  static const exceptionMessage =
      'Something went wrong. we\'re looking into it';
  static const exceptionMessage2 =
      "Something went wrong. We're unable to complete this process";
}
