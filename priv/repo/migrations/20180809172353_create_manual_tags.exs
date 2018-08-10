defmodule QbBackend.Repo.Migrations.CreateManualTags do
  use Ecto.Migration

  def change do
    create table(:manual_tags, primary_key: false) do
      add :tag_id, references(:manuals, on_delete: :nothing, type: :binary_id)
      add :manual_id, references(:tag, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
    create unique_index(:manual_tags, [:tag_id, :manual_id])
  end
end
