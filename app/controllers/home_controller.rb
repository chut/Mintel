class HomeController < ApplicationController
  def index
  end
 def guildupdate
	#get json data
	url = URI.parse('http://www.btcguild.com')
	res = Net::HTTP.start(url.host, url.port) {|http|
		http.get('/api.php?api_key=66b2217e699a0f8e0e383f7cc937b4f4')
	}
	#make it magic
	data = res.body
	raw = StringScanner.new(data)
	
	#parse the shit out of it
	
	#REWARD TABLE INFO
	raw.skip_until /"confirmed_rewards":/
	@confirmed = raw.scan_until (/,/)
	@confirmed = @confirmed.to_f
	
	raw.skip_until /"unconfirmed_rewards":/
	@unconfirmed = raw.scan_until (/,/)
	@unconfirmed = @unconfirmed.to_f
	
	raw.skip_until /"estimated_rewards":/
	@estimated = raw.scan_until (/,/)
	@estimated = @estimated.to_f
	
	raw.skip_until /"payouts":/
	@payouts = raw.scan_until (/,/)
	@payouts = @payouts.to_f
	
	#skip
	raw.skip_until /"pool"/
	raw.skip_until /"hash_rate":/
	@poolhash = raw.scan_until (/,/)
	@poolhash = @poolhash.to_f
	
	raw.skip_until /"round_time":"/
	@round = raw.scan_until (/"/)
	@roundtime = @round[0,7]
	
	
	
	#where should this go?
	@total_reward = (@confirmed + @unconfirmed + @estimated)
	
	
	#MINER TABLE INFO

#the chut
	raw.pos(0)
	i = 0
	active = 0
	workers[]
	while raw.eos? == false
		i = i + 1
		raw.skip_until /"hash_rate":/
		start = raw.pos()
		rate = raw.scan_until (/,/)
		rate = rate.to_f
		if rate > 0
			active = active + 1
			numpos = start - 55   #GET ACTUAL NUMBER
			raw.pos(numpos)
			raw.skip_until /{"/  #possible issue
			miner_num = scan_until(/"/)
			workers.push(miner_num)
		end
		
		
		
		#other loop/conditional
		#if rate > 0
		#	start = start - 48
		#	@workernum = raw.scan_until (/"/)
		#		@workernum = @workernum.to_i
				
				
				raw.pos(numpos)
				
				workers.each {|x|
				
				@workernum = x
				
				if x > 1
					numpos = numpos + (x * 114)
				end
				
				raw.skip_until /"worker_name":"/
				@workername = raw.scan_until (/"/)
				@workername = @workername[0,13]
				
				raw.skip_until /"hash_rate":/
				@hash = raw.scan_until (/,/)
				@hash = @hash.to_f
				
				raw.skip_until /"round_shares":/
				@roundsh = raw.scan_until (/,/)
				@roundsh = @roundsh.to_i
				
				raw.skip_until /"round_stales":/
				@roundst = raw.scan_until (/,/)
				@roundst = @roundst.to_i
				
				raw.skip_until /"reset_shares":/
				@resetsh = raw.scan_until (/,/)
				@resetsh = @resetsh.to_i
				
				raw.skip_until /"reset_stales":/
				@resetst = raw.scan_until (/,/)
				@resetst = @resetst.to_i
				
				raw.skip_until /"total_shares":/
				@totalsh = raw.scan_until (/,/)
				@totalsh = @totalsh.to_i
				
				raw.skip_until /"last_share":/
				@lastsh = raw.scan_until (/,/)
				@lastshtime = @lastsh[1,7]
				
				render :saveminer =>
				}
				
			
		end
	end

	
	raw.skip_until /"pool"/
	raw.skip_until /"hash_rate":/
	@poolhash = raw.scan_until (/,/)
	@poolhash = @poolhash.to_f
	
	raw.skip_until /"round_time":"/
	@round = raw.scan_until (/"/)
	@roundtime = @round[0,7]
	
	
	

end

def savereward
	r = reward.new #need to be rewards?
	r.confirmed_rewards = @confirmed
	r.estimated_rewards = @estimated
	r.payouts = @payouts
	r.unconfirmed_rewards = @unconfirmed
	r.pool_hash_rate = @poolhash
	r.round_time = @roundtime
	r.save
	end

def saveminer
	m = miner.new #miners?
	m.worker_num = @workernum
	m.worker_name = @workername
	m.hash_rate = @hash
	m.round_shares = @roundsh
	m.round_stales = @roundst
	m.reset_shares = @resetsh
	m.reset_stales = @resetst
	m.total_shares = @totalsh
	m.last_share = @lastshtime
	
end
end
