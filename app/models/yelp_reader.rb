class YelpReader
  def self.search_for_restaurant(restaurant)
    # sort is 1 for closest to denver, 0 for best match to term
    search = Yelp.client.search 'Denver', term: restaurant, sort: 1
    search.businesses.first
  end
end
