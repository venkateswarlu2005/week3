import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/detailed_screen.dart';
class TrendingSlider extends StatelessWidget {
  const TrendingSlider({super.key,required this.snapshot});
final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context,itemIndex,pageViewIndex){
          return GestureDetector(
            onTap:(){
              Navigator.push(context , MaterialPageRoute(builder: (context)=> Detailscreen(movie: snapshot.data[itemIndex]),),);
            },
            child: ClipRRect(borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 300,
                  width: 1000,
                  child: Image.network(filterQuality: FilterQuality.high,fit: BoxFit.cover,'${constants.imagePath}${snapshot.data[itemIndex].posterPath}'),
                )
            ),
          );
        },
        options: CarouselOptions(height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration:const  Duration(seconds: 1),
        ),
      ),

    );
  }
}

 