# -------------------------------------------------
# GenServer example
# -------------------------------------------------

defmodule Counter do
  use GenServer

  def start_link(options \\ []) do
    state = %{
      delay: Keyword.get(options, :delay, 2_000),
      count: Keyword.get(options, :count, 0)
    }

    GenServer.start_link(__MODULE__, state)
  end

  def next(pid) do
    GenServer.call(pid, :next_number)
  end

  # -------------------------------------------------

  @impl GenServer
  def init(state) do
    {:ok, state}
  end

  @impl GenServer
  def handle_call(:next_number, _from, %{count: count} = state) do
    {:reply, count, %{state | count: count + 1}}
  end
end

{:ok, pid} = Counter.start_link()
Counter.next(pid)

# -------------------------------------------------
# Supervisor
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
# Dynamic Supervisor
# -------------------------------------------------

defmodule SomeApp.Application do
  use Application

  def start(_type, _args) do
    opts = [strategy: :one_for_one name: SomeApp.Supervisor]

    DynamicSupervisor.start_link(options)
  end
end

# -------------------------------------------------
#  Mix Task
# -------------------------------------------------

defmodule Mix.Tasks.GetToken do
  @moduledoc "Get JWT token from test server"
  @shortdoc @moduledoc

  use Mix.Task

  @impl true
  def run(_) do
  end
end

# -------------------------------------------------
#  IEx
# -------------------------------------------------

# https://arrowsmithlabs.com/blog/iex-configure-auto-reload
IEx.configure(auto_reload: true)

{:messages, messages} = Process.info(pid, :messages)

# -------------------------------------------------
#  stop at BEAM assembly
# -------------------------------------------------

@compile :S

# -------------------------------------------------
#  :recon_trace : custom formatter
# -------------------------------------------------

require Logger
formatter = fn trace_payload ->
  [:trace, _pid | rest] = trace_payload |> Tuple.to_list()
  rest
  |> inspect()
  |> Logger.debug()
  "~n"
end

[
  {Module, :function, :return_trace}
]
|> :recon_trace.calls({100, 1000}, scope: :local, formatter: formatter)

:recon_trace.clear

# -------------------------------------------------
#  :recon_trace : default formatter
# -------------------------------------------------

[
  {Module, :function, :return_trace}
]
|> :recon_trace.calls({100, 1000}, scope: :local)

:recon_trace.clear

