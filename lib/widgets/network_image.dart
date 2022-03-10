import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class myNetworkImage extends StatelessWidget {
  final String url;
  const myNetworkImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: 300,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const Center(
        child: Text("Image is loading..."),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
