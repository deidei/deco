class CreateDailyReports < ActiveRecord::Migration
  def up
    create_table :daily_reports do |t|
      t.belongs_to :user
      t.date :date
      t.text :commitment
      t.text :plan
      t.text :problem
      t.timestamps
    end
  end

  def down
  end
end
