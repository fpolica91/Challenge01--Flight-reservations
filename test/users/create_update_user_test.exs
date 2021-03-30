
defmodule FlightReportTest.Users.CreateOrUpdateUserTest do
  use ExUnit.Case
  alias FlightReport.Users.CreateOrUpdateUser
  alias FlightReport.Users.User
  alias FlightReport.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      UserAgent.start_link()
      :ok
    end
    test "creates a user and saves it to or updates it in agent" do
      assert {:ok, _thing} = CreateOrUpdateUser.call(name: "chloe", email: "chloe124", cpf: "12351")
    end
   end
end
