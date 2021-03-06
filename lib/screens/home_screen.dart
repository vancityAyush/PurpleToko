import 'package:flutter/material.dart';
import 'package:purple_toko/models/data.dart';
import 'package:purple_toko/providers/home_screen_provider.dart';
import 'package:purple_toko/widgets/network_image.dart';

import '../constants.dart';
import '../widgets/market_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeScreenProvider provider = HomeScreenProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.qr_code_scanner,
          color: kColor,
        ),
        title: IconButton(
          icon: Hero(
            tag: "LOGO",
            child: logo,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        actions: [
          const Icon(
            Icons.shopping_bag,
            color: kColor,
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: kColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: provider.loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Market> data = provider.data;
              String imgUrl = data[5].markets.getImageUrl();
              return Column(
                children: [
                  const Card(
                    child: ListTile(
                        leading: Icon(
                          Icons.location_pin,
                          color: kColor,
                          size: 35,
                        ),
                        title: Text(
                          "Home",
                        ),
                        subtitle: Text(
                          "Gurudware Nanaksar, Gurdwara Ln, Block 1, Old Rajinder Nagar, Rajinder Nagar, New Delhi, Delhi 110060, India",
                        )),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const ListTile(
                                  leading: Text(
                                    "Your Rewards",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  trailing: Text("See all"),
                                ),
                                Container(
                                  height: 200,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        myNetworkImage(
                                      url: data[index].markets.getImageUrl(),
                                    ),
                                    itemCount: data.length,
                                  ),
                                ),
                                for (Market market in data)
                                  ResuableMarketCard(market: market)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  // for (Market item in data)
                ],
              );
            }
            return const CircularProgressIndicator(
              color: Colors.blue,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        selectedItemColor: kColor,
      ),
    );
  }
}
