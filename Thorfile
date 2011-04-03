require 'thor'

class Dotfiles
  
  respond_to?(:add_component) && add_component('vim_config')

  class VimConfig < Thor
    include Thor::Actions
    
    ROOT = File.dirname(__FILE__)

    desc "bootstrap", "Creates vim symlinks in ~" 
    def bootstrap
      say " Bootstrapping Vim config \n", Thor::Shell::Color::ON_BLACK + Thor::Shell::Color::YELLOW + Thor::Shell::Color::BOLD
      create_link '~/.vim', File.join(ROOT, 'vim')
      create_link '~/.vimrc', File.join(ROOT, 'vimrc')
      create_link '~/.gvimrc', File.join(ROOT, 'gvimrc')
      inside ROOT do
        run 'git submodule update --init'
      end
    end

    desc "update", "Updates all the script submodules"
    def update
      inside ROOT do
        run 'git submodule update --init'
        run 'git submodule foreach git pull origin master'
      end
    end

  end

end
