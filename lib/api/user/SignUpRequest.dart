class SignUpRequest {
  String? _birthday;
  String? _email;
  String? _gender;
  String? _name;
  String? _nickname;
  String? _password;

  SignUpRequest(
      {String? birthday,
        String? email,
        String? gender,
        String? name,
        String? nickname,
        String? password}) {
    if (birthday != null) {
      this._birthday = birthday;
    }
    if (email != null) {
      this._email = email;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (name != null) {
      this._name = name;
    }
    if (nickname != null) {
      this._nickname = nickname;
    }
    if (password != null) {
      this._password = password;
    }
  }

  String? get birthday => _birthday;
  set birthday(String? birthday) => _birthday = birthday;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get nickname => _nickname;
  set nickname(String? nickname) => _nickname = nickname;
  String? get password => _password;
  set password(String? password) => _password = password;

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    _birthday = json['birthday'];
    _email = json['email'];
    _gender = json['gender'];
    _name = json['name'];
    _nickname = json['nickname'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthday'] = this._birthday;
    data['email'] = this._email;
    data['gender'] = this._gender;
    data['name'] = this._name;
    data['nickname'] = this._nickname;
    data['password'] = this._password;
    return data;
  }
}
