(cond 
 ((eq system-type 'windows-nt)	; Windows settings
  (progn 
    (setq home "c:/documents and settings/root/mina dokument/Dropbox/") 
    (setq default-directory "c:/documents and settings/root/mina dokument/Dropbox/") 
    (require 'cygwin-mount nil t)
    (setenv "PATH" (concat "c:/cygwin/bin;" (getenv "PATH")))
    (setq exec-path (cons "c:/cygwin/bin/" exec-path))
    (require 'setup-cygwin nil t)
    (set-face-attribute 'default nil :font "Consolas")		; Default font
    (menu-bar-mode nil)
    )
  )
 ((eq system-type 'gnu/linux)	; GNU/Linux settings
  (progn 
;    (setq home "~/Dropbox/")
;    (setq default-directory "~/Dropbox/")

    (if window-system 

    ;; (set-face-font 'default "-jmk-Neep-normal-normal-normal-*-12-*-*-*-c-90-iso8859-1") ;; Interesting
    ;; (set-face-font 'default "-jmk-neep alt-medium-r-*-*-20-*-*-*-c-*-iso8859-1")

;    (set-face-font 'default "-bitstream-bitstream vera sans mono-medium-r-*-*-*-120-*-*-*-*-*-*") 

    ;; (set-face-font 'default "Neep Alt-14")
    ;; Currently unused (but tried) fonts:
    ;; (set-face-attribute 'default nil :font "FreeMono-12")
	(set-face-attribute 'default nil :font "Terminus-16") ;; TODO: Machine specific = Terminus-12 on smaller/lowres display.
      (set-face-attribute 'default nil :font "Dejavu Sans Mono-16")
    ;; (set-face-attribute 'default nil :font "Droid Sans Mono-12")                 ;; Serif font
    ;; (set-face-attribute 'default nil :font "Bitstream Vera Sans Mono-11")                 ;; Serif font
    ;; (set-face-font 'default "-jmk-Neep-qQnormal-normal-normal-*-12-*-*-*-c-90-iso8859-1") ;; Interesting

    ) 

    (menu-bar-mode -1)
    )
  )
 ((eq system-type 'darwin) ; Mac OS settings
  (progn 
    (setq home "~/Dropbox/")
    (setq default-directory "~/Dropbox/" )
    (setq exec-path (append exec-path '("/usr/local/bin")))
    ;; (set-face-attribute 'default nil :font "Cochin-14")
    ;; (set-face-attribute 'default nil :font "Inconsolata")
    (set-face-attribute 'default nil :font "Droid Serif")
    (menu-bar-mode t)
    (add-to-list 'default-frame-alist '(height . 48))
    (add-to-list 'default-frame-alist '(width . 150)) 
    (setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)
    )
  )
 )

;; end section: system specific settings.
