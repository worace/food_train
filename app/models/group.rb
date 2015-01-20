class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :group_users
  has_many :users, through: :group_users
  has_many :trains

  validates :name, uniqueness: true

  def has_user?(user)
    (users + [owner]).include?(user)
  end
end
