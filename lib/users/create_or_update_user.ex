defmodule FlightReport.Users.CreateOrUpdateUser do
  alias FlightReport.Users.Agent, as: UserAgent
  alias FlightReport.Users.User

  # we need to create a user and save the user to userAgent
  # name, email, cpf
  def call(name: name, email: email, cpf: cpf) do
    {:ok, user} = User.build(name, email, cpf)
    user
    |>save_user()
  end

  defp save_user(%User{} = user) do
    UserAgent.save(user)
    {:ok, "User Saved Successfully"}
  end

  defp save_user({:error, _reason}= error), do: error
end
