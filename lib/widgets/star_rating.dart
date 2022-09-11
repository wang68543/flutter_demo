import 'package:flutter/material.dart';

class WStarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;
  final Widget selectedImage;
  final Widget unselectedImage;

  WStarRating(
      {super.key,
      required this.rating,
      this.maxRating = 10,
      this.count = 5,
      this.size = 30,
      this.unselectedColor = const Color(0xffbbbbbb),
      this.selectedColor = const Color(0xffbb0000),
      Widget? selectedImage,
      Widget? unselectedImage})
      : unselectedImage = unselectedImage ??
            Icon(
              Icons.star_border,
              color: unselectedColor,
              size: size,
            ),
        selectedImage = selectedImage ??
            Icon(
              Icons.star,
              color: selectedColor,
              size: size,
            );

  @override
  // ignore: library_private_types_in_public_api
  _WStarRatingState createState() => _WStarRatingState();
}

class _WStarRatingState extends State<WStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnselectedStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectedStar(),
        )
      ],
    );
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(
        widget.count,
        (index) => Icon(
              Icons.star,
              color: widget.unselectedColor,
              size: widget.size,
            ));
  }

  List<Widget> buildSelectedStar() {
    List<Widget> stars = [];
    final star = Icon(
      Icons.star,
      color: widget.selectedColor,
      size: widget.size,
    );

    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    // final halfStar = ClipRect(
    //   clipper: WStarClipper(leftWidth),
    //   child: star,
    // );
    double widthFactor = widget.rating / widget.maxRating -
        (widget.rating / widget.maxRating).floor();
    print("factor===$widthFactor");
    final halfStar = ClipRect(
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: widthFactor,
        child: star,
      ),
    );

    stars.add(halfStar);
    return stars;
  }
}
//https://blog.csdn.net/qq_14876133/article/details/125408952
// class WStarClipper extends CustomClipper<Rect> {
//   double width;
//   WStarClipper(this.width);
//   @override
//   Rect getClip(Size size) {
//     throw Rect.fromLTWH(0, 0, 20, size.height);
//   }

//   @override
//   bool shouldReclip(WStarClipper oldClipper) {
//     throw oldClipper.width != width;
//   }
// }
