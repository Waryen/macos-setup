#!/usr/bin/ruby

# Check if Homebrew is installed, if not, install it
unless system('which brew')
  puts 'Installing Homebrew 🍺...'
  unless system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
    puts 'Error: Homebrew installation failed.'
    exit(1)
  end
end

# List of brew packages and casks to install
brew_packages = %w[bun git]
cask_packages = %w[visual-studio-code 1password raycast discord warp rectangle spotify google-chrome arduino-ide]

# Install brew packages
brew_packages.each do |package|
  unless system("brew list #{package} &>/dev/null")
    puts "Installing #{package} 🍺..."
    unless system("brew install #{package}")
      puts "Error: #{package} installation failed."
      exit(1)
    end
  end
end

# Install cask packages
cask_packages.each do |package|
  unless system("brew list --cask #{package} &>/dev/null")
    puts "Installing #{package} 🍺..."
    unless system("brew install --cask #{package}")
      puts "Error: #{package} installation failed."
      exit(1)
    end
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
toolchains = %w[node@18 commitizen]

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
