class Profile {
  final String id;
  final String username;
  final String email;
  final String phone;

  Profile({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory Profile.fromMap(Map<String, dynamic> m) => Profile(
        id: m['id'] as String,
        username: m['username'] as String? ?? '',
        email: m['email'] as String? ?? '',
        phone: m['phone'] as String? ?? '',
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'email': email,
        'phone': phone,
        'username': username,
      };
}
