#!/usr/bin/ruby

# List of toolchains to install
toolchains = %w[node@18 commitizen cz-conventional-changelog]

# Install toolchains using Volta
toolchains.each do |tool|
  unless system("volta which #{tool} &>/dev/null")
    puts "Installing #{tool} ⚡️..."
    unless system("volta install #{tool}")
      puts "Error: #{tool} installation failed."
      exit(1)
    end
  end
end

# Set commitizen config globally
File.write(File.expand_path("~/.czrc"), '{ "path": "cz-conventional-changelog" }')

# Set global Git config
puts 'Configuring Git...'
unless system('git config --global user.name "Waryen"')
  puts 'Error: Git user name configuration failed.'
  exit(1)
end
unless system('git config --global user.email "jonathangomand@gmail.com"')
  puts 'Error: Git user email configuration failed.'
  exit(1)
end

puts 'All done ✅'
