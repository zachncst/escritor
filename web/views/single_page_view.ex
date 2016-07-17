defmodule Escritor.SinglePageView do
  use Escritor.Web, :view

  def render("index.html", opts) do
    props = %{}
    if opts[:message], do: props = Map.put(props, :message, opts[:message])

    result = Escritor.ReactIo.json_call(%{
          component: "./priv/server/js/component.js",
          props: props, })

    render "app.html", html: elem(result,1)["html"], props: props
  end
end

