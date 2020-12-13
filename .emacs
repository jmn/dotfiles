(load "~/.emacs.d/sanemacs.el" nil t)
(load-file "~/.emacs.d/private/gleam-mode/gleam-mode.el")
;; (load-file "~/.emacs.d/window-margin.el")
(load-file "~/.emacs.d/better-links.el")

(require 'gleam-mode)
(add-to-list 'auto-mode-alist '("\\.gleam$" . gleam-mode))
(setq org-startup-folded nil)
(with-eval-after-load 'ox
  (require 'ox-hugo)
  (require 'ox-gfm))

(advice-add #'org-hugo-link :override #'org-md-link)
(global-set-key (kbd "<f1>") 'magit-status)
(global-set-key (kbd "<f2>") 'variable-pitch-mode)
(global-set-key (kbd "C-c g") 'magit-file-dispatch)

;; Set background color of org-mode source blocks
(use-package org
  :config
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

;;; Add link icons in headings
;;; http://ivanmalison.github.io/dotfiles/#addlinkiconsinheadingsthatleadtothemselves
(use-package org
  :commands (org-html-export-as-html org-html-export-as-html)
  :preface
  (progn
    (defvar imalison:link-svg-html
      "<svg aria-hidden=\"true\" class=\"octicon octicon-link\" height=\"16\" version=\"1.1\" viewBox=\"0 0 16 16\" width=\"16\"><path fill-rule=\"evenodd\" d=\"M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z\"></path></svg>")
    (defvar imalison:current-html-headline)
    (defun imalison:set-current-html-headline (headline &rest args)
      (setq imalison:current-html-headline headline))
    (defun imalison:clear-current-html-headline (&rest args)
      (setq imalison:current-html-headline nil))
    (defun imalison:org-html-format-heading-function (todo todo-type priority text tags info)
      (let* ((reference (when imalison:current-html-headline
                          (org-export-get-reference imalison:current-html-headline info)))
             ;; Don't do anything special if the current headline is not set
             (new-text (if reference
                           (format "%s <a href=\"#%s\">%s</a>" text reference imalison:link-svg-html)
                         text)))
        (org-html-format-headline-default-function
         todo todo-type priority new-text tags info))))
  :config
  (progn
    ;; This is set before and cleared afterwards, so that we know when we are
    ;; generating the text for the headline itself and when we are not.
    (advice-add 'org-html-headline :before 'imalison:set-current-html-headline)
    (advice-add 'org-html-headline :after 'imalison:clear-current-html-headline)
    (setq org-html-format-headline-function
          'imalison:org-html-format-heading-function)))

(global-visual-line-mode 0)
(add-hook 'text-mode-hook
           (lambda ()
	     (variable-pitch-mode 1)
	     (visual-line-mode nil)
	     (writeroom-mode t)))

(load-theme 'poet-dark)
(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 130)
(set-face-attribute 'fixed-pitch nil :family "DejaVu Sans Mono")
(set-face-attribute 'variable-pitch nil :family "Noto Serif CJK TC")

;; open bookmarks at startup
;; You have to inhibit-startup-screen on startup. See above.
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")
