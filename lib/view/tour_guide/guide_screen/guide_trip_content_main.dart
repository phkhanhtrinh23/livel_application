import 'package:flutter/material.dart';

import 'components/guide_trip_content.dart';

class GuideTripContent extends StatelessWidget {
  const GuideTripContent({Key key, this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GuideMainContent(id: this.id),
    );
  }
}
