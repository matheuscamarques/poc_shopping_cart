FROM bitwalker/alpine-elixir-phoenix:latest

WORKDIR /app

COPY mix.exs .
COPY mix.lock .
RUN mix deps.get
CMD && mix prom_ex.gen.config --datasource prometheus:9090 && mix setup && mix phx.server