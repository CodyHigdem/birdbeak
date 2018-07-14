defmodule Birdbeak.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :MyApi,
  module: Birdbeak.Guardian,
  error_handler: Birdbeak.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
