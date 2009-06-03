class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participant do |t|
      t.column :decision_id, :integer, :null => false
      t.column :position, :integer
      t.column :name, :string, :limit => 100
      t.column :answers, :string, :limit => 100, :default => ' '
    end
  end

  def self.down
    drop_table :participant
  end
end
