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

# WSL Notes

```
wsl --export Ubuntu-18.04 Ubuntu-18.04.tar
wsl --import Ubuntu-18.04-Git .\Ubuntu-18.04-Git .\Ubuntu-18.04.tar
```

## Windows Terminal Set Up

```
{
    "guid": "{c1bf89b1-f804-4479-8fa6-4ea2982ae311}",
    "hidden": false,
    "name": "Ubuntu-18.04-Git Test",
    "useAcrylic" : true,
    "acrylicOpacity" : 0.85,
    "fontFace" : "Cascadia Code",
    "fontSize" : 12,
    "commandline" : "wsl -d Ubuntu-18.04-Git --user warren",
    "icon" : "ms-appx:///ProfileIcons/{9acb9455-ca41-5af7-950f-6bca1bc9722f}.scale-100.png",
    "startingDirectory" : "//wsl$/Ubuntu-18.04-Git/home/warren"
}
```

### Icons

https://github.com/microsoft/terminal/tree/master/src/cascadia/CascadiaPackage/ProfileIcons
