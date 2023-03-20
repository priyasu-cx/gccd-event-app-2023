abstract class BaseApiClient<T, Client> {
  String baseUrl;

  final Client client;

  BaseApiClient({required this.baseUrl, required this.client});

  void configure();

  Future<T> getData({
    required String endPoint,
    Map<String, dynamic>? dataPayload,
  });

  Future<T> postData({
    required String endPoint,
    required Map<String, dynamic> dataPayload,
  });

  Future<T> putData({
    required String endPoint,
    required Map<String, dynamic> dataPayload,
  });
}
