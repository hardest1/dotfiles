# dotfiles
My personal dotfiles

![Personal Space](https://media.tenor.com/Uxtp1ueu0fMAAAAC/personal-space-rickand-morty.gif)

### Install and setup dotfiles with gist script
```
curl -Lks https://gist.githubusercontent.com/hardest1/634b316a31a66ab5bfd82cbdce53ad97/raw/efc0a3fb1d8b82d43d4c743010f9525d72beb769/install-dotfiles.sh | /bin/bash -
```

### Optional: Add Github Token to be able to access private repositories
proceed with caution, kinda unsafe because saved in plaintext
safer solution is to create new ssh key for the server and add it in github
```
MY_GIT_TOKEN=replace_with_token_from_1password

git config --global url."https://api:$MY_GIT_TOKEN@github.com/".insteadOf "https://github.com/"
git config --global url."https://ssh:$MY_GIT_TOKEN@github.com/".insteadOf "ssh://git@github.com/"
git config --global url."https://git:$MY_GIT_TOKEN@github.com/".insteadOf "git@github.com:"

# Optional: Set git author name and email
# only really necessary if we commit and push changes from this server
git config --global user.name "Alexander Hartmann"
git config --global user.email "alexander@hartmann-it.de"
```
