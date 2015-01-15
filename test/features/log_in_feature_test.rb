require "test_helper"

class LogInFeatureTest < Capybara::Rails::TestCase
  def test_can_log_in
    log_in
    assert_content page, auth_hash[:info][:name]
    refute_link page, "log-in"
  end

  def test_can_log_out
    log_in
    refute_link page, "log-in"
    click_link_or_button "Log Out"
  end
end
