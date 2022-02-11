# Software

## 编程环境

```
sudo apt update
sudo apt install g++ git cmake -y
curl -sL install-node.vercel.app/lts | bash
```



## neovim

1. 安装

   ```
   sudo apt-get remove vim
   sudo apt-get install software-properties-common
   sudo apt-add-repository ppa:neovim-ppa/stable
   sudo apt-get update
   sudo apt-get install neovim -y
   ```

   

2. 配置 init.vim 文件

   ```
   git clone https://github.com/DMClimbo/Config.git
   mkdir -p ~/.config/nvim
   cp init.vim  ~/.config/nvim/init.vim
   ```

   ​     

3. 安装插件

   ```
   vim
   :PlugInstall
   :CocInstall coc-jed
   :CocInstall coc-clang
   ```

   

## Oh-my-zsh

1. 安装

   ```
   sudo apt install zsh -y
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

   

2. 编辑 ` ~/.zshrc`文件，将第 7 行改为

   ``` 
   ZSH_THEME="agnoster"
   ```

   

3. 编辑 ` ~/.oh-my-zsh/themes/agnoster.zsh-theme` 文件，把 92 行修改为：

   ```
   prompt_segment green black "%(!.%{%F{yellow}%}.)%n"
   ```

   



## anaconda

1. 下载安装

   ```
   wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
   sudo chmod +x Anaconda3-2021.05-Linux-x86_64.sh
   ./Anaconda3-2021.05-Linux-x86_64.sh  
   ```

2. 配置环境变量

   ```
   echo 'export PATH="/home/yang/anaconda3/bin:$PATH"' >> ~/.zshrc
   source ~/.zshrc
   conda init zsh
   ```

   



##  node 

1. 安装

   ``` 
   curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
   sudo apt install nodejs -y
   ```

   



# linux 环境配置

## git 配置

- 基础配置

  ```
  git config --global user.email "yanghang233@126.com"
  git config --global user.name "yang"
  ```
  
  

## 快捷命令

​     在 `~/.zshrc` 文件最后添加

```
alias vimconf='vim ~/.config/nvim/init.vim'
```







# frp

## 基本概念

​		frp 分为客户端和服务端，客户端就是我们真正需要进行访问的那台设备，服务端是一台有公网 ip 的机器，作为反向代理对客户端指定端口进行映射转发



## 安装配置

1. 下载

   ```
   wget   https://github.com/fatedier/frp/releases/download/v0.38.0/frp_0.38.0_linux_amd64.tar.gz
   ```



2. 解压 

   ```
   tar -zxvf frp_0.38.0_linux_amd64.tar.gz
   ```

    

3. 配置

   - 服务端

     编辑 frps.ini 文件（frps 是服务端，frpc 是客户端）：

     ```
     [common]
     bind_port = 7000      # 客户端和服务端连接的端口
     token = passwd         # 客户端和服务端连接的口令
     ```

      

   - 客户端

     编辑 frpc.ini 文件（可以删除服务端 frps 文件）：

     ```
     [common]
     server_addr = 124.70.209.135     # 服务端公网 ip
     server_port = 7000							 # 服务端 frp 端口
     token = password						     # 服务端口令
     
     [ssh]														 # 自定义规则，可以命名为要映射的服务
     type = tcp                                             # 连接方式
     local_ip = 127.0.0.1                   		  # 本机 ip
     local_port = 22									 # 要转发的端口号
     remote_port = 6000						  # 服务端映射的端口号
     
     ```

      

4. 启动服务

   - 服务端：``` ./frps -c frps.ini```
   - 客户端：``` ./frpc -c frpc.ini```

    

5. 服务端 / 客户端设置后台运行

   ```
   nohup  ./frps  -c  frps.ini  &
   nohup  ./frpc  -c  frpc.ini  &
   ```

   

启动命令:

```
nohup  cd /home/yang/桌面/frp/ && ./frpc  -c frpc.ini nohup /home/yang/桌面/frp/frpc -c frpc.ini
```







## vim-plug

1. 下载

   ``` 
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```
   
   ​	
   
2. 创建一个``` ~/.config/nvim/init.vim ``` 文件，输入以下文本：

   ```
   call plug#begin()								
   
   Plug 'itchyny/lightline.vim'                                 
   Plug 'preservim/nerdtree'                               
   Plug 'artanikin/vim-synthwave84'                   
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   
   
   call plug#end()
   ```

   每次需要安装插件时，在 ```call plug#begin()``` 和 ```call plug#end()```  之间添加

    

3. 命令（终端启动 vim 后）：

   ```
   :PlugInstall       					# 安装 ~/.vimrc 中的插件
   :PlugUpdate     			 	 # 更新插件（可以添加插件名更新指定插件）
   :PlugClean         					# 卸载在 call plug#begin 和 call plugin#end之间删除的插件
   :PlugUpgrade   					# 更新vim-plug
   :PlugStatus                         # 检查插件安装状态
   :PlugSnapshot ~/vim-plug.list    # 生成插件快照
   ```

    

## coc 

1. 安装 node 

   ``` 
   curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
   sudo apt install  nodejs
   ```

2. coc 插件

   ``` 
   :CocInstall  coc-pyright
   :CocInstall coc-clang
   ```

3. 安装 Clangd

   - 能连外网用 coc 自带安装命令：

     ````
     :CocCommand clangd.install
     ````

   - 脚本安装（可能会找不到 clangd 文件，需要 ln 软链接到 `~/.local/bin/clangd`下：

     ````
     bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
     
     cd ~/.local/bin/clangd
     
     touch clangd
     
     ln -s [clangd源程序地址] ~/.local/bin/clangd
     ````

     

# 设置快捷指令

- 在`~/.bashrc`文件末尾添加：

  ```
  
   31 nnoremap <leader>gp :Git push<cr>
  ```
  
  如果用的是其他的 shell  在相应的文件中修改，如`~/.zshrc`
