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
brew_packages = %w[git]
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

puts 'Part 1 done, now run the part 2 script'
