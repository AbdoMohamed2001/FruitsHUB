import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class FavouritePrefs {
  // static const kFavProductIds = 'favourite_product_ids';

  static Future<void> removeFavourite(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    final favourites = prefs.getStringList(kFavProductIds) ?? [];
    favourites.remove(productId);
    await prefs.setStringList(kFavProductIds, favourites);
  }

  static Future<bool> isFavourite(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    final favourites = prefs.getStringList(kFavProductIds) ?? [];
    return favourites.contains(productId);
  }

  static Future<List<String>> getFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(kFavProductIds) ?? [];
  }
}
