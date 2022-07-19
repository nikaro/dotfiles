# Start ssh-agent

if status is-interactive
and not set -q SSH_AUTH_SOCK
    if test -e $HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
        set -Ux SSH_AUTH_SOCK $HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
    else if pgrep ssh-agent | string collect > /dev/null
        set -Ux SSH_AUTH_SOCK (find "/tmp" -maxdepth 2 -user $USER -type s -name agent.\* 2> /dev/null)
    else
        eval (ssh-agent -c)
    end
end
