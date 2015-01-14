class User < ActiveRecord::Base
  has_many :owned_groups, foreign_key: :owner_id, class_name: "Group"
  has_many :group_users
  has_many :groups, through: :group_users
end
