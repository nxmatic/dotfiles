
asdf plugin-list | grep -q java || return

asdf_update_java_home() {
  local java_path
  java_path="$(asdf which java)"
  if [[ -n "${java_path}" ]]; then
    export JAVA_HOME
    JAVA_HOME="$(dirname "$(dirname "${java_path:A}")")"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd asdf_update_java_home
