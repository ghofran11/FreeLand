class User {
  final String id;
  final String fullName;
  final String userName;
  final String? cityId;
  final String? cityName;
  final String? countryId;
  final String? countryName;
  final String? imagePath;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String accessToken;
  final String refreshToken;

  const User({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.accessToken,
    required this.refreshToken,
    this.phoneNumber,
    this.password,
    this.email,
    this.cityId,
    this.cityName,
    this.countryId,
    this.countryName,
    this.imagePath,
  });

  @override
  String toString() {
    return 'User{'
        ' id: $id,'
        ' fullName: $fullName,'
        ' accessToken: $accessToken,'
        ' refreshToken: $refreshToken,'
        ' email: $email,'
        ' phoneNumber: $phoneNumber'

        ///ToDo > not completed
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
    String? userName,
    String? countryId,
    String? countryName,
    String? cityId,
    String? cityName,
    String? imagePath,
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
      userName: userName ?? this.userName,
      countryId: countryId ?? this.countryId,
      countryName: countryName ?? this.countryName,
      cityId: cityId ?? this.cityId,
      cityName: cityName ?? this.cityName,
      imagePath: imagePath ?? this.imagePath,
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
      'userName': userName,
      'imagePath': imagePath,
      'cityName': cityName,
      'cityId': cityId,
      'countryName': countryName,
      'countryId': countryId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      phoneNumber: map['phoneNumber'] as String?,
      email: map['email'] as String?,
      //ToDo
      accessToken: map['token'] as String? ?? "mock token",
      userName: map['userName'] as String,
      countryId: map['countryId'] as String?,
      cityId: map['cityId'] as String?,
      countryName: map['countryName'] as String?,
      cityName: map['cityName'] as String?,
      imagePath: map['imagePath'] as String?,
      refreshToken: map['refreshToken'] as String,
      password: map.containsKey("type") ? map['password'] : null,
    );
  }
}
