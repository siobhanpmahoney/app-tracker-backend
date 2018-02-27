class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :date_published
      t.text :contents
      t.integer :museId
      t.string :location
      t.string :level
      t.datetime :date_saved
      t.boolean :applied_status
      t.string :date_applied
      t.string :response_date
      t.string :followup_date
      t.boolean :interview_invite
      t.string :interview_1_date
      t.string :interview_1_type
      t.string :interview_2_date
      t.string :interview_2_type
      t.string :interview_3_date
      t.string :interview_3_type
      t.integer :company_museId
      t.belongs_to :company

      t.timestamps
    end
  end
end
