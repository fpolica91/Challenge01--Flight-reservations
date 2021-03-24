defmodule FlightReport.Bookings.Date do
  @keys [:year, :month, :day, :hour, :minute, :second]
  @enforce_keys @keys
  defstruct @keys

  def build(%{year: year, month: month, day: day, hour: hour, minute: minute}) do
    second = 0
    data_completa = NaiveDateTime.new!(year, month, day, hour, minute, second)
    # |>to_string()
    data_completa
  end
end
