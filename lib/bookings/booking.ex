defmodule FlightReport.Bookings.Booking do
  alias FlightReport.Bookings.Date, as: FlightDate
  @keys [:id, :data_completa, :cidade_origem, :cidade_destino, :id_usuario]
  @enforce_keys @keys

  defstruct @keys

  def build(data_completa, cidade_origem, cidade_destino, id_usuario) do
    formatted_date = FlightDate.build(data_completa)
    uuid = UUID.uuid4()
    {:ok, %__MODULE__{
      id: uuid,
      data_completa: formatted_date,
      cidade_origem: cidade_origem,
      cidade_destino: cidade_destino,
      id_usuario: id_usuario
    }
  }
  end





end
