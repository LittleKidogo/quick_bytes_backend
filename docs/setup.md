# Getting Up and Running


### Getting Up and Running
This guide assumes you Elixir and Erlang set up on your machine
If not follow the [installation instructions](https://elixir-lang.org/install.html) for your system.
1. Clone the development branch using `git clone git@github.com:LittleKidogo/quick_bytes_backend.git`
2. Follow this [guide](https://github.com/LittleKidogo/spender/blob/develop/docs/postgres_setup.md) to setup postgres on your system if you haven't already
3. From the downloaded `qb_backend` folder run the following
4. Run `mix deps.get` to install dependecies
5. Run `mix ecto.create` to create the application database  
6. Run `mix ecto.migrate` to run the migrations on the created database
7. Run `npm install` in the `assets` directory to install javascript assets
8. Run `MIX_ENV=test mix test` this should exit with a status of 0
9. If you intend on contributing code, set up your local githooks by copying the files in the `/hooks` folder into the `.git` folder `cd hooks && cp * ../.git/hooks && cd ..`
10. Make the precommit hook executable using `chmod +x .git/hooks/pre-commit`
10. Run `mix phx.server` and the application should be available at [localhost:4000](localhost:4000)


##  Ready to hack away!
