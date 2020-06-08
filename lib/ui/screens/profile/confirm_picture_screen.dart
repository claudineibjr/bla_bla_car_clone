import 'dart:io';

import 'package:bla_bla_car_clone/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class ConfirmPictureScreen extends StatefulWidget {
  final String imagePath;

  const ConfirmPictureScreen({
    Key key,
    @required this.imagePath,
  });

  @override
  _ConfirmPictureScreenState createState() => _ConfirmPictureScreenState();
}

class _ConfirmPictureScreenState extends State<ConfirmPictureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Image.file(
              File(widget.imagePath),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeColors.mainColor,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 36,
                      color: ThemeColors.backgroundColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: GestureDetector(
                  onTap: () async {},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeColors.mainColor,
                    ),
                    child: Icon(
                      Icons.done,
                      size: 36,
                      color: ThemeColors.backgroundColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
