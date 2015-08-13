class Movie < ActiveRecord::Base
  has_many :reviews
  before_save :capitalize_title
  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).map(&:capitalize).join ' '
  end
  
  def self.all_ratings ; %w[G PG PG-13 R NC-17] ; end
  validates :title, presence: true
  validates :release_date, presence: true
  validate :released_1930_or_later
  validates :rating, inclusion: {in: Movie.all_ratings}, unless: :grandfathered?

  def released_1930_or_later
    errors.add :release_date, 'must be 1930 or later' if release_date && release_date < Date.parse('1 Jan 1930')
  end
  @@grandfathered_date = Date.parse '1 Nov 1968'
  def grandfathered?
    release_date && release_date < @@grandfathered_date
  end
  
  scope :with_good_reviews, ->(threshold) { joins(:reviews).group(:movie_id).having(['AVG(reviews.potatoes) > ? ', threshold.to_i]) }
  scope :for_kids, -> { where('rating in (?)', %w(G PG)) }
  
  class Movie::InvalidKeyError < StandardError ; end
  
  def self.find_in_tmdb string
    Tmdb::Movie.find string
  rescue NoMethodError => tmdb_gem_exception
    raise tmdb_gem_exception unless Tmdb::Api.response['code'] == 401
    raise Movie::InvalidKeyError, 'Invalid API key'
  end
  
  def name_with_rating
    "#{self.title} (#{self.rating})"
  end
end

class Tmdb::Movie
  def rating
    'unknown'
  end
end

Tmdb::Api.key(ENV['TMDB_API_KEY'])

# class Movie < ActiveRecord::Base
#   def self.all_ratings ; %w[G PG PG-13 R NC-17] ; end #  shortcut: array of strings
#   validates :title, :presence => true
#   validates :release_date, :presence => true
#   validate :released_1930_or_later # uses custom validator below
#   validates :rating, :inclusion => {:in => Movie.all_ratings},
#     :unless => :grandfathered?
#   def released_1930_or_later
#     errors.add(:release_date, 'must be 1930 or later') if
#       release_date && release_date < Date.parse('1 Jan 1930')
#   end
#   @@grandfathered_date = Date.parse('1 Nov 1968')
#   def grandfathered?
#     release_date && release_date < @@grandfathered_date
#   end
# end


