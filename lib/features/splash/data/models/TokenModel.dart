import 'package:rent_ready_app/utilities/common_imports.dart';

class TokenModel {
  String tokenType;
  int expiresIn;
  int extExpiresIn;
  String accessToken;

  TokenModel({this.accessToken, this.tokenType, this.extExpiresIn, this.expiresIn});
  TokenModel.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    extExpiresIn = json['ext_expires_in'];
    accessToken = json['access_token'];
  }
}

class TokenRequestModel {
  String clientId, clientSecret, scope, grantType, tenantId;

  TokenRequestModel(
      {@required this.tenantId,
      @required this.scope,
      @required this.clientId,
      @required this.clientSecret,
      @required this.grantType});

  Map<String, dynamic> toJson() {
    return {
      'tenantId': tenantId,
      'grant_type': grantType,
      'client_id': clientId,
      'client_secret': clientSecret,
      'scope': scope
    };
  }
}
