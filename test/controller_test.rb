require "minitest/autorun"
require_relative "../src/controller/controller"
require_relative "../src/model/state"

class ControllerTest < Minitest::Test
  def setup
  	@initial_state = Model::State.new(
			                Model::Snake.new([
				                Model::Coord.new(1,1),
			                  Model::Coord.new(0,1)
			                ]),
			                Model::Food.new(4, 4),
			                Model::Grid.new(16, 24),
			                Model::Direction::DOWN,
			                false
			                )
  end

	def test_move_snake 
    expected_state = Model::State.new(
			Model::Snake.new([
				Model::Coord.new(2,1),
			  Model::Coord.new(1,1)
			]),
			Model::Food.new(4, 4),
			Model::Grid.new(16, 24),
			Model::Direction::DOWN,
			false
			)

    actual_state = Controller::move_snake(@initial_state)
    assert_equal actual_state, expected_state
	end

	def test_change_direction_invalid
		expected_state = Model::State.new(
			                Model::Snake.new([
				                Model::Coord.new(1,1),
			                  Model::Coord.new(0,1)
			                ]),
			                Model::Food.new(4, 4),
			                Model::Grid.new(16, 24),
			                Model::Direction::DOWN,
			                false
			                )
		actual_state = Controller::change_direction(@initial_state, Model::Direction::UP)
    assert_equal actual_state, expected_state
	end

	def test_chang_direction_valid
		expected_state = Model::State.new(
			                Model::Snake.new([
				                Model::Coord.new(1,1),
			                  Model::Coord.new(0,1)
			                ]),
			                Model::Food.new(4, 4),
			                Model::Grid.new(16, 24),
			                Model::Direction::LEFT,
			                false
			                )
		actual_state = Controller::change_direction(@initial_state, Model::Direction::LEFT)
    assert_equal actual_state, expected_state
	end
end