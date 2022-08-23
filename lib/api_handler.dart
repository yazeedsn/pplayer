import 'dart:convert';
import 'dart:io';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final _apiUrl = 'https://api.podcastindex.org/api/1.0/';
  final _apiKey = '36GMP74RAES9DADSXU4C';
  final _apiSecret = 'UVhbFC^euchFa\$GxSmgdGNJr3Leu36YvbLZfwn8D';

  Future<Podcast> getTrendingPodcasts({int max = 10}) async {
    String url = '$_apiUrl/podcasts/trending?$max';
    var podcast = await _fetchJson(url);
    return podcast;
  }

  Future<Podcast> _fetchJson(String url) async {
    final headers = _encodeHeaders();
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return Podcast.fromJson(json.decode(response.body));
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

class Podcast {
  final String? title;
  final String? author;
  final String? image;

  Podcast({
    this.title,
    this.author,
    this.image,
  });

  factory Podcast.fromJson(Map<String, dynamic> json) {
    var data = json['feeds'][0];

    return Podcast(
      title: data['title'],
      author: data['author'],
      image: data['image'],
    );
  }
}
