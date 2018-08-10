defmodule QbBackend.Posts.TagTest do
  @moduledoc"""
  This module holds tests for the changeset functions under tag
"""
  use QbBackend.DataCase

  alias QbBackend.{
    Posts.Tag
    }
    @valid_tag %{name: "@cshikoh"}
    @invalid_tag %{}

    describe "Tag Test" do
      test "Valid if the name parameter is available" do
        changeset = Tag.changeset(%Tag{},@valid_tag)
        assert changeset.valid?
      end
      test "Invalid if the name parameter is not right" do
        changeset = Tag.changeset(%Tag{},@invalid_tag)
        refute changeset.valid?
      end
  end
end