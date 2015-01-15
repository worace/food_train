require "test_helper"

class VoteTest < ActiveSupport::TestCase

  def test_vote_belongs_to_user
    user = create_user
    vote = create_vote(user: user)
    assert_equal vote.user, user
  end

  def test_vote_belongs_to_train_option
    user = create_user
    vote = create_vote(user: user)
    assert_equal vote.user, user
  end

end
