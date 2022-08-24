require 'minitest/autorun'

require_relative 'cat'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_is_cat; end

  def test_name
    @kitty = Cat.new('Kitty')
    assert_equal('Kitty', @kitty.name)
  end

  def test_miaow
    assert_equal("Kitty is miaowing.", @kitty.miaow)
  end

  def test_raises_error
    assert_raises(ArgumentError) { Cat.new }
  end
end