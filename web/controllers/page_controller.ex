defmodule Escritor.PageController do
  use Escritor.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
