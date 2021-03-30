defmodule FlightReport.Bookings.Agent do
  alias FlightReport.Bookings.Booking
  use Agent
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end


  def save(%Booking{} = booking) do
    Agent.update(__MODULE__, &update_state(&1, booking))
    {:ok, booking.id}
  end

  def list_all do
    Agent.get(__MODULE__, & &1)
  end

  def list_by_date(date_from, date_to) do
    filtered_fly_list = list_all()
    |>Map.values()
    |>Enum.filter(fn(x) -> filter_by_date(date_from, date_to, x.data_completa) end)
    cond do
      Enum.empty?(filtered_fly_list)  ->{:error, "Invalid dates"}
      length(filtered_fly_list) > 0 -> {:ok, filtered_fly_list}
    end
  end



  defp filter_by_date(date_from, date_to, date) do
   (Date.compare(date_from, date) == :lt ) && (Date.compare(date_to, date) == :gt)

  end

  defp update_state(state, %Booking{id: id} = booking) do
    Map.put(state, id, booking)
  end

  def get(id) do
    Agent.get(__MODULE__, &get_booking_record(&1, id))
  end

  defp get_booking_record(state, id) do
    case Map.get(state, id) do
     nil -> {:error, "Record not found!"}
     booking -> {:ok, booking}
    end
  end
end
