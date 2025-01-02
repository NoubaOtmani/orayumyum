import 'package:orayemem/models/categories.dart';
import 'package:orayemem/models/products.dart';
import 'package:orayemem/models/restuarnts.dart';

List<Map<String, dynamic>> cart = [];

List<Map<String, dynamic>> mostPopular = [
  {
    "food_name": "Chicken Shawarma",
    "cover": "img",
    "profile": "hamburger_1f354",
    "prix": 250,
    "deliver_time": 25,
    "category": "Sandwich"
  },
  {
    "food_name": "Chicken Shawarma",
    "cover": "img",
    "profile": "hamburger_1f354",
    "prix": 250,
    "deliver_time": 25,
    "category": "Sandwich"
  },
  {
    "food_name": "Chicken Shawarma",
    "cover": "img",
    "profile": "hamburger_1f354",
    "prix": 250,
    "deliver_time": 25,
    "category": "Sandwich"
  },
  {
    "food_name": "Chicken Shawarma",
    "cover": "img",
    "profile": "hamburger_1f354",
    "prix": 250,
    "deliver_time": 25,
    "category": "Sandwich"
  },
  {
    "food_name": "Chicken Shawarma",
    "cover": "img",
    "profile": "hamburger_1f354",
    "prix": 250,
    "deliver_time": 25,
    "category": "Sandwich"
  },
  {
    "food_name": "Chicken Shawarma",
    "cover": "img",
    "profile": "hamburger_1f354",
    "prix": 250,
    "deliver_time": 25,
    "category": "Sandwich"
  },
  {
    "food_name": "Chicken Shawarma",
    "cover": "img",
    "profile": "hamburger_1f354",
    "prix": 250,
    "deliver_time": 25,
    "category": "Sandwich"
  },
  {
    "food_name": "Chicken Shawarma",
    "cover": "img",
    "profile": "hamburger_1f354",
    "prix": 250,
    "deliver_time": 25,
    "category": "Sandwich"
  },
  {
    "food_name": "Chicken Shawarma",
    "cover": "img",
    "profile": "hamburger_1f354",
    "prix": 250,
    "deliver_time": 25,
    "category": "Sandwich"
  },
];

List<Categories> catgories = [
  Categories(name: "Burger", id: 0, icon: "hamburger_1f354", isSelected: false),
  Categories(name: "Pizza", id: 1, icon: "pizza_1f355", isSelected: false),
  Categories(name: "Noodls", id: 2, icon: "spaghetti_1f35d", isSelected: false),
  Categories(
      name: "Salade", id: 3, icon: "green-salad_1f957", isSelected: false),
  Categories(
      name: "Meat", id: 4, icon: "meat-on-bone_1f356", isSelected: false),
  Categories(
      name: "Croissant", id: 5, icon: "croissant_1f950", isSelected: false),
  Categories(
      name: "Drink", id: 6, icon: "tropical-drink_1f379", isSelected: false),
  Categories(
      name: "Dessert", id: 7, icon: "shortcake_1f370", isSelected: false),
];
List<Map<String, dynamic>> ingredients = [
  {"name": "Tomato", "src": "tomato_1f345", "isSelected": false},
  {"name": "Onion", "src": "onion_1f9c5", "isSelected": false},
  {"name": "Hot", "src": "hot-pepper_1f336-fe0f", "isSelected": false},
  {"name": "Garlic", "src": "garlic_1f9c4", "isSelected": false},
  {"name": "Corn", "src": "ear-of-corn_1f33d", "isSelected": false},
  {"name": "Egg", "src": "egg_1f95a", "isSelected": false},
];
List<Map<String, dynamic>> recentSearch = [
  {
    "name": "Sandwich",
  },
  {
    "name": "Taco",
  },
  {
    "name": "Pizza",
  },
  {
    "name": "Drink",
  },
  {
    "name": "Dessert",
  },
  {
    "name": "Paincake",
  },
];

