defmodule SharedShopper.PageController do
  use SharedShopper.Web, :controller
  plug :put_layout, "splash.html"

  def index(conn, _params) do
    render conn, "index.html"
  end
end
