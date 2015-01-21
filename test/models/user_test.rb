require "test_helper"

class UserTest < ActiveSupport::TestCase

  def auth_test_hash
    {
      "provider" => "twitter",
      "info" => {"name" => "TestJorge"},
      "uid" => "test_uid"
    }
  end

  def test_user_can_be_found_by_auth_hash
    user = create_user(uid: "test_uid")
    user_found = User.find_or_create_from_auth_hash(auth_test_hash)

    assert_equal user_found, user
  end

  def test_user_is_created_by_auth_hash_when_not_there
    refute User.find_by(uid: "test_uid")
    User.find_or_create_from_auth_hash(auth_test_hash)
    assert User.find_by(uid: "test_uid")
  end

  def test_user_name_is_updated_when_called_with_twitter_api
    user = create_user(uid: "test_uid", full_name: "name before")
    User.find_or_create_from_auth_hash(auth_test_hash)
    assert_equal "TestJorge", user.reload.full_name
  end

  def test_user_can_have_many_votes
    user = create_user
    5.times { create_vote user: user }
    assert_equal 5, user.votes.count
  end

  def test_all_groups
    user = create_user
    group1 = create_group owner: user
    group2 = create_group
    group3 = create_group
    group2.users << user
    group3.users << user
    assert_includes user.all_groups, group1
    assert_includes user.all_groups, group2
    assert_includes user.all_groups, group3
  end

end
