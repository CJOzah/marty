class ClothesModel {
  String? id;
  String? image;
  String? name;
  String? ratings;
  int? quantity;
  String? selectedSize;
  int? price;
  String? color;
  List<String>? size;
  String? description;
  String? gender;
  bool? cartbutton = true;
  bool? favbutton = true;

  ClothesModel(
      {this.name,
      this.id,
      this.cartbutton,
      this.selectedSize,
      this.quantity,
      this.favbutton,
      this.gender,
      this.image,
      this.color,
      this.price,
      this.ratings,
      this.size,
      this.description});

  void addtocart(bool cart) {
    cartbutton = true;
  }

  void addtocartWithQuantity(bool? cart, int? quant, String? sizeSelected) {
    cartbutton = true;
    quantity = quantity! + quant!;
    selectedSize = sizeSelected;
  }

  void removefromcart(bool cart) {
    cartbutton = false;
  }

  void setQuantity(int quant) {
    quantity = quant + quantity!;
    print(quantity);
  }

  void setSizeQuantity(int quant) {
    quantity = quant;
    print(quantity);
  }

  int? getQuantity() {
    return quantity;
  }

  void setSelectedSize(String size) {
    selectedSize = size;
  }
}

List<ClothesModel> cloth = [
  ClothesModel(
      name: "Mens Long Sleeve Shirt",
      id: "01",
      cartbutton: true,
      favbutton: false,
      selectedSize: "M",
      quantity: 0,
      price: 5000,
      image: "images/clothes1.jpg",
      color: "pink",
      size: ["M", "L", "XL", "XXL"],
      gender: "Male",
      ratings: "7.98",
      description:
          "For formal or casual wear, this shirt is a perfectly tailored choice. Wear this with pant trousers, chino trousers, or denim and be sure to look professional, daring and in charge. Match with a nicely patterned tie for the truly corporate look."),
  ClothesModel(
      name: "3 in 1 Mens Packet Sleeve Shirt",
      id: "02",
      cartbutton: true,
      favbutton: false,
      selectedSize: "M",
      quantity: 0,
      image: "images/clothes2.jpg",
      price: 14999,
      color: "Blue, White, Light Brown",
      size: ["M", "L", "XL", "XXL"],
      gender: "Male",
      ratings: "8.98",
      description:
          "For formal or casual wear, this shirt is a perfectly tailored choice. Wear this with pant trousers, chino trousers, or denim and be sure to look professional, daring and in charge. Match with a nicely patterned tie for the truly corporate look."),
  ClothesModel(
      name: "2 in 1 Mens Packet Sleeve Shirt",
      id: "03",
      cartbutton: true,
      favbutton: false,
      selectedSize: "M",
      quantity: 0,
      price: 12999,
      image: "images/clothes3.jpg",
      color: "Light Blue, Light Pink",
      size: ["M", "L", "XL", "XXL"],
      gender: "Male",
      ratings: "5.98",
      description:
          "For formal or casual wear, this shirt is a perfectly tailored choice. Wear this with pant trousers, chino trousers, or denim and be sure to look professional, daring and in charge. Match with a nicely patterned tie for the truly corporate look."),
  ClothesModel(
      name: "TrackSuit",
      id: "04",
      price: 14999,
      cartbutton: true,
      favbutton: false,
      selectedSize: "M",
      quantity: 0,
      image: "images/tracksuit4.jpg",
      color: "Blue",
      size: ["M", "L", "XL", "XXL", "XXXL"],
      gender: "Male",
      ratings: "5.58",
      description:
          "Whether formally dressed or in casuals, style should never be compromised. Jumia provides you with fashion items and accessories that fit your everyday lifestyle, from the workplace to the bar, all proven durable and of superior quality. Men's sports suit & trouser set Fabric material: Cotton Color: Grey Breathable and comfortable T-shirt & trousers set Style: Sports/casual Hello there! welcome to our shop! The preferential price of quality products is our top priority. From delicate looks to meticulous stitching and cotton-rich materials, these are important things."),
  ClothesModel(
      name: "Arsenal TrackSuit",
      id: "05",
      price: 20999,
      cartbutton: true,
      favbutton: false,
      selectedSize: "M",
      quantity: 0,
      image: "images/tracksuit5.jpg",
      color: "Dark Blue",
      size: ["M", "L", "XL", "XXL", "XXXL"],
      gender: "Male",
      ratings: "9.58",
      description:
          "Whether formally dressed or in casuals, style should never be compromised. Jumia provides you with fashion items and accessories that fit your everyday lifestyle, from the workplace to the bar, all proven durable and of superior quality. Men's sports suit & trouser set Fabric material: Cotton Color: Grey Breathable and comfortable T-shirt & trousers set Style: Sports/casual Hello there! welcome to our shop! The preferential price of quality products is our top priority. From delicate looks to meticulous stitching and cotton-rich materials, these are important things."),
];

