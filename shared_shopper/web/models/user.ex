defmodule SharedShopper.User do
 use SharedShopper.Web, :model

 schema "users" do
   field :email, :string
   field :password_hash, :string
   field :name, :string
   field :username, :string

   timestamps()
 end

 @doc """
 Builds a changeset based on the `struct` and `params`.
 """
   def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password_hash, :name, :username])
    |> validate_required([:email, :password_hash, :name, :username])
    |> validate_format(:email, ~r/@/)
  end

  defp put_password_hash(changeset) do
  case changeset do
    %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
      put_change(changeset, :password_hash,
                 Comeonin.Bcrypt.hashpwsalt(pass))
    _ ->
      changeset
  end
end
end
