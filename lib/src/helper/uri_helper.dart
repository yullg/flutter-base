class UriHelper {
  static Uri baseUri(Uri uri) {
    return Uri(scheme: uri.scheme, host: uri.host, port: uri.port, path: uri.path);
  }

  UriHelper._();
}
