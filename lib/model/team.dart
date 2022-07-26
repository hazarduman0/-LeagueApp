// class Team {
//   String? id;
//   String? uid;
//   String? location;
//   String? name;
//   String? abbreviation;
//   String? displayName;
//   String? shortDisplayName;
//   bool? isActive;
//   List<Logos>? logos;

//   Team(
//       {this.id,
//       this.uid,
//       this.location,
//       this.name,
//       this.abbreviation,
//       this.displayName,
//       this.shortDisplayName,
//       this.isActive,
//       this.logos});

//   Team.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     uid = json['uid'];
//     location = json['location'];
//     name = json['name'];
//     abbreviation = json['abbreviation'];
//     displayName = json['displayName'];
//     shortDisplayName = json['shortDisplayName'];
//     isActive = json['isActive'];
//     if (json['logos'] != null) {
//       logos = <Logos>[];
//       json['logos'].forEach((v) {
//         logos!.add(Logos.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = id;
//     data['uid'] = uid;
//     data['location'] = location;
//     data['name'] = name;
//     data['abbreviation'] = abbreviation;
//     data['displayName'] = displayName;
//     data['shortDisplayName'] = shortDisplayName;
//     data['isActive'] = isActive;
//     if (logos != null) {
//       data['logos'] = logos!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Logos {
//   String? href;
//   int? width;
//   int? height;
//   String? alt;
//   List<String>? rel;
//   String? lastUpdated;

//   Logos(
//       {this.href,
//       this.width,
//       this.height,
//       this.alt,
//       this.rel,
//       this.lastUpdated});

//   Logos.fromJson(Map<String, dynamic> json) {
//     href = json['href'];
//     width = json['width'];
//     height = json['height'];
//     alt = json['alt'];
//     rel = json['rel'].cast<String>();
//     lastUpdated = json['lastUpdated'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['href'] = href;
//     data['width'] = width;
//     data['height'] = height;
//     data['alt'] = alt;
//     data['rel'] = rel;
//     data['lastUpdated'] = lastUpdated;
//     return data;
//   }
// }
