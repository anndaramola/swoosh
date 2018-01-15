S W O O S H 

A simple, slightly flirty, tool for adding all them hosts you be ssh'ing into. It's called `swoosh`, a term I got from Scott Hanselman a while ago, and basically wraps around the `ssh username@host` command.

I know there's the ~/.ssh/config file but I made this for fun. Feel free to do with it what you please.

Installation
* Clone this repo to your home directory.
* Update the path to the .sites file at the top of swoosh.sh
* Source the .sites and swoosh files in your own `.bash_profile` or `.bashrc`
    `source "$HOME/swoosh/.sites" # load sites;`
    `source "$HOME/swoosh/swoosh.sh" # load swoosh;`
* Add your first site with the `newswoosh` command.
* Happy swooshing!
