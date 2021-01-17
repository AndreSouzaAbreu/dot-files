# files
alias la='ls -lAhc --group-directories-first'
alias lh='ls -lhc --group-directories-first'
alias rename-kebab='rename-files str-kebab'
alias rename-snake='rename-files str-snake'
alias rename-ascii='rename-files str-ascii'

# GIT
alias gits='git status -s'
alias gitl='git log --oneline'
alias gitg='git log --graph --full-history --all --oneline'

# NPM
alias naudit='npm audit'
alias nauditf='npm audit fix'
alias nwatch='npm run watch'
alias nserve='npm run serve'
alias nbuild='npm run build'
alias nbuildn='npm run build:npm'
alias nprod='npm run prod'
alias nprod-js='npm run prod-js'
alias nprod-css='npm run prod-css'
alias ndev='npm run dev'
alias ndev-js='npm run dev-js'
alias ndev-css='npm run dev-css'
alias npublish='npm publish --access=public'

# Laravel
alias tinker='php artisan tinker'
alias pam='php artisan migrate:refresh --seed'
alias parl='php artisan r:l'
alias pas='php artisan serve'
alias pa='php artisan'

# others
alias hist="cat ~/.bash_history"
alias hisgrep="cat ~/.bash_history | grep"
alias i3conf='vim ~/.config/i3/config'
