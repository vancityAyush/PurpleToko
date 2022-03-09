import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:purple_toko/providers/home_screen_provider.dart';

import '../models/data.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeScreenProvider provider = HomeScreenProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: provider.loadData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return CircularProgressIndicator(
                color: Colors.blue,
              );
            List<Market> data = provider.data;
            String imgUrl = data[5].markets.getImageUrl();
            return CachedNetworkImage(
              imageUrl: imgUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
          },
        ),
      ),
    );
  }
}
