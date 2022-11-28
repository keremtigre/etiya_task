class Countries {
  List<String>? response;
  String? error;
  Countries({this.response});
  Countries.withError(this.error);
  Countries.fromJson(Map<String, dynamic> json) {
    response = json['response'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    return data;
  }
}
