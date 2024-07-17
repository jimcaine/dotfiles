# MacOS Environment Installer
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo "Executing setup.sh from $SCRIPT_DIR in 5 seconds..."
sleep 5

# download brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# setup
bash $SCRIPT_DIR/_brew_packages.sh
bash $SCRIPT_DIR/_brew_casks.sh
bash $SCRIPT_DIR/_dotfiles.sh
