class Constants {
  static const String baseUrl =
      "https://finance-app-backend-1-0s2r.onrender.com/api";

  // ================= USER =================
  static const String registerUrl = "/users/register";
  static const String loginUrl = "/users/login";
  static const String updateProfileUrl = "/users/update-profile";
  static const String getProfileUrl = "/users/getUserData";

  // ================= CATEGORY =================
  static const String createCategoryUrl = "/categories/create";
  static const String getCategoriesUrl = "/categories/all";
  static const String getCategoryByIdUrl = "/categories/get/";
  static const String updateCategoryUrl = "/categories/update/";
  static const String deleteCategoryUrl = "/categories/delete/";
}
