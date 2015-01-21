require "test_helper"

class TrainTest < ActiveSupport::TestCase

  def test_has_many_options
    train = create_train
    pizza_option = create_train_option(place: "Pizza", train: train)
    sushi_option = create_train_option(place: "Sushi", train: train)
    assert_includes train.train_options, pizza_option
    assert_includes train.train_options, sushi_option
  end

  def test_belongs_to_a_group
    group = create_group
    train = create_train group: group
    assert_includes group.trains, train
    assert_equal group, train.group
  end

  def test_sorts_options_in_order_of_highest_voting_first
    train = create_train
    middle_option    = create_train_option train: train
    popular_option   = create_train_option train: train
    unpopular_option = create_train_option train: train

    5.times { create_vote train_option: popular_option }
    3.times { create_vote train_option: middle_option }
    1.times { create_vote train_option: unpopular_option }

    sorted = [popular_option, middle_option, unpopular_option]
    assert_equal train.sorted_train_options, sorted
  end

  def test_pretty_time
    train = create_train departure_time: "7:56 PM"
    assert_match /7:56 pm/i, train.pretty_time
  end

  def test_validates_time_exists
    train = create_train
    assert train.valid?
    train.departure_time = nil
    refute train.valid?
  end

end
