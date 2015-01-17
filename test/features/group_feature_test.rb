require "test_helper"

class GroupFeatureTest < Capybara::Rails::TestCase
  def test_group_index_shows_all
    5.times { |n| create_group name: "testgroup #{n}" }
    visit groups_path
    5.times do |n|
      assert_content page, "testgroup #{n}"
    end
  end
end
