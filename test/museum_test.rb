require './lib/exhibit'
require './lib/Patron'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class MuseumTest < Minitest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_has_attributes
    assert_equal "Denver Museum of Nature and Science", @dmns.name
    assert_equal [], @dmns.exhibits
  end
end
