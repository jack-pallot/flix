module MoviesHelper
  def total_gross(movie)
    if movie.flop?
      movie.flop_to_str
    else
      number_to_currency(movie.total_gross, precision: 0)
    end
  end

  def year_of(movie)
    movie.released_on.strftime('%Y')
  end
end
