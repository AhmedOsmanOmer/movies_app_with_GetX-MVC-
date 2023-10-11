import 'package:flutter/material.dart';
import 'package:flutter_mid_level/models/movies_model.dart';
import 'package:flutter_mid_level/utils/constant.dart';
import 'package:flutter_mid_level/utils/screen_size.dart';
import 'package:flutter_mid_level/widgets/widgets.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movieData;
  const MovieDetails({super.key, required this.movieData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Network_Image( "${Constant.imagePath}${movieData.imageUrl}")),
              const SizedBox(height: 15),
              Text(movieData.title,
                  style: TextStyle(
                      fontSize: ScreenSize(context: context).fontSize(35),
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical:
                              ScreenSize(context: context).getHeight() * 0.01,
                          horizontal:
                              ScreenSize(context: context).getWidth() * 0.04),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          const Text(
                            "Popularity",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                              height: ScreenSize(context: context).getHeight() *
                                  0.01),
                          Text(
                            movieData.popularity.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical:
                              ScreenSize(context: context).getHeight() * 0.01,
                          horizontal:
                              ScreenSize(context: context).getWidth() * 0.04),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          const Text(
                            "Vote Count",
                            style: TextStyle(color: Colors.black),
                          ),
                           SizedBox(height: ScreenSize(context: context).getHeight()*0.01),
                          Text(
                            movieData.voteCount.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical:
                              ScreenSize(context: context).getHeight() * 0.01,
                          horizontal:
                              ScreenSize(context: context).getWidth() * 0.04),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Icon(Icons.star, color: Colors.yellow[900]),
                           SizedBox(height: ScreenSize(context: context).getHeight()*0.01),
                          Text(
                            "${movieData.voteAverage} ",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ))
                ],
              ),
               SizedBox(height: ScreenSize(context: context).getHeight()*0.02),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
                indent: 3,
                endIndent: 3,
              ),
               SizedBox(height: ScreenSize(context: context).getHeight()*0.02),
               Text("Release Date",
                  style: TextStyle(fontSize: ScreenSize(context: context).fontSize(30), fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(movieData.releaseDate, style: TextStyle(fontSize: ScreenSize(context: context).fontSize(23))),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
                indent: 50,
                endIndent: 50,
              ),
              Text("Discription",
                  style: TextStyle(fontSize: ScreenSize(context: context).fontSize(30), fontWeight: FontWeight.bold)),
               SizedBox(height: ScreenSize(context: context).getHeight()*0.01),
              Text(movieData.overview, style: TextStyle(fontSize: ScreenSize(context: context).fontSize(23)))
            ],
          ),
        ),
      ),
    );
  }
}
