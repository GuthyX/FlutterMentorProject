import 'package:flutter_mentor_project/exports.dart';

class GetAlbumsRequest extends HTTPRequestHolder<List<Album>> {
  @override
  String get host => 'jsonplaceholder.typicode.com';

  @override
  HTTPRequestMethod get method => HTTPRequestMethod.GET;

  @override
  JSONParserType get parserType => JSONParserType.LIST;  // Adjust to LIST

  @override
  String get path => '/albums';

  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTPS;

  @override
  JSONListParser<List<Album>>? get listParser => (data) =>
      data.map((item) => Album.fromJson(item)).toList();

  @override
  HTTPRequestHolderSettings get settings {
    return HTTPRequestHolderSettings(
      isDebugPrint: true,
    );
  }
}