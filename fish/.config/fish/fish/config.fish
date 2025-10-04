if status is-interactive
    # Commands to run in interactive sessions can go here
end

if not contains /home/erez/.local/bin $PATH
    set -x PATH $PATH /home/erez/.local/bin
end
oh-my-posh init fish --config $HOME/.config/ohmyposh/amro.omp.json | source
