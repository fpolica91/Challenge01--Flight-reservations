defmodule FlightReport.Bookings.Report do
  alias FlightReport.Bookings.Agent, as: BookingAgent
  alias FlightReport.Bookings.Booking


  def create(filename \\ "flight_report.csv") do
    flight_list = build_list()
    File.write!(filename, flight_list)
    {:ok, "File created with success!"}
  end

  defp build_list do
    BookingAgent.list_all()
    |>Map.values()
    |>Enum.map(fn(line) -> stringify_booking(line) end)
  end

  defp stringify_booking(%Booking{id_usuario: id_usuario, cidade_origem: cidade_origem, cidade_destino: cidade_destino, id: _id, data_completa: data_completa}) do
    {:ok, date} = data_completa
    "#{id_usuario}, #{cidade_origem}, #{cidade_destino} #{date} \n"
  end
end
