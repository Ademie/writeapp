import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:writeapp/theme/colors.dart';

class TabNotes extends StatelessWidget {
  const TabNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: StaggeredGridView.countBuilder(
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index.isEven ? 3 : 2.5),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 4,
        itemCount: 50,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: index == 0
                  ? WriteColors.primary
                  : WriteColors.accent.shade200),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
            style: TextStyle(height: 1.8),
          ),
        ),
      ),
    );
  }
}
