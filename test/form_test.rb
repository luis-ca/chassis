require_relative 'test_helper'
require 'debugger'

class FormTest < MiniTest::Unit::TestCase
  class Form < Chassis::Form
    attribute :name, String
    attribute :email, String
  end

  def test_attributes_only_includes_dirty_attributes
    form = Form.new name: 'Adam'
    assert_equal({ name: 'Adam' }, form.attributes)
  end

  def test_assigning_an_known_attributes_raises_an_error
    assert_raises Chassis::Form::UnknownField do
      Form.new foo: 'bar'
    end
  end
end