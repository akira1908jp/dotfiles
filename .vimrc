set sm
set ai
syntax on
let java_highlight_all=1
let java_highlight_function="style"
let java_allow_cpp_keyword=1
set complete=.,w,b,u,t,i
set foldmethod=indent
set number

command! Javac call s:Javac()
nmap <F9> :Javac<CR>

function! s:Javac()
   :w
   let path=expand("%")
   let syn="javac ".path
   let dpath=split(path,".java$")
   let ret=system(syn)
   if ret == ""
     let syn="java ".dpath[0]
     let ret=system(syn)
     :echo "====\r\n実行結果:\r\n".ret
   else
     :echo ret
   endif
endfunction   
