class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      
      t.boolean :is_active, null: false, default: true
      t.string :name
      t.integer :price_excluding_tax
      t.text :description

      t.timestamps
      
    end
  end
end
