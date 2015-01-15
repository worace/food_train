class TrainOption < ActiveRecord::Base
  belongs_to :train
  has_many :votes

  def vote_count
    votes.count
  end
end
