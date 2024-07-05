defmodule ShoppingCart.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  @impl true
  def start(_type, _args) do
    children = [
      # %{
      #   id: Kaffe.GroupMemberSupervisor,
      #   start: {Kaffe.GroupMemberSupervisor, :start_link, []},
      #   type: :supervisor
      # },
      # Start the Telemetry supervisor
      ShoppingCartWeb.Telemetry,
      # Start the Ecto repository
      ShoppingCart.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ShoppingCart.PubSub},
      # Start Finch
      {Finch, name: ShoppingCart.Finch},
      # Start the Endpoint (http/https)
      ShoppingCartWeb.Endpoint,
      ShoppingCart.PromEx
      # Start a worker by calling: ShoppingCart.Worker.start_link(arg)
      # {ShoppingCart.Worker, arg}

    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShoppingCart.Supervisor]
    Supervisor.start_link(children, opts)
  end
  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ShoppingCartWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
