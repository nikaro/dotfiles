# Load rbenv automatically

if which rbenv > /dev/null
    status --is-interactive; and rbenv init - fish | source
end
