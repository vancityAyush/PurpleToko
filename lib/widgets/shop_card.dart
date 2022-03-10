import 'package:flutter/material.dart';
import 'package:purple_toko/constants.dart';
import 'package:purple_toko/models/shop.dart';
import 'package:purple_toko/widgets/shop_banner.dart';

class ResuableShopCard extends StatelessWidget {
  const ResuableShopCard({
    Key? key,
    required this.currentShop,
  }) : super(key: key);

  final Shop currentShop;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShopBanner(currentShop: currentShop),
          Padding(
            padding: kPadding,
            child: Text(
              currentShop.shop.shop_name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: 200,
            padding: kPadding,
            child: Text(
              currentShop.shop.description,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                // fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
