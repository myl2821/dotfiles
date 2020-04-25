# GO
export GOPATH=$HOME/go
export PATH=/usr/local/bin:$GOPATH/bin:$PATH

# Homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# Java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Antlr
export CLASSPATH=.:/usr/local/lib/antlr-4.7.2-complete.jar
ANTLR=.:/usr/local/lib/antlr-4.7.2-complete.jar
alias antlr4='java org.antlr.v4.Tool'
alias grun='java org.antlr.v4.gui.TestRig'

# Hadoop
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
export HADOOP_INSTALL=$HADOOP_HOME
export PATH=$PATH:$HADOOP_HOME/bin

# Hbase
export HBASE_HOME=/usr/local/hbase
export PATH=$PATH:$HBASE_HOME/bin

# aliases
alias uuid="uuidgen | tr -d - | tr -d '\n' | tr '[:upper:]' '[:lower:]'  | pbcopy && pbpaste && echo"
alias cb="pbcopy"
alias totp="oathtool --totp -b $(<~/.totp_google) | cat ~/.ldap - | tr -d '\n' | pbcopy"
alias tunnelblick='totp && osascript -e "tell application \"/Applications/Tunnelblick.app\"" -e "connect \"sensetime-auth-sz\"" -e "end tell"'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export RUST_LOG=debug

# jenv
export PATH="/Users/myl/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
jenv rehash 2>/dev/null
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

