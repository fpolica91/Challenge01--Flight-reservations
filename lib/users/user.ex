defmodule FlightReport.Users.User do

  @keys [:id, :name, :email, :cpf]
  @enforce_keys @keys

  defstruct @keys

  def build(name, email, cpf) do
    case build_user(name, email, cpf) do
      {:ok, user} -> {:ok, user}
      {:error, _reason} = error -> error
    end
  end


  defp build_user(name, email, cpf) do
    uuid = UUID.uuid4()
    {:ok,
      %__MODULE__{
        id: uuid,
        name: name,
        email: email,
        cpf: cpf
      }
    }
  end


end
