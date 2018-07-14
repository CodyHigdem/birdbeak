defmodule BirdbeakWeb.Router do
  use BirdbeakWeb, :router

  alias Birdbeak.Guardian

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/", BirdbeakWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api/v1", BirdbeakWeb do
     pipe_through :api

     post "/sign_up", UserController, :create
     post "/sign_in", UserController, :sign_in

     #resources "/users", UserController, only: [:create, :show]
     """
     By adding only: [:create, :show] to our public API route, we are only allowing unauthenticated users
     to access our controller’s create and show functions; unauthenticated users can not access delete,
     update, or any other UserController methods through this public endpoint.
     """
   end



  # Other scopes may use custom stacks.
  # scope "/api", BirdbeakWeb do
  #   pipe_through :api
  # end
end
