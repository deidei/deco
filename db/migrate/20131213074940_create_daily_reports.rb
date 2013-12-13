class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.belongs_to :user
      t.date :date
      t.text :commitment
      t.text :plan
      t.text :problem
      t.timestamps
    end
  end
end
