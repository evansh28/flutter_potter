class Character {
  final String fullName;
  final String nickname;
  final String house;
  final String interpretedBy;
  final List<String> children;
  final String image;
  final String birthdate;
  final int index;

  Character({
    required this.fullName,
    required this.nickname,
    required this.house,
    required this.interpretedBy,
    required this.children,
    required this.image,
    required this.birthdate,
    required this.index,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      fullName: json['fullName'] ?? 'Unknown',
      nickname: json['nickname'] ?? 'Unknown',
      house: json['hogwartsHouse'] ?? 'Unknown',
      interpretedBy: json['interpretedBy'] ?? 'Unknown',
      children: List<String>.from(json['children'] ?? []),
      image: json['image'] ?? '',
      birthdate: json['birthdate'] ?? 'Unknown',
      index: json['index'] ?? 0,
    );
  }
}
