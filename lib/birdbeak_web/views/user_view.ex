defmodule BirdbeakWeb.UserView do
  use BirdbeakWeb, :view
  alias BirdbeakWeb.UserView

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      password_hash: user.password_hash}
  end
end
