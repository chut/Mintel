class CreateRewards < ActiveRecord::Migration
  def self.up
    create_table :rewards do |t|
      t.timestamp :time
      t.float :confirmed_reward
	t.float :estimated_rewards
      t.float :payouts
      t.float :unconfirmed_rewards
       t.time :last_share
      t.float :pool_hash_rate
      t.time :round_time

      t.timestamps
    end
  end

  def self.down
    drop_table :rewards
  end
end
