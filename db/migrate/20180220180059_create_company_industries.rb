class CreateCompanyIndustries < ActiveRecord::Migration[5.1]
  def change
    create_table :company_industries do |t|
      t.belongs_to :company
      t.belongs_to :industry

      t.timestamps
    end
  end
end
