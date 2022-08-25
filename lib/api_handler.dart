import 'dart:convert';
import 'dart:io';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import 'package:pplayer/models/podcast.dart';

class ApiHandler {
  final _apiUrl = 'https://api.podcastindex.org/api/1.0/';
  final _apiKey = '36GMP74RAES9DADSXU4C';
  final _apiSecret = 'UVhbFC^euchFa\$GxSmgdGNJr3Leu36YvbLZfwn8D';

  Future<List<Podcast>> getTrendingPodcasts({int max = 10}) async {
    String url = '$_apiUrl/podcasts/trending?$max';
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
