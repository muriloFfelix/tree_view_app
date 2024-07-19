class BaseEndpoints {
  static const String baseUrl = 'http://fake-api.tractian.com';

  static String getCompanies() => Uri.parse('$baseUrl/companies').toString();
  static String getLocations(String companyId) =>
      Uri.parse('$baseUrl/companies/$companyId/locations').toString();
  static String getAssets(String companyId) =>
      Uri.parse('$baseUrl/companies/$companyId/assets').toString();
}
