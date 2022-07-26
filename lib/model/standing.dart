// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:lig_aplication/model/stats.dart';
// import 'package:lig_aplication/model/team.dart';

// class Standing {
//   Team team;
//   Stat stats;
//   Standing({
//     required this.team,
//     required this.stats,
//   });

//   Standing copyWith({
//     Team? team,
//     Stat? stats,
//   }) {
//     return Standing(
//       team: team ?? this.team,
//       stats: stats ?? this.stats,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'team': team.toJson(),
//       'stats': stats.toJson(),
//     };
//   }

//   factory Standing.fromMap(Map<String, dynamic> map) {
//     return Standing(
//       team: Team.fromJson(map['team'] as Map<String,dynamic>),
//       stats: Stat.fromJson(map['stats'] as Map<String,dynamic>),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Standing.fromJson(String source) => Standing.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'Standing(team: $team, stats: $stats)';

//   @override
//   bool operator ==(covariant Standing other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.team == team &&
//       other.stats == stats;
//   }

//   @override
//   int get hashCode => team.hashCode ^ stats.hashCode;
// }
