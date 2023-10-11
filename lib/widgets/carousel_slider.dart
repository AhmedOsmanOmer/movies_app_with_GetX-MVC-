import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mid_level/models/movies_model.dart';
import 'package:flutter_mid_level/utils/constant.dart';
import 'package:flutter_mid_level/utils/screen_size.dart';
import 'package:flutter_mid_level/view/movie_details.dart';
import 'package:flutter_mid_level/widgets/widgets.dart';
import 'package:get/get.dart';

class TrendCarousel extends StatelessWidget {
  final Future<List<MovieModel>> data;
  const TrendCarousel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return internetError();
          } else if (snapshot.hasData) {
            return CarouselSlider.builder(
              itemCount: snapshot.data!.length,
              options: CarouselOptions(
                  height: ScreenSize(context: context).getHeight()*0.3,
                  autoPlay: true,
                  viewportFraction: 0.85,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(seconds: 3)),
              itemBuilder: (context, index, pageIndex) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                        () => MovieDetails(movieData: snapshot.data![index]));
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Container(
                            width: ScreenSize(context: context).getWidth(),
                              color: Colors.black,
                              child:Network_Image("${Constant.imagePath}${snapshot.data![index].imageUrl}")  
                              ),
                        ),
                      ),
                       SizedBox(height: ScreenSize(context: context).getHeight()*0.01),
                      Text(
                        snapshot.data![index].title,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
           return Container(color: Colors.black,height: ScreenSize(context: context).getHeight()*0.3);}
        });
  }
}
