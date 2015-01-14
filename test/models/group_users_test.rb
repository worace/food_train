require "test_helper"

class GroupUserTest < ActiveSupport::TestCase

  def test_a_group_belongs_to_its_owner
    user = create_user
    group = create_group(owner: user)

    assert_includes user.owned_groups, group
    assert_equal user, group.owner
  end

  def test_groups_have_many_users
    owner = create_user
    group = create_group(owner: owner)
    users = 3.times.map { create_user }
    group.users += users

    assert_equal 3, group.users.count
    users.each do |user|
      assert_includes group.users, user
    end
  end

  def test_users_can_be_part_of_multiple_groups
    user = create_user
    groups = 4.times.map { create_group }
    user.groups += groups

    assert_equal 4, user.groups.count
    groups.each do |group|
      assert_includes group.users, user
    end
  end

end
