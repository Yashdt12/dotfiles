# Helpers for common CLI operations
alias c="clear"
alias l="ls -aF --color=auto"
alias ll="ls -ahlF --color=auto"

# Notes tool
note() {
  if [ "$#" -gt 1 ]; then
    echo "ERROR: At most 1 argument must be passed" >&2
    return 1
  fi

  if [[ "$1" == *.* || "$1" == */* ]]; then
    echo "ERROR: Note names cannot contain '.' or '/'" >&2
    return 2
  fi

  mkdir -p "$HOME/notes"

  if [ "$#" -eq 0 ]; then
    vi "$HOME/notes/temp"
  else
    vi "$HOME/notes/$1"
  fi
}

# Reminders tool
to(){
  if [ "$#" -ne 1 ]; then
    echo "ERROR: Exactly 1 argument must be passed" >&2
    return 1
  fi

  if [[ "$1" == *.* || "$1" == */* ]]; then
    echo "ERROR: Reminder names cannot contain '.' or '/'" >&2
    return 2
  fi

  mkdir -p "$HOME/reminders"

  local filename="to_$1"
  vi "$HOME/reminders/$filename"
}
