enum Status { LOADING, COMPLETED, ERROR }

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse([this.status, this.data, this.message]);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(T data) : status = Status.COMPLETED, data = data;

  ApiResponse.error(String message) : status = Status.ERROR, message = message;

  @override
  String toString() {
    return "Status : $status \n message : $message \n data: $data";
  }
}
