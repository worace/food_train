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

  def test_cant_make_another_group_with_same_name
    create_group name: "taken"
    group = Group.new name: "taken"
    refute group.valid?
  end

  def test_has_user
    user_not_in = create_user
    user_owner  = create_user
    user_in     = create_user
    group       = create_group(owner: user_owner)
    group.users << user_in
    refute group.has_user? user_not_in
    assert group.has_user? user_in
    assert group.has_user? user_owner
  end

end
