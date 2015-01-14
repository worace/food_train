require "test_helper"

class GroupTest < ActiveSupport::TestCase

  def test_has_many_trains
    group = create_group
    trains = 5.times.map { create_train group: group }
    assert_equal 5, group.trains.count
    trains.each do |train|
      assert_includes group.trains, train
    end
  end

end
