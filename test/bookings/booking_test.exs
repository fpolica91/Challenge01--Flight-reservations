defmodule FlightReportTest.Bookings.BookingTest do
  use ExUnit.Case
  import FlightReport.Factory
  alias FlightReport.Bookings.Booking
  describe "build/4" do
    test "creates a booking" do
      date = %{year: 2021, month: 06, day: 30, hour: 5, minute: 30}
      {:ok, response } = Booking.build(date, "Banana Town", "Banana Port", "33456262")
      booking = build(:booking, id: response.id, id_usuario: "33456262")
      assert response == booking
   end
  end
end
