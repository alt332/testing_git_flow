class MovieModel {
  final int id;
  final String title;
  final int year;
  final double rating;
  final String descriptionFull;
  final String backgroundImage;
  final String backgroundImageOriginal;
  final String smallCoverImage;
  final String mediumCoverImage;
  final String largeCoverImage;
  final int dateUploadedUnix;

  MovieModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        title = parsedJson['title'],
        year = parsedJson['year'],
        rating = parsedJson['rating'].toDouble(),
        descriptionFull = parsedJson['description_full'],
        backgroundImage = parsedJson['background_image'],
        backgroundImageOriginal = parsedJson['background_image_original'],
        smallCoverImage = parsedJson['small_cover_image'],
        mediumCoverImage = parsedJson['medium_cover_image'],
        largeCoverImage = parsedJson['large_cover_image'],
        dateUploadedUnix = parsedJson['date_uploaded_unix'];
}
