class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :author_id
      t.string :title
      t.text :description
      t.string :video_url

      t.timestamps
    end
  end
end
