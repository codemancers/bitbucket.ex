defmodule Bitbucket.Client do
  defstruct auth: nil, endpoint: "https://api.bitbucket.org/2.0"

  @type auth :: %{access_token: binary, account_id: binary}
  @type t :: %__MODULE__{auth: auth | nil, endpoint: binary}

  @spec new() :: t
  def new(), do: %__MODULE__{}

  @spec new(binary) :: t
  def new(endpoint) when is_binary(endpoint) do
    pnew(nil, endpoint)
  end

  @spec new(map()) :: t
  def new(auth = %{access_token: _, account_id: _}), do: %__MODULE__{auth: auth}

  @spec new(map(), binary) :: t
  def new(auth = %{access_token: _, account_id: _}, endpoint) do
    pnew(auth, endpoint)
  end

  @spec new(auth, binary) :: t
  defp pnew(auth, endpoint) do
    endpoint =
      if String.ends_with?(endpoint, "/") do
        endpoint
      else
        endpoint <> "/"
      end

    %__MODULE__{auth: auth, endpoint: endpoint}
  end
end
