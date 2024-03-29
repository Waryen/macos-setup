#!/usr/bin/ruby

# Install Oh-My-Zsh
unless system('which zsh')
  puts 'Installing Oh-My-Zsh 🐚...'
  unless system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')
    puts 'Error: Oh-My-Zsh installation failed.'
    exit(1)
  end
end

# Copy .zshrc configuration
puts 'Configuring .zshrc...'
system('rm ~/.zshrc')
unless system('cp .zshrc.copy ~/.zshrc')
  puts 'Error: .zshrc configuration failed.'
  exit(1)
end

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

# Install Sdkman
unless system('which sdk')
  puts 'Installing Sdkman 📦...'
  unless system('curl -s "https://get.sdkman.io" | bash')
    puts 'Error: Sdkman installation failed.'
    exit(1)
  end
end

# Install Java 17
unless system('sdk install java 17.0.9-zulu')
  puts 'Error: Java 17 installation failed.'
  exit(1)
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

system('source ~/.zshrc')

puts 'All done ✅'
