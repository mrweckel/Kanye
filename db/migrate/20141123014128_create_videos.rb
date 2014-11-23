class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :uid
      t.references :user

      t.timestamps
    end
  end
end