List<Restuarnt> restuarnts = [
  Restuarnt(
      restuarnt_name: "O'Tacos Dz",
      food_name: "",
      address: " 2 Chem. Sidi Yahia, Hydra , Alger ",
      overview:
          "Shreds of full fat Mozzarella cheese usually melt, fuse, and form light brown blisters, but fat-free or lower fat Mozzarella cheese shreds have l.. Read More",
      menu: [0, 2, 1, 3],
      rating: 4.2,
      deliver_time: 125,
      restuarnt_options: [0, 1],
      location: {
        "longitude": 3.0101636813587866,
        "latitude": 36.77367327426475,
      },
      cover:
          "https://media-cdn.tripadvisor.com/media/photo-s/16/85/b9/49/o-tacos.jpg",
      profile:
          "https://i0.wp.com/www.visa-algerie.com/wp-content/uploads/2020/07/Otacos.jpg?w=568"),
  Restuarnt(
      restuarnt_name: "Le Cartel Sandwicherie",
      food_name: "",
      address: "28010 Rue Mouhamed Boudiaf, Berho...",
      overview:
          "Shreds of full fat Mozzarella cheese usually melt, fuse, and form light brown blisters, but fat-free or lower fat Mozzarella cheese shreds have l.. Read More",
      menu: [0, 1, 2, 3, 4],
      rating: 5.0,
      deliver_time: 125,
      restuarnt_options: [
        0,
      ],
      location: {
        "longitude": 3.0380051390295315,
        "latitude": 36.7398464302715,
      },
      cover:
          "https://lh5.googleusercontent.com/p/AF1QipPuCmOwZMcLyTvFkSWK-KVeYUtkqp4NQ2sqnbDF=w740-h420-k-no",
      profile:
          "https://i1.sndcdn.com/avatars-000648892797-ituahv-t500x500.jpg"),
  Restuarnt(
      restuarnt_name: "EL PADRE",
      food_name: "",
      address: "28010 Rue Mouhamed Boudiaf, Berho...",
      overview:
          "Shreds of full fat Mozzarella cheese usually melt, fuse, and form light brown blisters, but fat-free or lower fat Mozzarella cheese shreds have l.. Read More",
      menu: [
        0,
        1,
        2,
      ],
      restuarnt_options: [0, 1],
      rating: 5.0,
      deliver_time: 125,
      location: {
        "longitude": 3.036015612045536,
        "latitude": 36.7374742268272,
      },
      cover: "https://i.ytimg.com/vi/YIcRvZaqzZo/maxresdefault.jpg",
      profile:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlk4oNwa7YRo9hzCaxIWShtmV28ZXPzmaR5Sd3ohFvPbVb2QD7KhMVNFWzesS9I9H1XV0&usqp=CAU"),
];

List<Proudcts> products = [
  Proudcts(
      food_name: "Chicken Shawarma",
      image:
          "https://www.recipetineats.com/wp-content/uploads/2022/02/Chicken-Shawarma-Wrap_2-SQ.jpg",
      desc: "",
      profile:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnfQj3HdRCYejwgbzpUrQb3bZWkGH_rVi1yw&usqp=CAU",
      rating: 4.7,
      prix: 300,
      restuarnt_name: "Chicken",
      deliver_time: 25),
  Proudcts(
      food_name: "Salade Cesar",
      image:
          "https://static.toiimg.com/thumb/84784534.cms?width=1200&height=900",
      desc: "",
      profile:
          "https://www.galbani.fr/wp-content/uploads/2020/04/AdobeStock_157570276-2-1440x500.jpeg",
      rating: 4.8,
      prix: 700,
      restuarnt_name: "Salade",
      deliver_time: 15),
  Proudcts(
      food_name: "Penne Pasta",
      image:
          "https://static.toiimg.com/thumb/84784534.cms?width=1200&height=900",
      desc: "",
      profile:
          "https://5.imimg.com/data5/SELLER/Default/2022/1/UU/VQ/NG/38534435/raw-penne-italian-pasta.jpeg",
      rating: 3.8,
      prix: 350,
      restuarnt_name: "Penne",
      deliver_time: 35),
  Proudcts(
      food_name: "Beef Burger Meat",
      image:
          "https://realfood.tesco.com/media/images/Burger-31LGH-a296a356-020c-4969-86e8-d8c26139f83f-0-1400x919.jpg",
      desc: "",
      profile:
          "https://img.restaurantguru.com/w312/h280/r997-The-Burger-House-facade.jpg",
      rating: 4.7,
      prix: 400,
      restuarnt_name: "Burger",
      deliver_time: 30),
  Proudcts(
      food_name: "Rolled Paincake",
      image:
          "https://realfood.tesco.com/media/images/Burger-31LGH-a296a356-020c-4969-86e8-d8c26139f83f-0-1400x919.jpg",
      desc: "",
      profile:
          "https://gringajourneys.com/wp-content/uploads/2023/08/best-pancake-restaurant-amsterdam.jpg",
      rating: 4.8,
      prix: 350,
      restuarnt_name: "Rolled",
      deliver_time: 35),
  Proudcts(
      food_name: "Mixed Pizza",
      image:
          "https://as2.ftcdn.net/v2/jpg/00/90/17/01/1000_F_90170131_BEmN6kICBXpsDoqhmHDL9n4XV6uWpQMr.jpg",
      desc: "",
      profile: "https://media.auchan.fr/P02000000000MZCPRIMARY_1500x1500/B2CD/",
      rating: 4.1,
      prix: 450,
      restuarnt_name: "Mixed Pizza",
      deliver_time: 30),
];

/*{
    "food_name": "Chicken Shawarma",
    "cover": "img",
    "profile": "hamburger_1f354",
    "prix": 250,
    "deliver_time": 25,
    "category": "Sandwich",
    "address": "28010 Rue Mouhamed Boudiaf, Berho...",
    "work_time": [{}],
    "overview":
        "Shreds of full fat Mozzarella cheese usually melt, fuse, and form light brown blisters, but fat-free or lower fat Mozzarella cheese shreds have l.. Read More",
    "rating": 4.4,
    "menu": [0, 1, 2, 3, 4, 5, 6],
  },*/
