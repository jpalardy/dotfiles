# -------------------------------------------------
# .iex.exs
# -------------------------------------------------

require Ecto.Query

alias Bookpiles.Repo

# -------------------------------------------------
# GenServer
# -------------------------------------------------

defmodule Some.Server do
  use GenServer

  def start_link(options) do
    state = %{
      delay: Keyword.get(options, :delay, 2_000),
      count: Keyword.get(options, :count, 0)
    }

    GenServer.start_link(__MODULE__, state)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end
end

# -------------------------------------------------

defmodule SomeApp.Application do
  use Application

  # https://hexdocs.pm/elixir/Application.html#c:start/2
  def start(_type, _args) do
    children = []
    # 3 alternatives -- https://hexdocs.pm/elixir/Supervisor.html#module-child_spec-1

    # https://hexdocs.pm/elixir/Supervisor.html#module-start_link-2-init-2-and-strategies
    opts = [strategy: :one_for_one, name: SomeApp.Supervisor]

    Supervisor.start_link(children, opts)
  end
end

# -------------------------------------------------

defmodule SomeApp.Application do
  use Application

  def start(_type, _args) do
    opts = [strategy: :one_for_one name: SomeApp.Supervisor]

    DynamicSupervisor.start_link(options)
  end
end
