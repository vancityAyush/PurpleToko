import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purple_toko/models/data.dart';
import 'package:purple_toko/widgets/shop_card.dart';

import '../models/shop.dart';

class ResuableMarketCard extends StatelessWidget {
  const ResuableMarketCard({Key? key, required this.market}) : super(key: key);
  final Market market;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("Best Shops in ${market.markets.name}"),
          trailing: Text("See all"),
        ),
        Container(
          height: 340,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Shop currentShop = market.shops[index];
              return ResuableShopCard(currentShop: currentShop);
            },
            itemCount: market.shops.length,
          ),
        )
      ],
    );
  }
}
