class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.text :content
      t.boolean :is_answer
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
