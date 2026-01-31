// disni kita akna buat model untk kelola response dari api

class ApiResponse<T> {
  // nah nanit akna ApiResponse<List<Post>> postsResponse = ApiResponse();
  // dan juga ini  ApiResponse<Post> _postResponse = ApiResponse();
  // nah jadi disini ita buatkakn agar tipe data itu eneric
  // jad nnati sesuai sama aa yang di maskan di data
  final T? data;
  final String? error;
  final bool isLoading;

  // disni deaulntya si isLoaing ini adalah false
  ApiResponse({this.data, this.error, this.isLoading = false});

  // nah disni kita akn membuat factory lgi untuk ngecek loading
  // jadi nanti ketika kita panggil factory ini
  // maka nanti aka di retunkan objek yang ada data, error, isLoading
  // sesuai sama kondisinya

  factory ApiResponse.loading() {
    return ApiResponse(isLoading: true, data: null, error: null);
  }

  // nah ingt, kalo tipe generic di taruh di parameter fungsi
  // mka tipenya akna mnyeseuaiakn  dengna data yang di masuakkan
  factory ApiResponse.success(T data) {
    return ApiResponse(data: data, isLoading: false, error: null);
  }

  factory ApiResponse.error(String error) {
    return ApiResponse(error: error, isLoading: false, data: null);
  }

  // lalu disini ktia akna buat getter untuk tau kondisi
  // dia error atua enggnya

  bool get hasData => data != null;
  bool get hasError => error != null;
}
