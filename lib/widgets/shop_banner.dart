import 'package:flutter/material.dart';
import 'package:purple_toko/widgets/positioned_card.dart';

import '../models/shop.dart';

class ShopBanner extends StatelessWidget {
  const ShopBanner({
    Key? key,
    required this.currentShop,
  }) : super(key: key);

  final Shop currentShop;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Image.network(
            currentShop.shop.getImageUrl(),
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
        PositionedCard(
          top: 10,
          right: 10,
          color: Colors.amberAccent,
          child: Text(
            "${currentShop.offers} Offer",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
        PositionedCard(
          bottom: 10,
          right: 10,
          color: Colors.green,
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.white,
                size: 12,
              ),
              Text(
                "${currentShop.ratings}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        )
      ],
    );
  }
}
