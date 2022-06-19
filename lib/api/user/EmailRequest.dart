class EmailRequest {
  String? _email;

  EmailRequest({String? email}) {
    if (email != null) {
      this._email = email;
    }
  }

  String? get email => _email;
  set email(String? email) => _email = email;

  EmailRequest.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    return data;
  }
}
