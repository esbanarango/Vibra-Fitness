class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines, :id => false do |t|
    	t.integer :client_id
      	t.integer :schedule_id
      	t.integer :machine_num
    end
  end
end
