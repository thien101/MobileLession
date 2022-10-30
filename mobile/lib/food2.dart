class restaurant {
  late String name, imgae, message;
  restaurant(String name, String image, String message) {
    this.name = name;
    this.imgae = image;
    this.message = message;
  }
  String getName() {
    return this.name;
  }

  String getImage() {
    return this.imgae;
  }

  String getMessage() {
    return this.message;
  }
}
