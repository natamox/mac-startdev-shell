start_proxy() {
  export http_proxy="http://127.0.0.1:$PROXY_PORT"
  export https_proxy="http://127.0.0.1:$PROXY_PORT"
  echo "HTTP proxy on"
}

stop_proxy() {
  unset http_proxy
  unset https_proxy
  echo "HTTP proxy off"
}

start_download() {
  echo "开始下载 homebrew"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "开始下载安装 git"
  brew install git

  echo "开始下载安装 iterm2"
  brew install --cask iterm2

  echo "开始下载安装 oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  echo "开始下载安装 zsh-autosuggestions zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  sed -i -e 's/^plugins=(\(.*\))/plugins=(zsh-autosuggestions zsh-syntax-highlighting \1)/' ~/.zshrc

  echo "开始下载 nvm"
  brew install nvm

  echo "开始下载 pnpm"
  brew install pnpm

  echo "开始下载 yarn"
  brew install yarn
}


# 如果出现错误，立即终止脚本
set -e

PROXY_PORT=7890

echo "建议开启终端代理，并根据代理的端口修改，默认 7890"

read -p "是否有代理，请输入选择 [y/n]: " is_proxy

if [ "$is_proxy" == 'y' ] || [ -z "$is_proxy" ]; then
  read -p "输入代理端口号: " proxy_port
  if expr $proxy_port : '\([0-9][0-9]*\)' >/dev/null; then
    PROXY_PORT=$proxy_port
  fi
  start_proxy
  # for test
  curl -I https://www.google.com
fi

# start_download


