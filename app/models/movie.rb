class Movie < ApplicationRecord
  RATINGS = %w(G PG PG-13 R NC-17)

  validates :title, :released_on, :duration, :rating, { presence: true }
  validates :description, length: { minimum: 25, maximum: 1000 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

  validates :image_file_name, format: {
    with: /\w+\.(jpg|png)\z/i,
    message: "Must be a JPG or PNG image"
  }

  validates :rating, inclusion: { in: RATINGS }

  def self.released
    where("released_on < ?", DateTime.now).order(released_on: :desc)
  end

  def flop?
    total_gross.blank? || total_gross < 225_000_000
  end

  def flop_to_str
    if flop?
      "Flop"
    end
  end
end