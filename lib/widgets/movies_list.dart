import 'package:flutter/material.dart';
import 'package:flutter_mid_level/models/movies_model.dart';
import 'package:flutter_mid_level/utils/constant.dart';
import 'package:flutter_mid_level/utils/screen_size.dart';
import 'package:flutter_mid_level/view/movie_details.dart';
import 'package:flutter_mid_level/widgets/widgets.dart';
import 'package:get/get.dart';

class MoviesList extends StatelessWidget {
  final Future<List<MovieModel>> data;
  const MoviesList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return internetError();
        } else if (snapshot.hasData) {
          return Container(
            height: ScreenSize(context: context).getHeight()*0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                          () => MovieDetails(movieData: snapshot.data![index]));
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                              width: ScreenSize(context: context).getWidth()*0.4,
                              height: ScreenSize(context: context).getHeight()*0.26,
                              color: Colors.black,
                              child:Network_Image("${Constant.imagePath}${snapshot.data![index].imageUrl}") ),
                        ),
                         SizedBox(height: ScreenSize(context: context).getHeight()*0.01),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          snapshot.data![index].title,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Container(
              color: Colors.black,
              height: ScreenSize(context: context).getHeight() * 0.3);
        }
      },
    );
  }
}
