require "test_helper"

class UserTest < ActiveSupport::TestCase

  def test_auth_hash
    {
      "provider" => "twitter",
      "info" => {"name" => "TestJorge"},
      "uid" => "test_uid"
    }
  end

  def test_user_can_be_found_by_auth_hash
    user = create_user(uid: "test_uid")
    user_found = User.find_or_create_from_auth_hash(test_auth_hash)

    assert_equal user_found, user
  end

end
