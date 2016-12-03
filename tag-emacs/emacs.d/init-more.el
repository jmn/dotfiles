;; .emacs (2012-2013) (jmnoz)
;; a configuration file.

(set-language-environment "utf-8")
(load "~/.emacs.d/config-os-specific.el")

(require 'package)			;;; Package system init
(add-to-list 'package-archives 
    '("marmalade" .
      "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(setq auth-sources '((:source ".authinfo.gpg" :host t :protocol t)))

;; load-path
(add-to-list 'load-path (file-truename ".emacs.d/"))
(add-to-list 'load-path (file-truename ".emacs.d/nyan-mode"))
(add-to-list 'load-path (file-truename ".emacs.d/twittering-mode"))
(add-to-list 'load-path (file-truename ".emacs.d/nyan-mode"))
(add-to-list 'load-path (file-truename ".emacs.d/elpa/sr-speedbar-0.1.8"))
(add-to-list 'load-path (file-truename ".emacs.d/elpa/org-plus-contrib-20130429"))
(add-to-list 'load-path "/home/jmn/.rvm/rubies/ruby-1.9.3-p392/share/emacs/site-lisp")

(setq package-user-dir  (file-truename ".emacs.d/elpa"))
(setq org-mobile-directory (file-truename ".mobile-org"))
(setq org-mobile-inbox-for-pull (file-truename "GTD/mobileorg.org"))

(package-initialize)
(require 'use-package)
; (message "system-type is: %s" system-type)
; (message "home set to: %s" home)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; ============== FACES =============
;; Faces: Remove bold and underlining from faces
;; from http://stackoverflow.com/questions/2064904/how-to-disable-bold-font-weight-globally-in-emacs
(mapc
  (lambda (face)
    (set-face-attribute face nil :weight 'normal :underline nil))
  (face-list))

;; Use org-mode for .txt files
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))
'(initial-major-mode (quote org-mode))

(setq initial-scratch-message "")
(setq server-socket-dir (format "/tmp/emacs%d" (user-uid)))
(server-start)		; Normal emacs server
; (prefer-coding-system 'utf-8)

(require 'org)

;; func by "Arne": http://stackoverflow.com/a/11517584/41829
(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )


; shortcut keys / bindings
(global-set-key [f8] 'deft)
(global-set-key (kbd "C-c r") 'newsticker-treeview)
(global-set-key (kbd "C-c i") 'ispell-word)
(define-key global-map "\C-cq" 'auto-fill-mode)
(define-key global-map "\M-n" 'hippie-expand)			
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cC" 'my-org-capture-other-frame)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cm" 'magit-status)
(define-key global-map "\C-c." 'comment-or-uncomment-line-or-region) 
(define-key global-map "\C-cl" 'org-store-link) ; https://www.gnu.org/software/emacs/manual/html_node/org/Handling-links.html
(define-key global-map "\C-co" 'org-capture-goto-last-stored) 
;; (define-key global-map "\C-ct" 'sr-speedbar-toggle)

(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "J") 'dired-goto-file)	; j/k for up/down like in vi
     (define-key dired-mode-map (kbd "K") 'dired-do-kill-lines)	
     (define-key dired-mode-map (kbd "j") 'next-line)		
     (define-key dired-mode-map (kbd "k") 'previous-line)
))

(eval-after-load "org-agenda"		; Todo: remap original keys 
  '(progn
     (define-key org-agenda-mode-map (kbd "j") 'next-line)
     (define-key org-agenda-mode-map (kbd "k") 'previous-line)
))

(add-hook 'org-capture-mode-hook (lambda () (org-toggle-custom-properties-visibility)))

(use-package magit
  :ensure t
  :init
  '(progn
     (define-key magit-mode-map (kbd "K") 'magit-discard-item)	;; j/k is line up/down in magit
     (define-key magit-mode-map (kbd "j") 'next-line)
     (define-key magit-status-mode-map (kbd "k") 'previous-line)
     (define-key magit-mode-map (kbd "k") 'previous-line)
     )
  )

(require 'ispell)

(autoload 'magit-status "magit" nil t)

(if (eq system-type 'windows-nt)
 (require 'w32-fullscreen))
(message "Done loaded dotemacs. Please proceed.")
(put 'erase-buffer 'disabled nil)

; Fullscreen mode
(defun switch-fullscreen nil
  (interactive)
  (let* ((modes '(nil fullboth fullwidth fullheight))
         (cm (cdr (assoc 'fullscreen (frame-parameters) ) ) )
         (next (cadr (member cm modes) ) ) )
    (modify-frame-parameters
     (selected-frame)
     (list (cons 'fullscreen next)))))

(define-key global-map [f11] 'switch-fullscreen)

(when window-system
  (defadvice sr-speedbar-open (after sr-speedbar-open-resize-frame activate)
    (set-frame-width (selected-frame)
                     (+ (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-open 'after 'sr-speedbar-open-resize-frame)

  (defadvice sr-speedbar-close (after sr-speedbar-close-resize-frame activate)
    (sr-speedbar-recalculate-width)
    (set-frame-width (selected-frame)
                     (- (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-close 'after 'sr-speedbar-close-resize-frame))

(define-key global-map [f11] 'switch-fullscreen)
(global-font-lock-mode -1)

(use-package bbdb
  :ensure t)

(use-package org-jekyll
  :ensure t)

(use-package zenburn-theme
  :ensure t)

(setq gnus-init-file "~.emacs.d/config-gnus.el")
(load "~/.emacs.d/config-gnus.el")
(load "~/.emacs.d/config-org.el")		;; Org-mode configuration
(load "~/.emacs.d/config-programming.el")
(load "~/.emacs.d/config-irc.el")

(global-set-key (kbd "<C-mouse-4>") 'text-scale-decrease) ;;; Scrollwheel resize fonts
(global-set-key (kbd "<C-mouse-5>") 'text-scale-increase)

;; Uniquify makes it possible to distingush buffers with the same filename from eachother
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(load-theme 'zenburn t)
(put 'dired-find-alternate-file 'disabled nil)

;; fonts
(set-frame-font "Fantasque Sans Mono Regular" t)
 (require 'cl)
  (defun font-candidate (&rest fonts)
     "Return existing font which first match."
     (find-if (lambda (f) (find-font (font-spec :name f))) fonts))

(set-face-attribute 'default nil :font
		    (font-candidate '"Fantasque Sans Mono Regular:weight=normal" "Fantasque Sans Mono Regular-12:weight=normal"))
