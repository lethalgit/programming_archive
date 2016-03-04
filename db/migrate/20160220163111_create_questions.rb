class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :slug
      t.string :submissions
      t.string :accuracy
      t.string :url
      t.string :platform
      t.string :tags
      t.string :languages_allowed
      t.date :date_added

      t.timestamps null: false
    end
  end
end
