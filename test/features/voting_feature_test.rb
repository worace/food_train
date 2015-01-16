require "test_helper"

class VotingFeatureTest < Capybara::Rails::TestCase
  def test_can_not_vote_if_not_logged_in
    group = create_group
    train = create_train group: group
    pizza_option = create_train_option train: train, place: "pizza"

    visit group_path(group)
    click_link_or_button "vote-pizza"

    assert_equal 0, pizza_option.vote_count
  end
end
