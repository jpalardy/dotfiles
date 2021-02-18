#-------------------------------------------------
# .iex.exs
#-------------------------------------------------

require Ecto.Query

alias Bookpiles.Repo

#-------------------------------------------------
# GenServer
#-------------------------------------------------

defmodule Some.Server do
  use GenServer

  def init(initial_number) do
    {:ok, initial_number}
  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end
end

#-------------------------------------------------

defmodule SomeApp do
  use Application

  # https://hexdocs.pm/elixir/Application.html#c:start/2
  def start(_type, _args) do
    children = []
    Supervisor.start_link(children, strategy: :one_for_one) # :rest_for_one, :one_for_all
  end
end

