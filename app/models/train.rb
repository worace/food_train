class Train < ActiveRecord::Base
  belongs_to :group
  has_many :train_options
  accepts_nested_attributes_for :train_options, reject_if: proc { |attr| attr['place'].blank? }

  MAX_OPTIONS = 4

  def sorted_train_options
    train_options.sort_by(&:vote_count).reverse
  end
end
