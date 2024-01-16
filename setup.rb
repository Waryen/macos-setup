#!/usr/bin/ruby

# Check if Homebrew is installed, if not, install it
unless system('which brew')
  puts 'Installing Homebrew 🍺...'
  unless system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
    puts 'Error: Homebrew installation failed.'
    exit(1)
  end
end

# Check if Homebrew Bundle is installed, if not, install it
unless system('which brew bundle')
  puts 'Installing Homebrew Bundle 📦...'
  unless system('brew tap Homebrew/bundle')
    puts 'Error: Homebrew Bundle installation failed.'
    exit(1)
  end
end

# Check if Volta is installed, if not, install it
unless system('which volta')
  puts 'Installing Volta ⚡️...'
  unless system('curl https://get.volta.sh | bash')
    puts 'Error: Volta installation failed.'
    exit(1)
  end
end

# List of toolchains to install
toolchains = %w[node@18 yarn@1 commitizen cz-conventional-changelog npm-check-updates]

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

system('source ~/.zshrc')

puts 'All done ✅'
