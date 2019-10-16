require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require './lib/network'

class NetworkTest < Minitest::Test

  def setup
     @nbc = Network.new("NBC")
     @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
     @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
     @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
     @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
     @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
     @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
     @pay_roll = {"David Hasselhoff" => 1600000, "William Daniels" => 1000000, "Amy Poehler" => 2000000, "Nick Offerman" => 1400000}
  end

  def test_it_exists
    assert_instance_of Network, @nbc
  end

  def test_it_starts_with_no_shows
    assert_equal [], @nbc.shows
  end
  def test_it_can_add_shows
     @nbc.add_show(@knight_rider)
     @nbc.add_show(@parks_and_rec)
    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end
  def test_highest_paid_actor
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    assert_equal "Amy Poehler", @nbc.highest_paid_actor
  end
  def test_network_payroll
    assert_equal @pay_roll, @nbc.payroll
  end
end
