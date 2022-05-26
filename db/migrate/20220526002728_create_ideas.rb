class CreateIdeas < ActiveRecord::Migration[7.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
