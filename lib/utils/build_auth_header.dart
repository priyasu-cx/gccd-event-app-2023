Map<String, dynamic> buildAuthHeader(String token) {
  return {'Authorization': 'Bearer $token'};
}
