import 'package:carousel_slider/carousel_slider.dart';
import 'package:climbing_sessions/src/util/colors.dart';
import 'package:flutter/material.dart';

class StatCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: [
            Container(
              color: AppColors.orange,
              child: Center(
                child: Column(
                  children: [Text('Average Grade Climbed'), Text('V5')],
                ),
              ),
            ),
            Container(
              color: AppColors.orange,
              child: Center(
                child: Column(
                  children: [Text('Average Grade Climbed'), Text('V5')],
                ),
              ),
            ),
            Container(
              color: AppColors.orange,
              child: Center(
                child: Column(
                  children: [Text('Average Grade Climbed'), Text('V5')],
                ),
              ),
            ),
          ]),
    );
  }
}
