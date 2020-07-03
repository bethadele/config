alias modz="vim ~/.zshrc"
alias modza="vim ~/.zsh-custom/aliases.zsh"
alias modv="vim ~/.vimrc.local"
alias modvb="vim ~/.vimrc.bundles.local"

alias lla="ls -la"
alias ll="ls -l"
alias 'cd..'="cd .."

alias be="bundle exec"

alias gs="git status"
alias gco="git checkout"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit -m"
alias gcam="git commit --amend"
alias gcamx="git commit --amend --no-message"
alias gs="git status"

alias dclean="docker rm -v \$(docker ps -aq -f status=exited)"
alias dm="docker-machine"
alias doco="docker-compose"

alias projalarmist="cd ~/work/alarmist"
alias projpagerdutyinsights="cd ~/work/insights-about-pagerduty"
alias projnrrdbot="cd ~/work/nrrdbot"
alias projpagerstats="cd ~/work/nr_pagerstats"
alias projpeoplesnatcher="cd ~/work/people_snatcher"
alias projupboard="cd ~/work/upboard"
alias projupsurge="cd ~/work/upsurge"

alias studyjq="curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5'"

alias nrvl="newrelic-vault us login -method=ldap username=bethlong method=push"
alias nrve="newrelic-vault-env us"

db-upboard-prod() {
  PGPASSWORD=$(vault read -field=value containers/teams/reliability/production/upboard/RDS_PASSWORD) psql -h use1v-prod-upboard-postgres-1.awsdev.nr-ops.net -U upboard upboard_prod
}
db-upboard-stg() {
  PGPASSWORD=$(vault read -field=value containers/teams/reliability/staging/upboard/RDS_PASSWORD) psql -h use1v-staging-upboard-postgres-1.awsdev.nr-ops.net -U upboard upboard_staging
}

bk-upboard-prod() {
  PGPASSWORD=$(vault read -field=value containers/teams/reliability/production/upboard/RDS_PASSWORD) pg_dump -U upboard -h use1v-prod-upboard-postgres-1.awsdev.nr-ops.net upboard_prod > upboard_prod.sql
}
bk-upboard-stg() {
  PGPASSWORD=$(vault read -field=value containers/teams/reliability/staging/upboard/RDS_PASSWORD) pg_dump -U upboard -h use1v-staging-upboard-postgres-1.awsdev.nr-ops.net upboard_staging > upboard_stg.sql
}

kill-bluejeans() {
  ps -u bethlong -o pid,command| awk 'tolower() ~ /bluejeans/ && !/awk/ {print $1}' | xargs kill
}

alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"

alias k=kubectl
alias kns=kubens

alias f="fly -t ci"

alias gcl="gcloud compute"

db-gc-prod() {
  PGPASSWORD=$(newrelic-vault us read -field=value containers/teams/tools/production/grand-central/DATABASE_PASSWORD) psql -h psql-prod-grandcentral.nr-ops.net -U grandcentral_prod grandcentral_prod
}
db-gc-staging() {
  PGPASSWORD=$(newrelic-vault us read -field=value containers/teams/tools/staging/grand-central/DATABASE_PASSWORD) psql -h psql-staging-grandcentral.nr-ops.net -U grandcentral_staging grandcentral_staging
}

eval "$(rbenv init -)"

klogs() {
   kubectl logs $(kubectl get pods | awk '{ if(NR>1) print $1}' | fzf)
}

gc-api-token-staging() {
  GC_API_TOKEN=$(vault read -field=value shared/staging/grand-central/GRAND_CENTRAL_API_ACCESS_TOKEN)
}
gc-api-token-prod() {
  GC_API_TOKEN=$(vault read -field=value shared/prod/grand-central/GRAND_CENTRAL_API_ACCESS_TOKEN)
}
gc-api-token-local() {

}

ghe-api-token() {
  GHE_API_TOKEN=$(newrelic-vault us read -field=value containers/teams/tools/staging/grand-central/GHE_API_TOKEN)
}

argo-metrics() {
  i9d sync -c vigilant-gauss
  k port-forward svc/argocd-metrics -n argocd 8082
  k port-forward svc/argocd-server-metrics -n argocd 8083
  k port-forward svc/argocd-repo-server -n argocd 8084
}

alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

kindtx() {
  kind export kubeconfig --name=$(kind get clusters | fzf)
}
