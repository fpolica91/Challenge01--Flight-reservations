defmodule FlightReportTest.Bookings.CreateOrUpdateUserTest do
  use ExUnit.Case
  import FlightReport.Factory
  alias FlightReport.Bookings.CreateOrUpdateBooking
  alias FlightReport.Users.Agent, as: UserAgent
  alias FlightReport.Bookings.Agent, as: BookingAgent

  describe "call/1" do
    setup do
      BookingAgent.start_link()
      UserAgent.start_link()
      :ok
    end
    test "crates a booking and saves it to agent" do
      user = build(:user)
      UserAgent.save(user)

      booking_params = %{
        user_id: user.id,
        data_completa: "2022, 06, 25, 5, 45",
        cidade_origem: "New York",
        cidade_destino: "Miami"
      }
       CreateOrUpdateBooking.call(booking_params)
      assert {:ok, _uuid} = CreateOrUpdateBooking.call(booking_params)
    end
      test "returns an error with an invalid user" do
        booking_params = %{
          user_id: "99987888",
          data_completa: "2022, 06, 25, 5, 45",
          cidade_origem: "New York",
          cidade_destino: "Miami"
        }
        response = CreateOrUpdateBooking.call(booking_params)
        assert response == {:error, "Record not found!"}
      end
   end
end
