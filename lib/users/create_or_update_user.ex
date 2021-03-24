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
    {:ok, user.id}
  end

  defp save_user({:error, _reason}= error), do: error
end
  #  FlightReport.create_or_update_bookings(%{
  #   cidade_destino: "Rio",
  #   cidade_origem: "SP",
  #   data_completa: "2021, 06, 25, 5, 40",
  #   user_id: "37821383-8633-4464-8ca4-eb8852de64be"
  # })
