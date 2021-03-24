defmodule FlightReport.Users.Agent do
  alias FlightReport.Users.User
  use Agent
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end


  def save(%User{} = user) do
    Agent.update(__MODULE__, &update_state(&1, user))
    {:ok, user.id}
  end


  defp update_state(state, %User{id: id} = user) do
    Map.put(state, id, user)
  end

  def get(id) do
    Agent.get(__MODULE__, &get_user_record(&1, id))
  end


  defp get_user_record(state, id) do
    case Map.get(state, id) do
     nil -> {:error, "Record not found!"}
     user -> {:ok, user}
    end
  end
end
