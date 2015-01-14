require "test_helper"

class TrainOptionTest < ActiveSupport::TestCase

  def train_option
    @train_option ||= TrainOption.new
  end

  def test_valid
    assert train_option.valid?
  end

  def test_belongs_to_a_train
    train = create_train
    pizza_option = create_train_option(place: "Pizza", train: train)
    sushi_option = create_train_option(place: "Sushi", train: train)
    assert_equal pizza_option.train, train
    assert_equal sushi_option.train, train
  end

end
