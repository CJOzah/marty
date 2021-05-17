class ShoesModel {
  String? id;
  String? name;
  String? image;
  String? ratings;
  String? price;
  String? color;
  List<String>? size;
  bool? cartbutton = true;
  String? description;
  bool? favbutton = true;
  String? gender;

  ShoesModel(
      {this.name,
      this.id,
      this.image,
      this.gender,
      this.color,
      this.favbutton,
      this.price,
      this.cartbutton,
      this.ratings,
      this.size,
      this.description});
}
