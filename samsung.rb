#!/usr/bin/ruby

#User input
#File name can be changed to a default of course if requested...
#puts "what is the file name?(or full path of the file--for file that is outside of current directory)"
#filename = gets.chomp
# puts "Tell me the part you would like to replace :)"
# target = gets.chomp
# puts "What do you want to change it to?"
# goal = gets.chomp
cur_dir = Dir.pwd
filename = "#{cur_dir}/create-luh.xml"
target = "NCT-Z-08CA-802X"
goal = "NCT-Z-08CA-804C"

file_names = ["#{filename}"]
#check to make sure the user input is actually within the file, then proceed with the replacing process.
	if File.readlines("#{filename}").grep(/#{target}/).size > 0
		file_names.each do |file_name|
  			text = File.read(file_name)
  			new_contents = text.gsub(/#{target}/, "#{goal}")

  	# show the file with changes
  		puts new_contents

  	# write changes to the file
  		File.open(file_name, "w") {|file| file.puts new_contents }
  	end
    # User input not found, stop process, inform user.
	elsif File.readlines("#{filename}").grep(/#{target}/).size == 0
  puts ""
  puts ""
	puts "Can't find required content in the file, please double check. :("
  puts ""
  puts ""
end
