defmodule FlightReport do
  alias FlightReport.Users.CreateOrUpdateUser
  alias FlightReport.Bookings.CreateOrUpdateBooking
  alias FlightReport.Users.Agent, as: UserAgent
  alias FlightReport.Bookings.Agent, as: BookingAgent


  defdelegate create_or_update_users(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_bookings(params), to: CreateOrUpdateBooking, as: :call

  def start_link do
    UserAgent.start_link()
    BookingAgent.start_link()
  end
  def hello do
    :world
  end
end
