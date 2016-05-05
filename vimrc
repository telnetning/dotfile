autocmd FileType css set omnifunc=csscomplete#CompleteCSS

syntax on
"用来将tab键替换为四个空格键
set ts=4
set shiftwidth=4
set expandtab
set autoindent

set nu  "打开行数显示 

"下面的语句是为了安装Vundle设置的
set nocompatible "关闭兼容模式
filetype off "required!

set rtp+=~/.vim/bundle/Vundle.vim "rtp means runtimepath
call vundle#begin()

" vim的gist插件
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

" let Vundle manage Vundle
"required!
Bundle 'gmarik/vundle'

" vim-scripts repos
"在输入需要配对的符号的时候，自动补全
Bundle 'AutoClose'

"JavaScript語法高亮
Bundle "pangloss/vim-javascript"

"node代碼提示 按下crtl-x crtl-o使用
Bundle "myhere/vim-nodejs-complete.git"

"一款比较好用的用来写HTML以及CSS的插件
Bundle 'ZenCoding.vim'

"自动识别文件编码
"Bundle 'FenView.vim'

"使用vim-pandoc
""Bundle 'vim-pandoc/vim-pandoc'
"使用vim-pandoc-syntax
""Bundle 'vim-pandoc/vim-pandoc-syntax'

"在Vim的编辑窗口树状显示文件目录
Bundle 'The-NERD-tree'

"自动补全软件
"Bundle 'Valloric/YouCompleteMe'

"以全新的方式在文档中高效地移动光标
Bundle 'EasyMotion'

"Vim中编写markdown实时预览的一个插件
"Bundle 'suan/vim-instant-markdown'
"由于无法显示heading类型，暂时抛弃

"Bundle 'snowfy/python-vim-instant-markdown'也不好使
Bundle "swaroopch/vim-markdown-preview"

"vim-instant-markdoiwn默认能识别.markdown,
".markd以及README.md。要想所有md结尾的都被识别，就需要这个插件
Bundle 'tpope/vim-markdown'

"有道翻譯 没有python+无法使用
Bundle 'ianva/vim-youdao-translater'
"有道词典快捷键
vnoremap <silent> <C-M> <Esc>:Ydv<CR>
nnoremap <silent> <C-M> <Esc>:Ydc<CR>
noremap <leader>yd :Yde<CR>

"安装taglists
Bundle 'vim-scripts/taglist.vim'
" Settings for tagslist

let Tlist_Use_Right_Window = 1 "让taglist窗口出现在Vim的右边

let Tlist_File_Fold_Auto_Close = 1 "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。

let Tlist_Show_One_File = 1 "只显示一个文件中的tag，默认为显示多个

let Tlist_Sort_Type ='name' "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序

let Tlist_GainFocus_On_ToggleOpen = 1 "Taglist窗口打开时，立刻切换为有焦点状态

let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim

let Tlist_WinWidth = 32 "设置窗体宽度为32，可以根据自己喜好设置

let Tlist_Ctags_Cmd ='/usr/local/Cellar/ctags/5.8/bin/ctags' "这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个

"热键设置，设置成Leader+t来呼出和关闭Taglist
map t :TlistToggle  

"vim内嵌的一个中文输入法，可以用来提升中文输出效率
Bundle 'vim-scripts/VimIM'
let g:Vimim_cloud=-1 "关闭vimim云词库
"let g:Vimim_cloud = 'sogou,baidu,qq,google' "使用vimim云词库

call vundle#end()

filetype plugin indent on "required!
