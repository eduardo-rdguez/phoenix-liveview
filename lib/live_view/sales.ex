defmodule LiveView.Sales do
  def new_orders do
    Enum.random(5..20)
  end

  def sales_amount do
    Enum.random(100..1000)
  end

  def satisfaction do
    Enum.random(90..95)
  end
end
