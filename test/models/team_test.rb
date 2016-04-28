require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
   @team=teams(:one)
  end

  test 'should be valid' do
    assert @team.valid?
    assert :success
  end

  test 'name should be present' do
    @team.name = '     '
    assert_not @team.valid?
  end




end
