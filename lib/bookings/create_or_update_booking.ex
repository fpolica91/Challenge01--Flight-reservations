defmodule FlightReport.Bookings.CreateOrUpdateBooking do
  alias FlightReport.Bookings.Agent, as: BookingAgent
  alias FlightReport.Users.Agent, as: UserAgent
  alias FlightReport.Bookings.Booking


  # we need to create a user and save the user to userAgent
  # name, email, cpf
  def call(
    %{
    user_id: user_id,
    data_completa: data_completa,
    cidade_origem: cidade_origem,
    cidade_destino: cidade_destino
    }
    ) do

    date_list = format_date_string(data_completa)
    [year, month, day, hour, minute] = date_list

    formatted_date = %{year: year, month: month, day: day, hour: hour, minute: minute}
    with {:ok, id_usuario} <- UserAgent.get(user_id),
    {:ok, booking} <- Booking.build(formatted_date, cidade_origem, cidade_destino, id_usuario.id)
    do
      BookingAgent.save(booking)
    else error -> error
    end
  end

  def format_date_string(date) do
      date
      |>String.split(",")
      |>Enum.map(&String.to_integer(String.trim(&1)))
  end
end
