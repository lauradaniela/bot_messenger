defmodule BotWeb.UserControllerTest do
  use BotWeb.ConnCase

  alias Bot.Clients
  alias Bot.Clients.User

  @create_attrs %{correo: "some correo", phone_number: "some phone_number", project: "some project", psid: "some psid", screen_name: "some screen_name"}
  @update_attrs %{correo: "some updated correo", phone_number: "some updated phone_number", project: "some updated project", psid: "some updated psid", screen_name: "some updated screen_name"}
  @invalid_attrs %{correo: nil, phone_number: nil, project: nil, psid: nil, screen_name: nil}

  def fixture(:user) do
    {:ok, user} = Clients.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get conn, user_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, user_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "correo" => "some correo",
        "phone_number" => "some phone_number",
        "project" => "some project",
        "psid" => "some psid",
        "screen_name" => "some screen_name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put conn, user_path(conn, :update, user), user: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, user_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "correo" => "some updated correo",
        "phone_number" => "some updated phone_number",
        "project" => "some updated project",
        "psid" => "some updated psid",
        "screen_name" => "some updated screen_name"}
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete conn, user_path(conn, :delete, user)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, user_path(conn, :show, user)
      end
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
