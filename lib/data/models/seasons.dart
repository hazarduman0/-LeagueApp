class Season {
  int? year;
  String? startDate;
  String? endDate;
  String? displayName;
  List<Types>? types;

  Season(
      {this.year, this.startDate, this.endDate, this.displayName, this.types});

  Season.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    displayName = json['displayName'];
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add( Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['year'] = year;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['displayName'] = displayName;
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Types {
  String? id;
  String? name;
  String? abbreviation;
  String? startDate;
  String? endDate;
  bool? hasStandings;

  Types(
      {this.id,
      this.name,
      this.abbreviation,
      this.startDate,
      this.endDate,
      this.hasStandings});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abbreviation = json['abbreviation'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    hasStandings = json['hasStandings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['abbreviation'] = this.abbreviation;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['hasStandings'] = this.hasStandings;
    return data;
  }
}