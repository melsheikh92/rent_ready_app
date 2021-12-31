import 'package:flutter_test/flutter_test.dart';
import 'package:rent_ready_app/features/splash/data/models/TokenModel.dart';

void main() {
  test('Token Model test', () {
    Map<String, dynamic> json = {
      "token_type": "Bearer",
      "expires_in": 3599,
      "ext_expires_in": 3599,
      "access_token": "token"
    };

    var model = TokenModel.fromJson(json);

    expect(model.accessToken, "token");
    expect(model.tokenType, "Bearer");
    expect(model.expiresIn, 3599);
    expect(model.extExpiresIn, 3599);
  });
}
