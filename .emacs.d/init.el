(setq shell-file-name "bash")
(setq shell-command-switch "-ic")
(load "~/.emacs.d/sanemacs.el" nil t)
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.2")

(use-package exec-path-from-shell
	     :config
	     (when (memq window-system '(mac ns x))
	       (exec-path-from-shell-initialize)))

(load-file "~/.emacs.d/private/gleam-mode/gleam-mode.el")
(load-file "~/.emacs.d/better-links.el")

(require 'gleam-mode)

(use-package minimap
  :config
  (setq minimap-window-location 'right)
  )

(use-package rainbow-delimiters
  :hook prog-mode)
(use-package yaml-mode)
(use-package diff-hl
  :config
  (global-diff-hl-mode)
)
(use-package tide
  :after (company flycheck)
  :config
  (define-key tide-mode-map (kbd "s-b") 'tide-jump-to-definition)
  (define-key tide-mode-map (kbd "s-[") 'tide-jump-back))

(use-package rjsx-mode
  :config
  (setq js-indent-level 2)
  (setq tab-width 4
        indent-tabs-mode nil)

  :mode ("\\.jsx?$" . rjsx-mode)
  :hook (rjsx-mode . tide-setup)
  :config (setq js-indent-level 2
                js2-strict-missing-semi-warning nil))

(use-package web-mode
  :mode
  ("\\.html?$". web-mode)
  ("\\.css$". web-mode)
  ("\\.tsx$". web-mode)
  :config
  (setq js-indent-level 2)
  (defun my/tsx-setup ()
    (when (and (stringp buffer-file-name)
               (string-match "\\.tsx$" buffer-file-name))
      (tide-setup)))
  (add-hook 'web-mode-hook 'my/tsx-setup))

(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.ts$\\'" . rjsx-mode))
(use-package prettier-js
  :hook ((js2-mode . prettier-js-mode)
         (rjsx-mode . prettier-js-mode)))

(use-package yafolding
  :hook prog-mode
  :bind
  ("<C-tab>" . yafolding-toggle-element))

(use-package company
  :init
  (setq company-idle-delay nil  ; avoid auto completion popup, use TAB
                                ; to show it
        company-async-timeout 15        ; completion may be slow
        company-tooltip-align-annotations t)
  :hook (after-init . global-company-mode)
  :bind
  (:map prog-mode-map
        ("C-i" . company-indent-or-complete-common)
        ("C-M-i" . counsel-company)))

(add-hook 'prog-mode-hook 'diff-hl-flydiff-mode)

(defun my-rustic-mode-hook-fn ()
  "needed for lsp-format-buffer to indent with 4 spaces"
  (setq tab-width 4
        indent-tabs-mode nil)
  (cargo-minor-mode t)
  (racer-mode t)
  ;; (flycheck-mode t)
  (smartparens-mode t)
  )

(use-package rustic
  :init
  (setq company-tooltip-align-annotations t
        rustic-format-on-save nil)
  ;; to use rustic-mode even if rust-mode also installed
  :config
  (setq auto-mode-alist (delete '("\\.rs\\'" . rust-mode) auto-mode-alist))
  ;; (define-key rustic-mode-map (kbd "C-c n") #'rustic-format-buffer)
  ;; (define-key rustic-mode-map (kbd "<f3>") #'rustic-cargo-run)

  :bind
  (
   ("C-c n" . rustic-format-buffer)
   ("<f3>" . rustic-cargo-run)
   )
  :hook (rustic-mode . my-rustic-mode-hook-fn)
  )

(use-package company)
(use-package smartparens
  :hook (prog-mode text-mode)
  :config
  (require 'smartparens-config))

(add-to-list 'auto-mode-alist '("\\.gleam$" . gleam-mode))
(setq org-startup-folded nil)

(use-package ox-gfm
  :config
  (with-eval-after-load 'ox
    (require 'ox-gfm))
  )

(advice-add #'org-hugo-link :override #'org-md-link)

(global-set-key (kbd "<f1>") 'magit-status)
(global-set-key (kbd "<f2>") 'variable-pitch-mode)
(global-set-key (kbd "C-c g") 'magit-file-dispatch)

(use-package magit
  :bind
  ("C-c m" . magit-status))

;; Set background color of org-mode source blocks
(use-package org
  :config
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("g" . "src gleam"))
  (add-to-list 'org-structure-template-alist '("r" . "src rust"))

  (progn
    (defun imalison:org-inline-css-hook (exporter)
      "Insert custom inline css to automatically set the
background of code to whatever theme I'm using's background"
      (when (eq exporter 'html)
        (let* ((my-pre-bg (face-background 'default))
               (my-pre-fg (face-foreground 'default)))
          (setq
           org-html-head-extra
           (concat
            org-html-head-extra
            (format "<style type=\"text/css\">\n pre.src {background-color: %s; color: %s;}</style>\n"
                    my-pre-bg my-pre-fg))))))

    (add-hook 'org-export-before-processing-hook 'imalison:org-inline-css-hook)))

(global-visual-line-mode 0)

(add-hook 'text-mode-hook
           (lambda ()
	     (variable-pitch-mode 1)
	     (visual-line-mode nil)
	     ;; (writeroom-mode t)
	     )
	   )


(use-package poet-theme
  :config
  (when window-system
    (load-theme 'poet-dark)))

(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 130)
(set-face-attribute 'fixed-pitch nil :family "DejaVu Sans Mono")
(set-face-attribute 'variable-pitch nil :family "Noto Serif CJK TC")

;; open bookmarks at startup
;; You have to inhibit-startup-screen on startup. See above.
(bookmark-bmenu-list)

(switch-to-buffer "*Bookmark List*")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
