use Mix.Config

config :logger, level: :debug

config :curso_elixir, CursoElixir.Scheduler,
  jobs: [
    # application_task: [
    #   schedule: {:extended, "* * * * *"},
    #   task: {JobQuantum, :print, ["Hola", 1]}
    # ],
    # application_task1: [
    #   schedule: {:extended, "* * * * *"},
    #   task: fn -> File.write("tmp/task.txt", "Hi, world", [:append]) end
    # ],
    application_task2: [
      schedule: {:extended, "* * * * *"},
      task: {JobQuantum, :print_text, ["tmp/increment.txt", "Hola "]}
    ]

  #   # Every minute
  #   #{"* * * * *",      {Heartbeat, :send, []}},
  #   # Every 15 minutes
  #   #{"*/15 * * * *",   fn -> System.cmd("rm", ["/tmp/tmp_"]) end},
  #   # Runs on 18, 20, 22, 0, 2, 4, 6:
  #   #{"0 18-6/2 * * *", fn -> :mnesia.backup('/var/backup/mnesia') end},
  #   # Runs every midnight:
  #   #{"@daily",         {Backup, :backup, []}}
 ]

  # jobs: [
  #   # cada segundo
  #   {{:extended, "* * * * *"}, {JobQuantum, :print, ["Hola",1]}},

  # ]
