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
 ______ __  __  ______  ______  ______       _____   ______  ______ ______ __  __      ______  ______          
/\__  _/\ \_\ \/\  ___\/\  ___\/\  ___\     /\  __-./\  __ \/\__  _/\  ___/\ \/\ \    /\  ___\/\  ___\         
\/_/\ \\ \  __ \ \  __\\ \___  \ \  __\     \ \ \/\ \ \ \/\ \/_/\ \\ \  __\ \ \ \ \___\ \  __\\ \___  \        
   \ \_\\ \_\ \_\ \_____\/\_____\ \_____\    \ \____-\ \_____\ \ \_\\ \_\  \ \_\ \_____\ \_____\/\_____\       
    \/_/ \/_/\/_/\/_____/\/_____/\/_____/     \/____/ \/_____/  \/_/ \/_/   \/_/\/_____/\/_____/\/_____/       
          __  __  __  __      __      ______       ______ ______  ______  ______  __  ______  ______ ______    
         /\ \/ / /\ \/\ \    /\ \    /\  ___\     /\  ___/\  __ \/\  ___\/\  ___\/\ \/\  ___\/\__  _/\  ___\   
         \ \  _"-\ \ \ \ \___\ \ \___\ \___  \    \ \  __\ \  __ \ \___  \ \ \___\ \ \ \___  \/_/\ \\ \___  \  
          \ \_\ \_\ \_\ \_____\ \_____\/\_____\    \ \_\  \ \_\ \_\/\_____\ \_____\ \_\/\_____\ \ \_\\/\_____\ 
           \/_/\/_/\/_/\/_____/\/_____/\/_____/     \/_/   \/_/\/_/\/_____/\/_____/\/_/\/_____/  \/_/ \/_____/ 
                                                                                                               
```
