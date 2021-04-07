npm i yaml

echo \
"const YAML = require('yaml');
const fs = require('fs');
var config = YAML.parse(fs.readFileSync('_config.yml').toString());
config.lastupdate = { date: '$(date)', user: '$(git config --get user.name)' };
fs.writeFileSync('_config.yml', YAML.stringify(config));
" > tmp.js

node tmp.js

rm -rf tmp.js
rm -rf node_modules/
rm -rf package.json
rm -rf package-lock.json

git add .
git commit -m 'Commited using push.sh'
git push