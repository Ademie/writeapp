import 'package:flutter/material.dart';
import 'package:writeapp/theme/colors.dart';
import 'package:writeapp/theme_manager.dart';

class ShowModal extends StatelessWidget {
  const ShowModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                        Icons.delete_outline_rounded),
                    onPressed: () {},
                  ),
                  Text('Delete'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.copy_rounded),
                    onPressed: () {},
                  ),
                  Text('Duplicate'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                  ),
                  Text('Share'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon:
                        Icon(Icons.label_outline_rounded),
                    onPressed: () {},
                  ),
                  Text('Label'),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: TextFormField(
                  style: TextStyle(
                      fontSize: 14,
                      color: themeManager.themeMode ==
                              ThemeMode.dark
                          ? Colors.white
                          : WriteColors.accent),
                  decoration: InputDecoration(
                    hintText:
                        'Sat, 12:05 | 2.451 Characters',
                    border: InputBorder.none,
                    filled: false,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
