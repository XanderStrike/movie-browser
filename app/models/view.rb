class View < ActiveRecord::Base
  attr_accessible :movie_id, :created_at

  belongs_to :movie

  def hour
    self.created_at.localtime.strftime('%H')
  end

  def day_of_week
    self.created_at.localtime.strftime('%w')
  end
end
