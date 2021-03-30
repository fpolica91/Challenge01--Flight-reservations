
defmodule FlightReportTest.Users.AgentTest do
  use ExUnit.Case
  import FlightReport.Factory
  # alias FlightReport.Users.User
  alias FlightReport.Users.Agent, as: UserAgent

  describe "save/1" do
    test "saves a user in in the agent" do
      UserAgent.start_link()
      user = build(:user)
      response = UserAgent.save(user)
      assert response == {:ok, user.id}
    end
   end


   describe "get/1" do
    setup do
      UserAgent.start_link()
      :ok
    end
    test "gets a user" do
      factory_user = build(:user)
      UserAgent.save(factory_user)
      response = UserAgent.get(factory_user.id)
      assert response == {:ok, factory_user}
    end

    test "returns an error with invalid id" do
      response = UserAgent.get("1235151")
      assert response == {:error, "Record not found!"}
    end

   end

end
