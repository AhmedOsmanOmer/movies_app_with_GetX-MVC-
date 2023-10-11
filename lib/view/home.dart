import 'package:flutter/material.dart';
import 'package:flutter_mid_level/Controllers/connectivity_controller.dart';
import 'package:flutter_mid_level/Controllers/home_controller.dart';
import 'package:flutter_mid_level/Controllers/login_controller.dart';
import 'package:flutter_mid_level/main.dart';
import 'package:flutter_mid_level/utils/screen_size.dart';
import 'package:flutter_mid_level/view/login.dart';
import 'package:flutter_mid_level/view/no_internet.dart';
import 'package:flutter_mid_level/widgets/carousel_slider.dart';
import 'package:flutter_mid_level/widgets/discover_movies.dart';
import 'package:flutter_mid_level/widgets/movies_lables.dart';
import 'package:flutter_mid_level/widgets/movies_list.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    LoginController login_controller = Get.put(LoginController());

  HomeController controller = Get.put(HomeController());
  ConnectivityController conn = Get.put(ConnectivityController());
  @override
  void initState() {
    conn.startMonitoring();
    controller.scroll_controller.addListener(controller.scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: (){
            login_controller.logout();
            pref.clear();
            Get.offAll(()=>LoginScreen());
          }, icon: const Icon(Icons.logout))],
          centerTitle: true,
          title: Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                "Max Movies",
                style: TextStyle(
                    fontSize: ScreenSize(context: context).fontSize(30),
                    color: Colors.red[900]),
              )),
        ),
        body: GetBuilder<ConnectivityController>(
            init: ConnectivityController(),
            builder: (connectivityController) => connectivityController
                        .isOnline ==
                    true
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GetBuilder<HomeController>(
                      init: HomeController(),
                      builder: (controller) => ListView(
                          // controller: controller.scroll_controller,
                          children: [
                            const SizedBox(height: 20),
                            const MoviesLable(text: "Trending Now"),
                            TrendCarousel(data: controller.getTrendMovies()),
                            const SizedBox(height: 25),
                            const MoviesLable(text: "Popular"),
                            MoviesList(data: controller.getPopularMovies()),
                            const Divider(thickness: 0.5, color: Colors.grey),
                            const MoviesLable(text: "Top Rated"),
                            MoviesList(data: controller.getTopRatedMovies()),
                            const Divider(thickness: 0.5, color: Colors.grey),
                            const MoviesLable(text: "Upcoming"),
                            MoviesList(data: controller.getUpCommingMovies()),
                            const Divider(thickness: 0.5, color: Colors.grey),
                            const MoviesLable(text: "Discover"),
                            MoviesDiscover(data: controller.discoverMovies())
                          ]),
                    ),
                  )
                : const NoInternet()));
  }
}
