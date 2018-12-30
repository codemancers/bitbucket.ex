defmodule Bitbucket.Repositories do
  import Bitbucket
  alias Bitbucket.Client

  @moduledoc """
  The Repository Webhooks API allows repository admins to manage the post-receive hooks for a repository.
  """

  @doc """
  List current user's Repositories.


  ## Examples

      Bitbucket.Repositories.list_mine(client)

      Bitbucket.Repositories.list_mine(client, type: "owner")

  More info at: https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories
  """
  @spec list_mine(Client.t(), Keyword.t()) :: Bitbucket.response()
  def list_mine(client, params \\ [], options \\ []) do
    get("/users/#{client.auth.account_id}/repositories", client, params, options)
  end

  @doc """
  List users Repositories.

  ## Example

      Bitbucket.Repositories.list_users(client, "steve")

  More info at: https://developer.github.com/v3/repos/#list-user-repositories
  """
  @spec list_users(Client.t(), binary, Keyword.t(), Keyword.t()) :: Bitbucket.response()
  def list_users(client \\ %Client{}, owner, params \\ [], options \\ []) do
    get("users/#{owner}/repos", client, params, options)
  end

  @doc """
  List organizations Repositories.

  ## Example

      Bitbucket.Repositories.list_orgs(client, "elixir-lang")

  More info at: https://developer.github.com/v3/repos/#list-organization-repositories
  """
  @spec list_orgs(Client.t(), binary, Keyword.t()) :: Bitbucket.response()
  def list_orgs(client \\ %Client{}, org, params \\ [], options \\ []) do
    get("orgs/#{org}/repos", client, params, options)
  end

  @doc """
  List all public repositories

  ## Example

      Bitbucket.Repositories.list_public
      Bitbucket.Repositories.list_public(client)

  More info at: https://developer.github.com/v3/repos/#list-all-public-repositories
  """
  @spec list_public(Client.t(), Keyword.t(), Keyword.t()) :: Bitbucket.response()
  def list_public(client \\ %Client{}, params \\ [], options \\ []) do
    get("/repositories", client, params, Keyword.merge([pagination: :none], options))
  end

  @doc """
  Get

  ## Example

      Bitbucket.Repositories.repo_get("elixir-conspiracy", "pacman")
      Bitbucket.Repositories.repo_get(client, "elixir-conspiracy", "pacman")

  More info at: https://developer.github.com/v3/repos/#get
  """
  @spec repo_get(Client.t(), binary, binary, Keyword.t()) :: Bitbucket.response()
  def repo_get(client \\ %Client{}, owner, repo, params \\ []) do
    get("repos/#{owner}/#{repo}", client, params)
  end

  @doc """
  Create a new repository for the authenticated user.

  Possible values for `options`:

  * [description: "Simple Elixir wrapper for the GitHub API"]
  * [homepage: "http://www.github.com/edgurgel/tentacat"]
  * [private: false]
  * [has_issues: true]
  * [has_wiki: false]
  * [has_downloads: true]
  * [team_id: 123]
  * [auto_init: false]
  * [gitignore_template: "Haskell"]
  * [license_template: "mit"]j

  ## Example

      Bitbucket.Repositories.create(client, "tentacat", private: false)

  More info at: https://developer.github.com/v3/repos/#create
  """
  @spec create(Client.t(), binary, list) :: Bitbucket.response()
  def create(client, repo, options \\ []) do
    post("user/repos", client, List.flatten([name: repo], options))
  end

  @spec org_create(Client.t(), binary, binary, list) :: Bitbucket.response()
  def org_create(client, org, repo, options \\ []) do
    post("orgs/#{org}/repos", client, List.flatten([name: repo], options))
  end

  @doc """
  Deleting a repository requires admin access. If OAuth is used, the delete_repo scope is required.

  ## Example

      Bitbucket.Repositories.delete("soudqwiggle", "tentacat", client)

  More info at: https://developer.github.com/v3/repos/#delete-a-repository
  """
  @spec delete(Client.t(), binary, binary) :: Bitbucket.response()
  def delete(client, owner, repo) do
    delete("repos/#{owner}/#{repo}", client)
  end
end
