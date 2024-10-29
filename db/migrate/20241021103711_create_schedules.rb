class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.text :description
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
