# Überauth Twitch.tv

> Twitch.tv OAuth2 strategy for Überauth.

## Installation

1. Setup your application at [Twitch.tv Developer](https://www.twitch.tv/kraken/oauth2/clients/new).

1. Add `:ueberauth_twitch` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ueberauth_twitch, "~> 0.3.0"}]
    end
    ```

1. Add the strategy to your applications:

    ```elixir
    def application do
      [applications: [:ueberauth_twitch]]
    end
    ```

1. Add Twitch.tv to your Überauth configuration:

    ```elixir
    config :ueberauth, Ueberauth,
      providers: [
        twitch: {Ueberauth.Strategy.Twitch, []}
      ]
    ```

1.  Update your provider configuration:

    ```elixir
    config :ueberauth, Ueberauth.Strategy.Twitch.OAuth,
      client_id: System.get_env("TWITCH_CLIENT_ID"),
      client_secret: System.get_env("TWITCH_CLIENT_SECRET")
    ```

1.  Include the Überauth plug in your controller:

    ```elixir
    defmodule MyApp.AuthController do
      use MyApp.Web, :controller
      plug Ueberauth
      ...
    end
    ```

1.  Create the request and callback routes if you haven't already:

    ```elixir
    scope "/auth", MyApp do
      pipe_through :browser

      get "/:provider", AuthController, :request
      get "/:provider/callback", AuthController, :callback
    end
    ```

1. You controller needs to implement callbacks to deal with `Ueberauth.Auth` and `Ueberauth.Failure` responses.

For an example implementation see the [Überauth Example](https://github.com/ueberauth/ueberauth_example) application.

## Calling

Depending on the configured url you can initial the request through:

    /auth/twitch

Or with options:

    /auth/twitch?scope=user,public_repo

By default the requested scope is "user,public\_repo". Scope can be configured either explicitly as a `scope` query value on the request path or in your configuration:

```elixir
config :ueberauth, Ueberauth,
  providers: [
    twitch: {Ueberauth.Strategy.Twitch, [default_scope: "user_read,channel_read"]}
  ]
```

## License

Please see [LICENSE](https://github.com/tim-machine/ueberauth_twitch/blob/master/LICENSE) for licensing details.
