import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../data/food_data.dart';

Map<int, String> mealIndex = {
  1: "Breakfast",
  2: "Lunch",
  3: "Snacks",
  4: "Dinner",
};

Map<int, String> weekdayIndex = {
  1: "Monday",
  2: "Tuesday",
  3: "Wednesday",
  4: "Thursday",
  5: "Friday",
  6: "Saturday",
  7: "Sunday",
};

class ViewMenu extends StatelessWidget {
  List<FoodItem> items = foodItems;
  ViewMenu() {
    items.removeWhere((element) {
      if (element.weekDay != DateTime.now().weekday) {
        return true;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Column(
          children: [
            Text(
              "Today's Menu",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 26,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return makeItem(items[index], size);
                },
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget makeItem(FoodItem item, var size) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: size.height * 0.45,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.43,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(item.url),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                height: size.height * 0.1,
                width: size.width * 0.75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                child: Text(
                  " ${item.itemName as String} (${mealIndex[item.meal]})",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
