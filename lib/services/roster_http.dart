import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:minorhockey_scheduler/models/roster_model.dart';
import 'package:minorhockey_scheduler/models/schedule_model.dart';
import 'package:minorhockey_scheduler/models/score_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RosterRepository {
  static final String _baseUrl = '${dotenv.env['URL']}';
  static final String _header = '${dotenv.env['HEADER']}';
  final http.Client _client;

  RosterRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<RosterModel>> getPlayers(String division) async {
    try {
      final response = await _client.post(
        Uri.parse(_baseUrl),
        headers: {
          HttpHeaders.authorizationHeader: _header,
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: json.encode({
          "operation": "sql",
          "sql": "SELECT * FROM roster.$division" "roster order by jersey ASC"
        }),
      );

      if (response.statusCode == 200) {
        // return List<RosterModel>.from(json.decode(response.body));
        return (jsonDecode(response.body) as List)
            .map((e) => RosterModel.fromJson(e))
            .toList();
      } else {
        throw Error();
      }
    } catch (_) {
      throw Error();
    }
  }

  Future<List<ScheduleModel>> getGames(String division) async {
    try {
      final response = await _client.post(
        Uri.parse(_baseUrl),
        headers: {
          HttpHeaders.authorizationHeader: _header,
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: json.encode({
          "operation": "sql",
          "sql":
              "SELECT * FROM schedule.$division" "schedule ORDER BY date DESC"
        }),
      );

      if (response.statusCode == 200) {
        // return List<RosterModel>.from(json.decode(response.body));
        return (jsonDecode(response.body) as List)
            .map((e) => ScheduleModel.fromJson(e))
            .toList();
      } else {
        throw Error();
      }
    } catch (_) {
      throw Error();
    }
  }

  Future<List<ScoreModel>> getScores(String division) async {
    try {
      final response = await _client.post(
        Uri.parse(_baseUrl),
        headers: {
          HttpHeaders.authorizationHeader: _header,
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: json.encode({
          "operation": "sql",
          "sql":
              "SELECT * FROM scores.scores WHERE division = '$division' ORDER BY date DESC"
        }),
      );

      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List)
            .map((e) => ScoreModel.fromJson(e))
            .toList();
      } else {
        throw Error();
      }
    } catch (_) {
      throw Error();
    }
  }
}
