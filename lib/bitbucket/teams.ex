defmodule Bitbucket.Teams do
  import Bitbucket
  alias Bitbucket.Client

  @moduledoc """
  Teams API allows user to access ones teams.
  """

  @doc """
  List current user's Teams


  ## Examples

      Bitbucket.Teams.list_mine(client)

  More info at: https://developer.atlassian.com/bitbucket/api/2/reference/resource/teams
  """
  @spec list_mine(Client.t(), Keyword.t()) :: Bitbucket.response()
  def list_mine(client, params \\ [], options \\ []) do
    get("/teams", client, params, options)
  end
end
