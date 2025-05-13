class Profile {
  final String id;
  final String username;
  final String email;
  final String phone;
  String? avatar_url;

  Profile(
      {required this.id,
      required this.username,
      required this.email,
      required this.phone,
      this.avatar_url});

  factory Profile.fromMap(Map<String, dynamic> m) => Profile(
        id: m['id'] as String,
        username: m['username'] as String? ?? '',
        email: m['email'] as String? ?? '',
        phone: m['phone'] as String? ?? '',
        avatar_url: m['avatar_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'email': email,
        'phone': phone,
        'username': username,
        'avatar_url': avatar_url
      };
}
