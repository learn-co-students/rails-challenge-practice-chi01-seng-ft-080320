class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.belongs_to :building, foreign_key: true
      t.belongs_to :company, foreign_key: true
      t.integer :floor

      t.timestamps
    end
  end
end
