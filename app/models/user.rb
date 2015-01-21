class User < ActiveRecord::Base
  has_many :owned_groups, foreign_key: :owner_id, class_name: "Group"
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :votes

  def self.find_or_create_from_auth_hash(auth_data)
    user = User.where(uid: auth_data['uid']).first_or_create
    user.tap { |u| u.update_attributes full_name: auth_data["info"]["name"] }
  end

  def all_groups
    groups + owned_groups
  end
end
