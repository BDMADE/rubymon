require 'test_helper'

class MonsterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @monster=monsters(:one)
  end

  test 'should be valid' do
    assert @monster.valid?
    assert :success
  end

  test 'name should be present' do
    @monster.name = '     '
    assert_not @monster.valid?
  end


  test 'type should be present' do
    @monster.type_id = ''
    assert_not @monster.valid?
  end

  test 'team should be present' do
    @monster.team_id = ''
    assert_not @monster.valid?
  end

end
