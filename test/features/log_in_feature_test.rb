require "test_helper"

class LogInFeatureTest < Capybara::Rails::TestCase
  def test_can_log_in
    log_in
    assert_equal dashboard_path, current_path
    assert_content page, "Logged in as #{auth_hash[:info][:name]}"
  end

  def test_can_log_out
    log_in
    refute_link page, "log-in"
    click_link_or_button "Log Out"
    assert_link page, "log-in"
  end
end
