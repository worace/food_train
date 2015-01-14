require "test_helper"

class TrainOptionTest < ActiveSupport::TestCase

  def train_option
    @train_option ||= TrainOption.new
  end

  def test_valid
    assert train_option.valid?
  end

end
