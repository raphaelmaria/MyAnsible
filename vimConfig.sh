#!/usr/bin/env bash

echo "
syntax on                   
set showmode                
set ignorecase            
set ruler                   
set showcmd                 
set smarttab                
set sm                      
set laststatus=1            
set title                   
set term=xterm-256color     
set smartcase               
set incsearch               
set autoindent             
set smartindent             
set undolevels=1000         
set number
set bg=dark
set paste
set tabstop=2
set shiftwidth=2
set expandtab
autocmd FileType yaml setlocal ai sw=1 et cuc cul" | sudo tee ~/.vimrc
echo "Vim configurado com sucesso!"

