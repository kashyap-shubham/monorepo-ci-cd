#!/bin/bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source ~/.bashrc

whoami
# Navigate to home directory
cd ~

cd monorepo-ci-cd
git pull origin main

npm install pnpm -g
pnpm install
pnpm run build

pm2 restart fe-sever
"echo fe-server restarted"

pm2 restart http-sever
"echo http-sever restarted"

pm2 restart ws-sever
"echo ws-server restarted"
