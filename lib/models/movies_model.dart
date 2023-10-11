class MovieModel {
  String url =
      "https://api.themoviedb.org/3/movie/popular?api_key=fbde41d6f15f029ff241d782c6155b25";

  final String title;
  final String imageUrl;
  final String overview;
  final String releaseDate;
  final bool adult;
  final int voteCount;
  final double voteAverage;
  final double popularity;
  final String backImage; 
  

  MovieModel({
    required this.backImage,
    required this.popularity,
    required this.imageUrl, required this.adult, required this.voteAverage, required this.voteCount, 
    required this.releaseDate,
    required this.title,
    required this.overview,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      popularity:json['popularity'],
      title: json['original_title'] ?? json['original_name'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date']??json['first_air_date'],
      adult: json['adult']??false,
      voteCount: json['vote_count'],
      imageUrl: json['poster_path'],
      backImage:json['backdrop_path']
    );
  }
}
