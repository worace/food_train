class TrainOption < ActiveRecord::Base
  belongs_to :train
  has_many :votes

  def vote_count
    votes.count
  end

  def yelp_business
    @yelp_business ||= YelpReader.search_for_restaurant(place)
  end

  def yelp_content
    "Rating:  #{yelp_business.rating}
    Phone:  #{yelp_business.display_phone}
    Address:  #{yelp_business.location.address.first}
    Category: #{yelp_business.categories.first.first}"
  end
end
