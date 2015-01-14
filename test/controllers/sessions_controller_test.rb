require "test_helper"

class SessionsControllerTest < ActionController::TestCase
  def test_creates_new_user
    @request.env["omniauth.auth"] = {
      "provider" => "twitter",
      "info" => {"name" => "Alice Smith"},
      "uid" => "abc123"
    }

    post :create
    user = User.find_by(uid: "abc123")
    assert_equal user.full_name, "Alice Smith"
  end

  def test_only_creates_one_user_for_same_uid
    @request.env["omniauth.auth"] = {
      "provider" => "twitter",
      "info" => {"name" => "Bob Jones"},
      "uid" => "xyz456"
    }
    user = User.create(uid: "xyz456", full_name: "Bob Jones")

    post :create
    assert_equal 1, User.where(uid: "xyz456").count
  end
end
