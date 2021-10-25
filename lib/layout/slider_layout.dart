import 'package:ar/utility/color.dart';
import 'package:flutter/material.dart';

class SlideLayout extends StatefulWidget {
  final img;
  final title;
  final subtitle;
  const SlideLayout({Key? key, this.img, @required this.title, this.subtitle})
      : super(key: key);

  @override
  _SlideLayoutState createState() => _SlideLayoutState();
}

class _SlideLayoutState extends State<SlideLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 275,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(32)),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image(
                  width: 275,
                  height: 200,
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.img)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 16),
          child: Text(
            widget.title,
            style: TextStyle(
                color: secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Text(
            widget.subtitle,
            style: TextStyle(color: Colors.grey[500], fontSize: 16),
          ),
        )
      ],
    );
  }
}
