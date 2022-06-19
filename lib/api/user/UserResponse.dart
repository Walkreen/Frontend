class UserResponse {
  int? _accpoint;
  String? _birthday;
  String? _email;
  String? _gender;
  int? _item;
  String? _name;
  String? _nickname;
  int? _prepoint;
  TokenResponse? _tokenResponse;

  UserResponse(
      {int? accpoint,
        String? birthday,
        String? email,
        String? gender,
        int? item,
        String? name,
        String? nickname,
        int? prepoint,
        TokenResponse? tokenResponse}) {
    if (accpoint != null) {
      this._accpoint = accpoint;
    }
    if (birthday != null) {
      this._birthday = birthday;
    }
    if (email != null) {
      this._email = email;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (item != null) {
      this._item = item;
    }
    if (name != null) {
      this._name = name;
    }
    if (nickname != null) {
      this._nickname = nickname;
    }
    if (prepoint != null) {
      this._prepoint = prepoint;
    }
    if (tokenResponse != null) {
      this._tokenResponse = tokenResponse;
    }
  }

  int? get accpoint => _accpoint;
  set accpoint(int? accpoint) => _accpoint = accpoint;
  String? get birthday => _birthday;
  set birthday(String? birthday) => _birthday = birthday;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  int? get item => _item;
  set item(int? item) => _item = item;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get nickname => _nickname;
  set nickname(String? nickname) => _nickname = nickname;
  int? get prepoint => _prepoint;
  set prepoint(int? prepoint) => _prepoint = prepoint;
  TokenResponse? get tokenResponse => _tokenResponse;
  set tokenResponse(TokenResponse? tokenResponse) =>
      _tokenResponse = tokenResponse;

  UserResponse.fromJson(Map<String, dynamic> json) {
    _accpoint = json['accpoint'];
    _birthday = json['birthday'];
    _email = json['email'];
    _gender = json['gender'];
    _item = json['item'];
    _name = json['name'];
    _nickname = json['nickname'];
    _prepoint = json['prepoint'];
    _tokenResponse = json['tokenResponse'] != null
        ? new TokenResponse.fromJson(json['tokenResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accpoint'] = this._accpoint;
    data['birthday'] = this._birthday;
    data['email'] = this._email;
    data['gender'] = this._gender;
    data['item'] = this._item;
    data['name'] = this._name;
    data['nickname'] = this._nickname;
    data['prepoint'] = this._prepoint;
    if (this._tokenResponse != null) {
      data['tokenResponse'] = this._tokenResponse!.toJson();
    }
    return data;
  }
}

class TokenResponse {
  String? _accessToken;
  String? _refreshToken;

  TokenResponse({String? accessToken, String? refreshToken}) {
    if (accessToken != null) {
      this._accessToken = accessToken;
    }
    if (refreshToken != null) {
      this._refreshToken = refreshToken;
    }
  }

  String? get accessToken => _accessToken;
  set accessToken(String? accessToken) => _accessToken = accessToken;
  String? get refreshToken => _refreshToken;
  set refreshToken(String? refreshToken) => _refreshToken = refreshToken;

  TokenResponse.fromJson(Map<String, dynamic> json) {
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this._accessToken;
    data['refreshToken'] = this._refreshToken;
    return data;
  }
}