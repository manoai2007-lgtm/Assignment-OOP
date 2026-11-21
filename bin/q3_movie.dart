class Movie {
  final String title;
  final String studio;
  final String rating;

  Movie(this.title, this.studio, [this.rating = 'PG']);

  static List<Movie> getPG(List<Movie> movies) {
    return movies.where((movie) => movie.rating.contains('PG')).toList();
  }
}

void main() {
  final movies = [
    Movie('Casino Royale', 'Eon Productions', 'PG13'),
    Movie('Paddington', 'Heyday Films'),
    Movie('Alien', 'Brandywine Productions', 'R'),
  ];

  for (final movie in Movie.getPG(movies)) {
    print('${movie.title}: ${movie.rating}');
  }
}
