
defmodule FlightReportTest.Bookings.AgentTest do
  use ExUnit.Case
  import FlightReport.Factory
  # alias FlightReport.Users.User
  alias FlightReport.Bookings.Agent, as: BookingAgent

  describe "save/1" do
    setup  do
      BookingAgent.start_link()
      :ok
    end
    test "saves booking to agent" do
      booking = build(:booking)
      response = BookingAgent.save(booking)
      assert {:ok, _id} = response
    end
   end

   describe "get/1" do
    setup  do
      BookingAgent.start_link()
      :ok
    end
    test "gets a booking from database" do
     {:ok, id} = build(:booking)
      |>BookingAgent.save()
       assert {:ok, _booking} = BookingAgent.get(id)
    end

    test "returns an error if booking is not found" do
     assert BookingAgent.get("123245151") == {:error, "Record not found!"}
    end
   end




  #  describe "get/1" do
  #   setup do
  #     UserAgent.start_link()
  #     :ok
  #   end
  #   test "gets a user" do
  #     factory_user = build(:user)
  #     UserAgent.save(factory_user)
  #     response = UserAgent.get(factory_user.id)
  #     assert response == {:ok, factory_user}
  #   end

  #   test "returns an error with invalid id" do
  #     response = UserAgent.get("1235151")
  #     assert response == {:error, "Record not found!"}
  #   end

  #  end

end
