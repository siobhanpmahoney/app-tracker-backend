class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :size
      t.string :location
      t.text :description
      t.integer :museId
      t.string :twitter
      t.string :image_link
      t.belongs_to :industry

      t.timestamps
    end
  end
end
