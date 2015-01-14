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

end
