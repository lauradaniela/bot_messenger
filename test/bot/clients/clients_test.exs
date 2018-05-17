defmodule Bot.ClientsTest do
  use Bot.DataCase

  alias Bot.Clients

  describe "users" do
    alias Bot.Clients.User

    @valid_attrs %{correo: "some correo", phone_number: "some phone_number", project: "some project", psid: "some psid", screen_name: "some screen_name"}
    @update_attrs %{correo: "some updated correo", phone_number: "some updated phone_number", project: "some updated project", psid: "some updated psid", screen_name: "some updated screen_name"}
    @invalid_attrs %{correo: nil, phone_number: nil, project: nil, psid: nil, screen_name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Clients.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Clients.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Clients.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Clients.create_user(@valid_attrs)
      assert user.correo == "some correo"
      assert user.phone_number == "some phone_number"
      assert user.project == "some project"
      assert user.psid == "some psid"
      assert user.screen_name == "some screen_name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clients.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Clients.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.correo == "some updated correo"
      assert user.phone_number == "some updated phone_number"
      assert user.project == "some updated project"
      assert user.psid == "some updated psid"
      assert user.screen_name == "some updated screen_name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Clients.update_user(user, @invalid_attrs)
      assert user == Clients.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Clients.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Clients.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Clients.change_user(user)
    end
  end
end
