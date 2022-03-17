class FavoritosClass {
  FavoritosClass(
      {this.id,
      this.username,
      this.name,
      this.profileImage,
      this.headerImage,
      this.likes,
      this.headerBase64,
      this.profileBase64});

  String? id;
  String? username;
  String? name;
  String? profileImage;
  String? headerImage;
  int? likes;
  String? headerBase64;
  String? profileBase64;

  factory FavoritosClass.fromJson(Map<String, dynamic> json) => FavoritosClass(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        profileImage: json["profileImage"],
        headerImage: json["headerImage"],
        likes: json["likes"],
        headerBase64: json["headerBase64"],
        profileBase64: json["profileBase64"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "profileImage": profileImage,
        "headerImage": headerImage,
        "likes": likes,
        "headerBase64": headerBase64,
        "profileBase64": profileBase64,
      };
}
