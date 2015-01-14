require "test_helper"

class TrainTest < ActiveSupport::TestCase

  def train
    @train ||= Train.new
  end

  def test_valid
    assert train.valid?
  end

end
