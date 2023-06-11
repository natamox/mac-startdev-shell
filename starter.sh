# 如果出现错误，立即终止脚本
set -e

echo "✨✨ [envbuilder]  ✨✨ ==> 开始下载 homebrew"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "✨✨ [envbuilder]  ✨✨ ==> 开始下载安装 git" 
brew install git

echo "✨✨ [envbuilder]  ✨✨ ==> 开始下载安装 iterm2" 
brew install --cask iterm2

echo "✨✨ [envbuilder]  ✨✨ ==> 开始下载安装 oh-my-zsh" 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "✨✨ [envbuilder]  ✨✨ ==> 开始下载安装 zsh-autosuggestions zsh-syntax-highlighting" 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i -e 's/^plugins=(\(.*\))/plugins=(zsh-autosuggestions zsh-syntax-highlighting \1)/' ~/.zshrc

echo "✨✨ [envbuilder]  ✨✨ ==> 开始下载 nvm"
brew install nvm

echo "✨✨ [envbuilder]  ✨✨ ==> 开始下载 pnpm" 
brew install pnpm

echo "✨✨ [envbuilder]  ✨✨ ==> 开始下载 yarn" 
brew install yarn
