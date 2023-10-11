import 'package:flutter/material.dart';
import 'package:flutter_mid_level/models/movies_model.dart';
import 'package:flutter_mid_level/utils/constant.dart';
import 'package:flutter_mid_level/utils/screen_size.dart';
import 'package:flutter_mid_level/view/movie_details.dart';
import 'package:flutter_mid_level/widgets/widgets.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MoviesDiscover extends StatelessWidget {
  Future<List<MovieModel>> data;
  MoviesDiscover({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return internetError();
        } else if (snapshot.hasData) {
          return Column(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                          () => MovieDetails(movieData: snapshot.data![index]));
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Container(
                                height: ScreenSize(context: context).getHeight()*0.5,
                                color: Colors.black,
                                child:Network_Image("${Constant.imagePath}${snapshot.data![index].imageUrl}") ),
                          ),
                        ),
                        Text(
                          snapshot.data![index].title,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
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
