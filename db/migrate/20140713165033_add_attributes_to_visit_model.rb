class AddAttributesToVisitModel < ActiveRecord::Migration
  def change
    change_table :visits do |t|
      t.integer :link_id
      t.string :ip_address
    end
  end
end
