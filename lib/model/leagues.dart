class League {
  String? id;
  String? name;
  String? slug;
  String? abbr;
  Logos? logos;

  League({id, name, slug, abbr, logos});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    abbr = json['abbr'];
    logos = json['logos'] != null ?  Logos.fromJson(json['logos']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['abbr'] = abbr;
    if (logos != null) {
      data['logos'] = logos!.toJson();
    }
    return data;
  }
}

class Logos {
  String? light;
  String? dark;

  Logos({this.light, this.dark});

  Logos.fromJson(Map<String, dynamic> json) {
    light = json['light'];
    dark = json['dark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['light'] = light;
    data['dark'] = dark;
    return data;
  }
}