task :default => [:android, :ios, :web, :windows_phone]

task :android do
  task = ARGV.last
  Dir.chdir 'android'
  system "rake #{task}"
  task task.to_sym do ; end
end

task :ios do
  task = ARGV.last
  Dir.chdir 'ios'
  system "rake #{task}"
  task task.to_sym do ; end
end

task :web do
  task = ARGV.last
  Dir.chdir 'web'
  system "rake #{task}"
  task task.to_sym do ; end
end

task :windows_phone do
  task = ARGV.last
  Dir.chdir 'windows-phone'
  system "rake #{task}"
  task task.to_sym do ; end
end