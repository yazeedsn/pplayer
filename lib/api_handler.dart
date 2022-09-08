import 'dart:convert';
import 'dart:io';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:pplayer/models/eposide.dart';
import 'package:pplayer/models/podcast.dart';

class ApiHandler {
  final _apiUrl = 'https://api.podcastindex.org/api/1.0';
  final _apiKey = '36GMP74RAES9DADSXU4C';
  final _apiSecret = 'UVhbFC^euchFa\$GxSmgdGNJr3Leu36YvbLZfwn8D';

  Future<List<String>> getCats() async {
    String url = '$_apiUrl/categories/list?pretty';
    var data = await _fetchJson(url);
    var feeds = data['feeds'];
    int count = data['count'];

    List<String> cats = <String>[];
    for (int i = 0; i < count; i++) {
      cats.add(feeds[i]['name']);
    }
    return cats;
  }

  Future<List<Podcast>> getTrendingPodcasts({int max = 10, String? cat}) async {
    String url = '$_apiUrl/podcasts/trending?max=$max';
    if (cat != null) {
      url = '$url&cat=$cat';
    }
    var data = await _fetchJson(url);
    int count = data['count'];
    if (max < count) {
      count = max;
    }

    var feeds = data['feeds'];
    var podcasts = <Podcast>[];
    for (int i = 0; i < count; i++) {
      podcasts.add(Podcast.fromJson(feeds[i]));
    }
    return podcasts;
  }

  Future<List<Eposide>> getRandomPodcasts({int max = 10}) async {
    String url = '$_apiUrl/episodes/random?max=$max&pretty';
    var data = await _fetchJson(url);
    int count = data['count'];
    if (max < count) {
      count = max;
    }
    var feeds = data['episodes'];
    var eposides = <Eposide>[];
    for (int i = 0; i < count; i++) {
      eposides.add(Eposide.fromJson(feeds[i]));
    }
    return eposides;
  }

  Future<Eposide> getEposide(int podcastId) async {
    String url = '$_apiUrl/episodes/byfeedid?id=$podcastId&pretty';
    var data = await _fetchJson(url);
    var items = data['items'];
    var eposide = items[0];
    return Eposide(
      title: eposide['title'],
      enclosuerUrl: eposide['enclosureUrl'],
      image: eposide['image'],
    );
  }

  Future<dynamic> _fetchJson(String url) async {
    final headers = _encodeHeaders();
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ('Failed to fetch a vaild response.');
    }
  }

  Map<String, String> _encodeHeaders() {
    var apiHeaderTime =
        (DateTime.now().millisecondsSinceEpoch / 1000).round().toString();

    var firstChunk = utf8.encode(_apiKey);
    var secondChunk = utf8.encode(_apiSecret);
    var thiredChunk = utf8.encode(apiHeaderTime);

    var output = AccumulatorSink<Digest>();
    var input = sha1.startChunkedConversion(output);
    input.add(firstChunk);
    input.add(secondChunk);
    input.add(thiredChunk);
    input.close();

    var digest = output.events.single;
    var client = HttpClient();

    Map<String, String> headers = {
      "X-Auth-Date": apiHeaderTime,
      "X-Auth-Key": _apiKey,
      "Authorization": digest.toString(),
      "User-Agent": client.userAgent ?? 'Mozilla/5.0',
    };

    return headers;
  }
}
