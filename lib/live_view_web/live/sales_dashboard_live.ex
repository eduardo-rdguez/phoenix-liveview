defmodule LiveViewWeb.SalesDashboardLive do
  use LiveViewWeb, :live_view

  alias LiveView.Sales

  def mount(_params, _session, socket) do
    socket = assign_stats(socket)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Sales Dashboard</h1>
    <div id="dashboard">
      <div class="stats">
        <div class="stat">
          <span class="value">
            <%= @new_orders %>
          </span>
          <span class="name">
            New Orders
          </span>
        </div>
        <div class="stat">
          <span class="value">
            $<%= @sales_amount %>
          </span>
          <span class="name">
            Sales Amount
          </span>
        </div>
        <div class="stat">
          <span class="value">
            <%= @satisfaction %>%
          </span>
          <span class="name">
            Satisfaction
          </span>
        </div>
      </div>

      <button phx-click="refresh">
        <img src="images/refresh.svg" alt="refresh-image">
        Refresh
      </button>
    </div>
    """
  end

  defp assign_stats(socket) do
    assign(
      socket,
      new_orders: Sales.new_orders(),
      sales_amount: Sales.sales_amount(),
      satisfaction: Sales.satisfaction()
    )
  end

  def handle_event("refresh", _params, socket) do
    socket = assign_stats(socket)
    {:noreply, socket}
  end
end
