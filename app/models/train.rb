class Train < ActiveRecord::Base
  belongs_to :group
  has_many :train_options
end
