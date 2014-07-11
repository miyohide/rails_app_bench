class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.references :entry

      t.timestamps
    end
  end
end