List<ClothesModel> shoes = [
  ClothesModel(
    name: "Nike Shoe",
    id: "01",
    cartbutton: true,
    favbutton: false,
    selectedSize: "M",
    quantity: 0,
    image: "images/shoe1.jpg",
    price: 5000,
    color: "Red",
    size: ["32", "33", "34", "35", "36"],
    gender: "Male",
    ratings: "7.98",
    description:
        "We will be glad to hear from you with any positive or negative suggestions to improve our product design and service. We are looking forward to build long business with Africa marketplace and worldwide. And wish you all best and have fun everyday, life is wonderful to each one.",
  ),
  ClothesModel(
    name: "Nike Shoe",
    id: "02",
    cartbutton: true,
    favbutton: false,
    selectedSize: "M",
    quantity: 0,
    image: "images/shoe2.jpg",
    price: 5000,
    color: "White",
    size: ["32", "33", "34", "35", "36"],
    gender: "Male",
    ratings: "6.98",
    description:
        "We will be glad to hear from you with any positive or negative suggestions to improve our product design and service. We are looking forward to build long business with Africa marketplace and worldwide. And wish you all best and have fun everyday, life is wonderful to each one.",
  ),
  ClothesModel(
    name: "Nike Shoe",
    id: "03",
    cartbutton: true,
    favbutton: false,
    selectedSize: "M",
    quantity: 0,
    image: "images/shoe3.jpg",
    price: 5000,
    color: "White and Blue",
    size: ["32", "33", "34", "35", "36"],
    gender: "Male",
    ratings: "9.98",
    description:
        "We will be glad to hear from you with any positive or negative suggestions to improve our product design and service. We are looking forward to build long business with Africa marketplace and worldwide. And wish you all best and have fun everyday, life is wonderful to each one.",
  ),
  ClothesModel(
    name: "Nike Shoe",
    id: "04",
    cartbutton: true,
    favbutton: false,
    selectedSize: "M",
    quantity: 0,
    image: "images/shoe4.jpg",
    price: 5000,
    color: "Black",
    size: ["32", "33", "34", "35", "36"],
    gender: "Male",
    ratings: "7.98",
    description:
        "We will be glad to hear from you with any positive or negative suggestions to improve our product design and service. We are looking forward to build long business with Africa marketplace and worldwide. And wish you all best and have fun everyday, life is wonderful to each one.",
  ),
  ClothesModel(
    name: "Nike Shoe",
    id: "05",
    image: "images/shoe5.jpg",
    selectedSize: "M",
    quantity: 0,
    price: 5000,
    color: "Red and White",
    cartbutton: true,
    favbutton: false,
    size: ["32", "33", "34", "35", "36"],
    gender: "Male",
    ratings: "4.98",
    description:
        "We will be glad to hear from you with any positive or negative suggestions to improve our product design and service. We are looking forward to build long business with Africa marketplace and worldwide. And wish you all best and have fun everyday, life is wonderful to each one.",
  ),
];

List<ClothesModel> watches = [
  ClothesModel(
    name: " Stylish Watch ",
    id: "01",
    selectedSize: "M",
    quantity: 0,
    cartbutton: true,
    favbutton: false,
    image: "images/watch1.jpg",
    price: 5000,
    size: [],
    color: "Silver",
    gender: "Unisex",
    ratings: "7.98",
    description:
        " Package included: 1 x Quartz Watch \n 1 x Manual \n 1 x Gift Box \nSpecification: \nColor: Dark Blue,Gold,Red \nMaterial Type:Glass \nMovement:Quartz \nStyle: Fashion & Dress & CasualFeature:Stop Watch \nGender: Female & Male \nWaterproof: Yes \nWaterproof Depth: 30",
  ),
  ClothesModel(
    name: " Elegant Watch ",
    id: "02",
    image: "images/watch2.jpg",
    size: [],
    selectedSize: "M",
    quantity: 0,
    price: 4990,
    color: "Black",
    gender: "Unisex",
    cartbutton: true,
    favbutton: false,
    ratings: "4.98",
    description:
        " Package included: 1 x Quartz Watch \n 1 x Manual \n 1 x Gift Box \nSpecification: \nColor: Dark Blue,Gold,Red \nMaterial Type:Glass \nMovement:Quartz \nStyle: Fashion & Dress & CasualFeature:Stop Watch \nGender: Female & Male \nWaterproof: Yes \nWaterproof Depth: 30",
  ),
  ClothesModel(
    name: " Stylish Men's Watch ",
    id: "03",
    selectedSize: "M",
    quantity: 0,
    size: [],
    image: "images/watch3.jpg",
    price: 14000,
    cartbutton: true,
    favbutton: false,
    color: "Blueish Purple",
    gender: "Unisex",
    ratings: "9.98",
    description:
        " Package included: 1 x Quartz Watch \n 1 x Manual \n 1 x Gift Box \nSpecification: \nColor: Dark Blue,Gold,Red \nMaterial Type:Glass \nMovement:Quartz \nStyle: Fashion & Dress & CasualFeature:Stop Watch \nGender: Female & Male \nWaterproof: Yes \nWaterproof Depth: 30",
  ),
  ClothesModel(
    name: " Stylish Watch ",
    id: "04",
    image: "images/watch4.jpg",
    selectedSize: "M",
    quantity: 0,
    price: 20000,
    size: [],
    color: "Black",
    gender: "Unisex",
    cartbutton: true,
    favbutton: false,
    ratings: "9.98",
    description:
        " Package included: 1 x Quartz Watch \n 1 x Manual \n 1 x Gift Box \nSpecification: \nColor: Dark Blue,Gold,Red \nMaterial Type:Glass \nMovement:Quartz \nStyle: Fashion & Dress & CasualFeature:Stop Watch \nGender: Female & Male \nWaterproof: Yes \nWaterproof Depth: 30",
  ),
  ClothesModel(
    name: " Stylish Leather Watch ",
    id: "05",
    image: "images/watch5.jpg",
    cartbutton: true,
    favbutton: false,
    selectedSize: "M",
    size: [],
    quantity: 0,
    price: 9999,
    color: "Light Brown",
    gender: "Unisex",
    ratings: "7.98",
    description:
        " Package included: 1 x Quartz Watch \n 1 x Manual \n 1 x Gift Box \nSpecification: \nColor: Dark Blue,Gold,Red \nMaterial Type:Glass \nMovement:Quartz \nStyle: Fashion & Dress & CasualFeature:Stop Watch \nGender: Female & Male \nWaterproof: Yes \nWaterproof Depth: 30",
  ),
];
