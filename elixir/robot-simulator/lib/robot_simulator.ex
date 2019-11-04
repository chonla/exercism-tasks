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

defmodule RobotSimulator do
  import RobotGuard

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(dir :: atom, pos :: {integer, integer}) :: any
  def create(dir \\ :north, pos \\ {0, 0})

  def create(dir, pos) when valid_dir(dir) and valid_position(pos) do
    %{:dir => dir, :pos => pos}
  end

  def create(dir, _) when not valid_dir(dir) do
    {:error, "invalid direction"}
  end

  def create(_, pos) when not valid_position(pos) do
    {:error, "invalid position"}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(_robot, _instructions) do
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot[:dir]
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot[:pos]
  end
end
