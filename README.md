# Ubuntu Init - WSL

I created this git repository to make it easier for me to create Ubuntu WSL instances; purely for personal reasons.

**NOTE: Your results may vary; user beware.**

**NOTE: Current scripts are being developed on Ubuntu Desktop 18.04**

## Updates & Installs

The typical install is done on a clean Ubuntu instance.  To begin `git` must be installed. After the `git` install clone the `ubuntuinit-wsl` repository and run the setup script. The following will update Ubuntu as well as install additional software. Each application is installed separately for documentation purposes (easier to read).

```bash
$ sudo apt install git curl -y
...
$ git clone https://github.com/wsgavin/ubuntuinit-wsl
$ cd ubuntuinit-wsl
$ ./setup.sh
```
