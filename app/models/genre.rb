class Genre < ActiveRecord::Base
  validates :genre_id, uniqueness: { scope: [:movie_id] }

  belongs_to :movie
end
