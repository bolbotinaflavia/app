require "test_helper"

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(
      follower_id: users(:mihai).id, followed_id: users(:mike).id
    )
  end

  test 'should be valid' do
    assert @relationship.valid?
  end

  test 'should require follower_id' do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test 'should require followed_id' do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end
end