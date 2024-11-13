mkdir -p $HOME/.local/bin
cd $HOME/.local/bin
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
tar -xf google-cloud-cli-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh
rm google-cloud-cli-linux-x86_64.tar.gz
cd -
