require "rubygems"
require "twitter"

check_interval = 600
Twitter.configure do |config|
  config.consumer_key = "paste in your own"
  config.consumer_secret = "paste in your own"
  config.oauth_token = "paste in your own"
  config.oauth_token_secret = "paste in your own"
end

firstrun = 1
core_files = Array.new
twitterheader = ["OMGWTFBBQ new coredump ", "Core dump hooooooo ", "App sh4t the bed ", "I love the smell of segfault in the morning ", "Two words: byte turd "]

print "\nhonggtweet - core dump watcher for honggfuzz for twitter -- Tom Van de Wiele 2011\n\n"

while true
   if firstrun == 1 then
      # index stuff we already know about so we don't cry wolf
      pwd = Dir.pwd
      Dir.foreach(pwd) do |dir|
         if dir =~ /^fuzz_/ then
            Dir.foreach(dir) do |fuzzfile|
               if fuzzfile =~ /^SIGSEGV/ then
                  core_files.push(fuzzfile)
               end
            end
         end
      end
      firstrun = 0
      puts "[-] Indexed existing coredumps."
   end
   puts "[-] Looking for new coredumps ..."
   pwd = Dir.pwd
   Dir.foreach(pwd) do |dir|
      if dir =~ /^fuzz_/ then
         Dir.foreach(dir) do |fuzzfile|
            if fuzzfile =~ /^SIGSEGV/ then
            if !core_files.include?(fuzzfile) then
               core_files.push(fuzzfile)
                  client = Twitter::Client.new
                  prefix = twitterheader[rand(twitterheader.size)]
                  app = dir.sub!("fuzz_", "")
                  msg = prefix.to_s() + "(" + app.to_s() + ") - " + fuzzfile.to_s()
                  msg = msg [0..139] # 140 chars max
                  client.update(msg)
                  puts "[!] #{msg} - tweeted the crap out of that!"
               end
            end
         end
      end
   end
   puts "[-] Sleeping for #{check_interval}s..."
   sleep(check_interval)
end