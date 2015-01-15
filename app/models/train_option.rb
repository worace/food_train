class TrainOption < ActiveRecord::Base
  belongs_to :train
  has_many :votes
end
