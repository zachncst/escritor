ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Escritor.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Escritor.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Escritor.Repo)

