class ChangeEventsColumn < ActiveRecord::Migration[7.0]
  def change
    change_table :events do |t|
      t.remove :datetime
      t.datetime "date_time"
    end
  end
end
