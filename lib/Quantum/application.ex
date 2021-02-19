defmodule CursoElixir.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # This is the new line
      CursoElixir.Scheduler
    ]

    opts = [strategy: :one_for_one, name: CursoElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
