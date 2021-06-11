class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.references :user
      t.text :categories_id

      t.timestamps
    end
  end
end
