# Dotfiles
<a href="#">![Trucketh thee onward.](http://www.prguitarman.com/comics/poptart1red1.gif)</a>

This repo uses [rcm][]. 
 
To do a full install:
```
git clone git@github.com:jmn/dotfiles.git && env RCRC=$HOME/dotfiles/rcrc rcup
 
```

Some dotfiles are kept in tag-specific directories.
This allows for easy cherry-picking.

For example, if you want only my vim setup:

```
% git clone https://github.com/jmn/dotfiles .jmn-dotfiles
% rcup -d .jmn-dotfiles -x README.md -t vim
```

These options could be made the default in your own `~/.rcrc`.

See more details with `man 7 rcm`.

[rcm]: https://github.com/thoughtbot/rcm


<br><br>
   
```
  ________                          __      __  _____ __             
 /_  __/ /_  ___  ________     ____/ ____  / /_/ __(_/ ___  _____    
  / / / __ \/ _ \/ ___/ _ \   / __  / __ \/ __/ /_/ / / _ \/ ___/    
 / / / / / /  __(__  /  __/  / /_/ / /_/ / /_/ __/ / /  __(__  )     
/_/ /_/ /_/\___/____/\___/   \__,_/\____/\__/_/ /_/_/\___/____/      
           __   _ ____        ____                _      __          
          / /__(_/ / _____   / ______ ___________(______/ /______    
         / //_/ / / / ___/  / /_/ __ `/ ___/ ___/ / ___/ __/ ___/    
        / ,< / / / (__  )  / __/ /_/ (__  / /__/ (__  / /_(__  _     
       /_/|_/_/_/_/____/  /_/  \__,_/____/\___/_/____/\__/____(_)    
                                                                    
                                                                                            
```
