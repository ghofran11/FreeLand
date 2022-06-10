class User {
  final String id;
  final String fullName;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String accessToken;
  final String refreshToken;

  const User(
      {required this.id,
      required this.fullName,
      required this.accessToken,
      required this.refreshToken,
      this.phoneNumber,
      this.password,
      this.email});

  @override
  String toString() {
    return 'User{'
        ' id: $id,'
        ' fullName: $fullName,'
        ' accessToken: $accessToken,'
        ' refreshToken: $refreshToken,'
        ' email: $email,'
        ' phoneNumber: $phoneNumber'
        '}';
  }

  User copyWith({
    String? id,
    String? fullName,
    String? accessToken,
    String? refreshToken,
    String? email,
    String? phoneNumber,
    String? password,
    List<String>? topics,
    List? roles,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'email': email,
      "phoneNumber": phoneNumber,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      phoneNumber: map['phoneNumber'] as String?,
      email: map['email'] as String?,
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
      password: map.containsKey("type") ? map['password'] : null,
    );
  }
}
