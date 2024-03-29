class SignInResponse {
  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;

  SignInResponse({this.idToken, this.email, this.refreshToken, this.expiresIn, this.localId});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    idToken = json['idToken'];
    email = json['email'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
    localId = json['localId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idToken'] = idToken;
    data['email'] = email;
    data['refreshToken'] = refreshToken;
    data['expiresIn'] = expiresIn;
    data['localId'] = localId;
    return data;
  }
}
