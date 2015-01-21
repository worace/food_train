class TrainOption < ActiveRecord::Base
  belongs_to :train
  has_many :votes

  def vote_count
    votes.count
  end

  def yelp_business
    @yelp_business ||= YelpReader.search_for_restaurant(place)
  end
end
