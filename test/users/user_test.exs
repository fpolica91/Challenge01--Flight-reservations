defmodule FlightReportTest.Users.UserTest do
  use ExUnit.Case
  import FlightReport.Factory
  alias FlightReport.Users.User
  describe "build/3" do
    test "creates a new user" do
    {:ok, response} = User.build("chloe antonio", "chloe@gmail.com","33445")
    assert response == %User{cpf: "33445", email: "chloe@gmail.com", id: response.id, name: "chloe antonio"}
   end
  end
end
