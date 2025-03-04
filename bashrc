. ~/.remote-dotfiles/exports
. ~/.remote-dotfiles/git_aliases

# save bash history from multiple terminals
# https://eli.thegreenplace.net/2013/06/11/keeping-persistent-history-in-bash
# https://askubuntu.com/questions/80371/bash-history-handling-with-multiple-terminals
log_bash_persistent_history()
{
  [[
    $(history 1) =~ ^\ *[0-9]+\ +([^\ ]+\ [^\ ]+)\ +(.*)$
  ]]
  local date_part="${BASH_REMATCH[1]}"
  local command_part="${BASH_REMATCH[2]}"
  if [ "$command_part" != "$PERSISTENT_HISTORY_LAST" ]
  then
    echo $date_part "|" "$command_part" >> ~/.persistent_history
    export PERSISTENT_HISTORY_LAST="$command_part"
  fi
}

# Stuff to do on PROMPT_COMMAND
run_on_prompt_command()
{
    log_bash_persistent_history
}

PROMPT_COMMAND="run_on_prompt_command"
# Trying to fix the messed up format of my persistent history
export HISTTIMEFORMAT="%F %T  "
# Useful alias for searching persistent history
alias phgrep='cat ~/.persistent_history|grep --color'
# Useful alias for sourcing a local venv
alias sv='source .venv/bin/activate || source venv/bin/activate'

# Useful alias for running multi-gpu experiments in robust-llm
alias alaunch='accelerate launch --config_file=accelerate_config.yaml --num_processes=2 '

# Useful for manually backing up my SCRATCH directory on devboxes
alias scratchbackup='mkdir -p /robust_llm_data/ian/SCRATCH_backups && TIMESTAMP=$(date +%Y%m%d_%H%M%S) && cd /root/robust-llm && tar -czf "/robust_llm_data/ian/SCRATCH_backups/SCRATCH.${TIMESTAMP}.tar.gz" SCRATCH/ && cd -'
