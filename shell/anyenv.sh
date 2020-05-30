cat << 'EOS' >> ~/.bash_profile
if [ ! -e ~/.anyenv ]; then
    git clone "https://github.com/riywo/anyenv" ~/.anyenv
fi
EOS

# echo 'export ANYENV_ROOT=~/.anyenv/' >> ~/.bash_profile
# echo 'export ANYENV_DEFINITION_ROOT=~/.anyenv/.config/anyenv-install/' >> ~/.bash_profile

echo 'export PATH="~/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile

