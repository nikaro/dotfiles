# Load pyenv

if which pyenv > /dev/null
    status is-login; and pyenv init --path | source
    status is-interactive; and pyenv init - | source
    
    # Plugins
    status is-interactive; and pyenv virtualenv-init - | source
end
