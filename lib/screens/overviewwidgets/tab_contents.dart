import 'package:flutter/material.dart';
import 'package:writeapp/theme/colors.dart';

class TabContents extends StatelessWidget {
  const TabContents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
            itemCount: 30,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (_, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: WriteColors.primary

                ),
                height: 300,
                
              );
            }));
  }
}
