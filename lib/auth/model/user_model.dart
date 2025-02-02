class UserrModell {
  final String name;
  final String lastName;
  final String phone;
  final String faceForm;
  final String hairForm;
  final String ryeColor;
  final String likeHair;
  final String password;
  final int id;

  UserrModell({
    required this.name,
    required this.lastName,
    required this.phone,
    required this.faceForm,
    required this.hairForm,
    required this.ryeColor,
    required this.likeHair,
    required this.password,
    required this.id,
  });

  // این متد برای تبدیل مدل به نقشه (Map) استفاده میشه
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastn': lastName,
      'phone': phone,
      'face_form': faceForm,
      'hair_form': hairForm,
      'ryecolor': ryeColor,
      'like_hair': likeHair,
      'password': password,
      'id': id,
    };
  }

  // این متد برای ساخت مدل از نقشه داده‌ها استفاده میشه
  factory UserrModell.fromJson(Map<String, dynamic> json) {
    return UserrModell(
      name: json['name'],
      lastName: json['lastn'],
      phone: json['phone'],
      faceForm: json['face_form'],
      hairForm: json['hair_form'],
      ryeColor: json['ryecolor'],
      likeHair: json['like_hair'],
      password: json['password'],
      id: json['id'],
    );
  }
}
