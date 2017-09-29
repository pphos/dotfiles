# pphos/dotfiles

## SETUP
ubuntu を前提にしている。

init_neovim.shを実行すると環境構築が可能 。  
neovimに必要なpython3 モジュールは生の環境にインストールする設定になっている。  

```sh
$ cd ~
$ git clone https://github.com/pphos/dotfiles.git
$ ~/.dotfiles/init_neovim.sh
```

後は[dein.vim](https://github.com/Shougo/dein.vim)により、自動的に必要なプラグインが読み込まれる。


## NOTE
[lightline.vim](https://github.com/itchyny/lightline.vim)でセパレータに特殊フォントを使う場合は.fonts内のPowerlineパッチを当てたRictyフォントをインストールして、ターミナルにそのフォントを設定すると、セパレータの特殊文字が反映される。  
(元々~/.fontsがない場合は、`init_neovim.sh`の実行でフォントがインストールされる)
