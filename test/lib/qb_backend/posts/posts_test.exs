defmodule QbBackend.PostsTest do
  @moduledoc """
  This module holds unit tests for functions in the posts context
  """
  use QbBackend.DataCase

  alias QbBackend.{
    Posts,
    Posts.Manual
  }

  @id "a7062358-021d-4273-827a-87c38cb213fe"
  @valid_manual %{title: "1,000 ways to die", body: " 1. Death by paperbag"}
  describe "Posts Context" do
    test "get_manual/1 gets a manual if one exists" do
        manual = insert(:manual)
        assert {:ok, %Manual{} = mnl} = Posts.get_manual(manual.id)
        assert manual.id == mnl.id
    end

    test "get_manual/1 returns an error is a manual does not exist" do
        assert Repo.aggregate(Manual, :count, :id) == 0
        assert {:error, "No Manual with id: #{@id} on the system"} == Posts.get_manual(@id)
    end

    test "create_manual/1 saves manual with valid data" do
       profile = insert(:profile)
       assert Repo.aggregate(Manual, :count, :id) == 0
       assert {:ok, %Manual{} = mnl} =  Posts.create_manual(profile, @valid_manual)
       assert Repo.aggregate(Manual, :count, :id) == 1
    end

    test "create_manual/1 returns an error with invalid data" do
        profile = insert(:profile)
        assert Repo.aggregate(Manual, :count, :id) == 0
        assert {:error, _} = Posts.create_manual(profile, %{})
        assert Repo.aggregate(Manual, :count, :id) == 0
    end

    test "update_manual/2 updates a saved manual" do
        manual = insert(:manual)
        assert Repo.aggregate(Manual, :count, :id) == 1
        assert {:ok, %Manual{} = mnl} =  Posts.update_manual(manual, @valid_manual)
        assert Repo.aggregate(Manual, :count, :id) == 1
        assert mnl.id == manual.id
        assert mnl.title != manual.title
    end

    @tag :update
    test "update_manual/2 returns an error with invalid data" do
        manual = insert(:manual)
        assert Repo.aggregate(Manual, :count, :id) == 1
        assert {:error, _} = Posts.update_manual(manual, %{title: 12})
        assert Repo.aggregate(Manual, :count, :id) == 1
        saved_manual = Repo.one(Manual)
        assert saved_manual.id == manual.id
        assert saved_manual.title == manual.title
    end
  end
end
