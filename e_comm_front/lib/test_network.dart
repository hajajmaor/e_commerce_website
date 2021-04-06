import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// ignore: public_member_api_docs
class TestNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () async {
                final Uri _url = Uri(host: "localhost", port: 5000);
                final http.Response result = await http.get(_url);
                // ignore: avoid_print
                print('localhost:${result.body}');
              },
              child: Text(
                'test localhost:5000',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const Divider(
              height: 30,
            ),
            TextButton(
              onPressed: () async {
                final Uri _url = Uri(host: "backend", port: 5000);
                final http.Response result = await http.get(_url);
                // ignore: avoid_print
                print('backend:${result.body}');
              },
              child: Text(
                'test backend:5000',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
