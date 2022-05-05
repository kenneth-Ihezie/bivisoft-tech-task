class HttpResponseApi{
  final String? status;
  final String? data;

  HttpResponseApi({required this.status, required this.data});

  factory HttpResponseApi.fromJson(Map<String, dynamic> json){
    return HttpResponseApi(
        status: json['status'],
        data: json['data']
    );
  }
}