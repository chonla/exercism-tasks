defmodule RobotGuard do
  defguard valid_dir(direction)
           when direction == :north or
                  direction == :east or
                  direction == :west or
                  direction == :south

  defguard valid_position(position)
           when is_tuple(position) and
                  tuple_size(position) == 2 and
                  is_integer(elem(position, 0)) and
                  is_integer(elem(position, 1))
end

defmodule Robot do
  defstruct [dir: :north, pos: {0, 0}]
end

defmodule RobotSimulator do
  import RobotGuard

  @invalid_instruction {:error, "invalid instruction"}
  @invalid_direction {:error, "invalid direction"}
  @invalid_position {:error, "invalid position"}

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(dir :: atom, pos :: {integer, integer}) :: Robot | {:error, String.t()}
  def create(dir \\ :north, pos \\ {0, 0})

  def create(dir, pos) when valid_dir(dir) and valid_position(pos) do
    %Robot{:dir => dir, :pos => pos}
  end

  def create(dir, _) when not valid_dir(dir) do
    @invalid_direction
  end

  def create(_, pos) when not valid_position(pos) do
    @invalid_position
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: Robot | {:error, String.t()}, instructions :: String.t()) :: Robot | {:error, String.t()}
  def simulate({:error, _} = error, _) do
    error
  end

  def simulate(robot, "") do
    robot
  end

  def simulate(robot, instructions) do
    simulate(
      move(robot, String.first(instructions)),
      String.slice(instructions, 1..-1)
    )
  end

  @spec move(robot :: Robot, command :: any) :: Robot | {:error, String.t()}
  def move(%Robot{:dir => :north, :pos => {x, y}}, "A") do
    create(:north, {x, y + 1})
  end

  def move(%Robot{:dir => :north, :pos => {x, y}}, "L") do
    create(:west, {x, y})
  end

  def move(%Robot{:dir => :north, :pos => {x, y}}, "R") do
    create(:east, {x, y})
  end

  def move(%Robot{:dir => :east, :pos => {x, y}}, "A") do
    create(:east, {x + 1, y})
  end

  def move(%Robot{:dir => :east, :pos => {x, y}}, "L") do
    create(:north, {x, y})
  end

  def move(%Robot{:dir => :east, :pos => {x, y}}, "R") do
    create(:south, {x, y})
  end

  def move(%Robot{:dir => :south, :pos => {x, y}}, "A") do
    create(:south, {x, y - 1})
  end

  def move(%Robot{:dir => :south, :pos => {x, y}}, "L") do
    create(:east, {x, y})
  end

  def move(%Robot{:dir => :south, :pos => {x, y}}, "R") do
    create(:west, {x, y})
  end

  def move(%Robot{:dir => :west, :pos => {x, y}}, "A") do
    create(:west, {x - 1, y})
  end

  def move(%Robot{:dir => :west, :pos => {x, y}}, "L") do
    create(:south, {x, y})
  end

  def move(%Robot{:dir => :west, :pos => {x, y}}, "R") do
    create(:north, {x, y})
  end

  def move(_, _) do
    @invalid_instruction
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: Robot) :: atom
  def direction(robot) do
    robot.dir
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: Robot) :: {integer, integer}
  def position(robot) do
    robot.pos
  end
end
