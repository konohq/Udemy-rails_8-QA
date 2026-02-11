class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.string :name
      t.string :title
      t.text :content
      t.bigint "user_id"

      t.timestamps
    end
  end
end
