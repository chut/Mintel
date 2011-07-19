class CreateMiners < ActiveRecord::Migration
  def self.up
    create_table :miners do |t|
      t.integer :mintelid
      t.timestamp :time
      t.integer :miner_num
      t.string :miner_name
	t.float :hash_rate
      t.integer :round_shares
      t.integer :round_stales
      t.integer :reset_shares
      t.integer :reset_stales
      t.integer :total_shares
      t.time :last_share
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :miners
  end
end
