defmodule FlightReport do
  alias FlightReport.Users.CreateOrUpdateUser
  alias FlightReport.Users.Agent, as: UserAgent

  defdelegate create_or_update_users(params), to: CreateOrUpdateUser, as: :call

  def start_link do
    UserAgent.start_link()
  end
  def hello do
    :world
  end
end
