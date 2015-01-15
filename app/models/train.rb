class Train < ActiveRecord::Base
  belongs_to :group
  has_many :train_options

  def sorted_train_options
    train_options.sort_by(&:vote_count).reverse
  end
end
