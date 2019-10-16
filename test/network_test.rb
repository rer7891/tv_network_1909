require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'

class NetworkTest < Minitest::Test

  def setup
     @nbc = Network.new("NBC")
     @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
     @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
     @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
  end

  def test_it_exists
    assert_instance_of Network, @nbc
  end

  def test_it_starts_with_no_shows
    assert_equal [], @nbc.shows
  end

end
