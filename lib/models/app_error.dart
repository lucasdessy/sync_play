class AppError {
  String errorTitle;
  String? errorDetails;
  StackTrace? stackTrace;
  AppError(this.errorTitle, {this.errorDetails, this.stackTrace});
}
