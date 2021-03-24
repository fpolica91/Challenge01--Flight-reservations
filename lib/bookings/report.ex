defmodule FlightReport.Bookings.Report do
  alias FlightReport.Bookings.Agent, as: BookingAgent
  alias FlightReport.Bookings.Booking


  def create(filename \\ "flight_report.csv") do
    flight_list = build_list()
    File.write!(filename, flight_list)
    {:ok, "File created with success!"}
  end

  def create_by_dates(date_from, date_to) do
    {:ok, flight_list} = BookingAgent.list_by_date(date_from, date_to)
    flies = Enum.map(flight_list, fn(line) -> stringify_booking(line) end)
    File.write!("flights_by_date.csv", flies)
    {:ok, "flights found and reported, please check flights_by_date.csv"}
  end

  defp build_list do
    BookingAgent.list_all()
    |>Map.values()
    |>Enum.map(fn(line) -> stringify_booking(line) end)
  end
# (~D[2021-03-16], ~D[2022-04-16])
  defp stringify_booking(%Booking{id_usuario: id_usuario, cidade_origem: cidade_origem, cidade_destino: cidade_destino, id: _id, data_completa: data_completa}) do
    "#{id_usuario}, #{cidade_origem}, #{cidade_destino} #{data_completa} \n"
  end
end
