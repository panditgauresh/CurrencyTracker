task :travis do
  ["rake test", "rake cucumber"].each do |cmd|
    puts "Starting to run #{cmd}..."
    system("set DISPLAY=:99.0 && bundle exec #{cmd}")
    raise "#{cmd} failed!" unless $?.exitstatus == 0
  end
end
