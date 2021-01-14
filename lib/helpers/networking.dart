import 'dart:convert';

import 'package:http/http.dart' as http;

getDataFromInternet(String name) async {
  final url = 'https://abis-r6-api.vercel.app/api/v1/$name';
  var response = await http.get(url);
  var decodedData = jsonDecode(response.body);
  //player name
  //plInfo
  // String plName = (decodedData['plInfo']['plName']).toString();
  // String plRankedKd = (decodedData['plInfo']['plRankedKd']).toString();
  // String plRankedDeaths = (decodedData['plInfo']['plRankedDeaths']).toString();
  // String plRankedKills = (decodedData['plInfo']['plRankedKills']).toString();
  // String plRankedMatches =
  //     (decodedData['plInfo']['plRankedMatches']).toString();
  // String plRankedWins = (decodedData['plInfo']['plRankedWins']).toString();
  // String plRankedLosses = (decodedData['plInfo']['plRankedLosses']).toString();
  // String plRankText = (decodedData['plInfo']['plRankText']).toString();
  // String plThisSeasonRankedMmr =
  //     (decodedData['plInfo']['plThisSeasonRankedMmr']).toString();
  // String plThisSeasonRankedKd =
  //     (decodedData['plInfo']['plThisSeasonRankedKd']).toString();
  // String plProfilePic = (decodedData['plInfo']['plProfilePic']).toString();
  // String plRankPic = (decodedData['plInfo']['plRankPic']).toString();
  // //
  // //plDetailedInfo
  // String plTotalPlayTime =
  //     (decodedData['plDetailedInfo']['plTotalPlayTime']).toString();
  // String plTotalMatchesPlayed =
  //     (decodedData['plDetailedInfo']['plTotalMatchesPlayed']).toString();
  // String plTotalWins =
  //     (decodedData['plDetailedInfo']['plTotalWins']).toString();
  // String plTotalLosses =
  //     (decodedData['plDetailedInfo']['plTotalLosses']).toString();
  // String plTotalKills =
  //     (decodedData['plDetailedInfo']['plTotalKills']).toString();
  // String plTotalDeaths =
  //     (decodedData['plDetailedInfo']['plTotalDeaths']).toString();
  // String plTotalKD = (decodedData['plDetailedInfo']['plTotalKD']).toString();
  // String plRankedPlayTime =
  //     (decodedData['plDetailedInfo']['plRankedPlayTime']).toString();
  // String plCasualPlayTime =
  //     (decodedData['plDetailedInfo']['plCasualPlayTime']).toString();
  // String plTotalKillAssists =
  //     (decodedData['plDetailedInfo']['plTotalKillAssists']).toString();
  // String plTotalRevives =
  //     (decodedData['plDetailedInfo']['plTotalRevives']).toString();

  // Map<String, String> plDetailedInfo = {
  //   "plTotalPlayTime": plTotalPlayTime,
  //   "plTotalMatchesPlayed": plTotalMatchesPlayed,
  //   "plTotalWins": plTotalWins,
  //   "plTotalLosses": plTotalLosses,
  //   "plTotalKills": plTotalKills,
  //   "plTotalDeaths": plTotalDeaths,
  //   "plTotalKD": plTotalKD,
  //   "plRankedPlayTime": plRankedPlayTime,
  //   "plCasualPlayTime": plCasualPlayTime,
  //   "plTotalKillAssists": plTotalKillAssists,
  //   "plTotalRevives": plTotalRevives,
  // };

  // print(response.statusCode);

  // Map<String, String> plInfo = {
  //   "plName": plName,
  //   "plRankedKd": plRankedKd,
  //   "plRankedDeaths": plRankedDeaths,
  //   "plRankedKills": plRankedKills,
  //   "plRankedMatches": plRankedMatches,
  //   "plRankedWins": plRankedWins,
  //   "plRankedLosses": plRankedLosses,
  //   "plRankText": plRankText,
  //   "plThisSeasonRankedMmr": plThisSeasonRankedMmr,
  //   "plThisSeasonRankedKd": plThisSeasonRankedKd,
  //   "plProfilePic": plProfilePic,
  //   "plRankPic": plRankPic,
  //   "plTotalPlayTime": plTotalPlayTime,
  //   "plTotalMatchesPlayed": plTotalMatchesPlayed,
  //   "plTotalWins": plTotalWins,
  //   "plTotalLosses": plTotalLosses,
  //   "plTotalKills": plTotalKills,
  //   "plTotalDeaths": plTotalDeaths,
  //   "plTotalKD": plTotalKD,
  //   "plRankedPlayTime": plRankedPlayTime,
  //   "plCasualPlayTime": plCasualPlayTime,
  //   "plTotalKillAssists": plTotalKillAssists,
  //   "plTotalRevives": plTotalRevives,
  // };
  // print(plInfo);

  return decodedData;
}

// void main() async {
//   getData("urstruly...");
// }
