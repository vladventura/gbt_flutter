const Map genshin = <String, dynamic>{
  "name": "Genshin Impact",
  "cover_art_url":
      "https://giantbomb1.cbsistatic.com/uploads/scale_medium/45/459166/3245697-genshin.jpg",
  "current_hours": 60,
  "hltb_hours": 2000,
  "consoles": <String>["PS4", "PC", "Android", "iOS"]
};

const Map sfv = <String, dynamic>{
  "name": "Street Fighter V",
  "cover_art_url":
      "http://tesco.scene7.com/is/image/tesco/158-1707_PI_1000351MN?wid=493&ht=538",
  "current_hours": 92,
  "hltb_hours": 120,
  "consoles": <String>[
    "PS4",
    "PC",
  ]
};

List allGames = [genshin, sfv, genshin, genshin, genshin];
