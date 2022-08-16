#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then echo "Please run as root!" && exit 1 ; fi

git_url="https://github.com/kevtx/ansible-pull"
git_branch="dev_domain"
vault_pw_file="/root/.ansible/.secrets/domain-join"

if ! test -f "$vault_pw_file" ; then
  echo "Specified vault password file does not exist (\"$vault_pw_file\")."
  exit 1
fi

echo -e "git_url:\t$git_url"
echo -e "git_branch:\t$git_branch"
echo -e "vault_pw_file:\t$vault_pw_file"

cmd="/usr/bin/ansible-pull --url $git_url --checkout $git_branch --vault-password-file $vault_pw_file"

#ansible-pull \
#  #--only-if-changed \
#  --vault-password-file "$vault_pw_file" \
#  --checkout "$git_branch" \
#  --url "$git_url"

$cmd
