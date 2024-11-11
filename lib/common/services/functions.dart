Map<String, dynamic> removeNullValueOFMap(Map<String, dynamic> parameters) {
  final queryParameters = <String, dynamic>{};

  parameters.forEach((key, value) {
    if (value != null) {
      queryParameters[key] = value;
    }
  });

  return queryParameters;
}
