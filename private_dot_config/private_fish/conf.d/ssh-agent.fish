# Start ssh-agent

if status is-interactive
and not set -q SSH_AUTH_SOCK
    if pgrep ssh-agent | string collect > /dev/null
        set -Ux SSH_AUTH_SOCK (find "/tmp" -maxdepth 2 -user $USER -type s -name agent.\* 2> /dev/null)
    else
        eval (ssh-agent -c)
    end
end
