defmodule FlightReport.Factory do
  use ExMachina
  alias FlightReport.Users.User
  alias FlightReport.Bookings.Booking
  alias FlightReport.Bookings.Date, as: FlightDate

  def date_factory do
    date = %{year: 2021, month: 06, day: 30, hour: 5, minute: 30}
    FlightDate.build(date)
  end


  def booking_factory do
    user = build(:user)
    uuid = UUID.uuid4()
    formatted_date = build(:date)
    %Booking{
      id: uuid,
      data_completa: formatted_date,
      cidade_origem: "Banana Town",
      cidade_destino: "Banana Port",
      id_usuario: user.id
    }
  end

  def user_factory do
    uuid = UUID.uuid4()
    %User{
      id: uuid,
      name: "Chloe",
      email: "chloe@gmail.com",
      cpf: "122345251"
    }
  end
end
