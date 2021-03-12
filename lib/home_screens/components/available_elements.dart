import 'package:flutter/material.dart';
import 'package:livel_application/home_screens/components/trip_content/trip_main.dart';

class AvailableElement extends StatelessWidget {
  const AvailableElement({
    Key key,
    this.country,
    this.place,
    this.image,
    this.day,
    this.cost,
  }) : super(key: key);

  final String country, place, image, day;
  final int cost;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 4.0,
        bottom: 16.0,
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => TripContent(),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              width: 229,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                width: 52,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.orange[800],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                child: Text(
                  '\$$cost',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 5,
                right: 6,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF5197E1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              width: 229,
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$place',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '$country',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    '$day',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
