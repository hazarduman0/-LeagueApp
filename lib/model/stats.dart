// class Stat {
//   String? name;
//   String? displayName;
//   String? shortDisplayName;
//   String? description;
//   String? abbreviation;
//   String? type;
//   int? value;
//   String? displayValue;

//   Stat(
//       {this.name,
//       this.displayName,
//       this.shortDisplayName,
//       this.description,
//       this.abbreviation,
//       this.type,
//       this.value,
//       this.displayValue});

//   Stat.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     displayName = json['displayName'];
//     shortDisplayName = json['shortDisplayName'];
//     description = json['description'];
//     abbreviation = json['abbreviation'];
//     type = json['type'];
//     value = json['value'];
//     displayValue = json['displayValue'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['name'] = name;
//     data['displayName'] = displayName;
//     data['shortDisplayName'] = shortDisplayName;
//     data['description'] = description;
//     data['abbreviation'] = abbreviation;
//     data['type'] = type;
//     data['value'] = value;
//     data['displayValue'] = displayValue;
//     return data;
//   }
// }
