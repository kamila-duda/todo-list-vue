npm run build

cd dist


git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:kamila-duda/todo-list-vue.git master:gh-pages

cd ..