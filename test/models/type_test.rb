require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @type=types(:one)
  end

  test 'should be valid' do
    assert @type.valid?
    assert :success
  end

  test 'name should be present' do
    @type.name = '     '
    assert_not @type.valid?
  end

  test 'power should be present' do
    @type.power = ''
    assert_not @type.valid?
  end


end
