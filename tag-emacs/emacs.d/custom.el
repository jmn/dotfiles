(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#002b36")
 '(background-mode dark)
 '(backup-directory-alist (list (cons "" (file-truename "backups/emacs"))))
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(browse-url-generic-program "\"chromium-browser\"")
 '(cursor-color "#839496")
 '(custom-safe-themes
   (quote
    ("dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "5fc89c5c93a91f4f154b1b7fcccf912c409a166f5b56277aa6c182a8ab1780ec" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8cade4e71b36e5e5584feb317a55faea1f5502e32d6ff4bc8ae4d083b761b7ae" "2d6352478823568008f5c28f6c6184930e58f1bd4a91c256da921f94f454d54c" "684903678e6007badfcf3acb8b4f47d63503fa644e56ac880ea5835d177b8759" "ab97bb0f443932c5386478d9300223c56d365c197b1f0474f9fb427ec3a768e9" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9f443833deb3412a34d2d2c912247349d4bd1b09e0f5eaba11a3ea7872892000" "40ff40cbc033a4beaaac6d31d598f1388a04d0a7b1f1950f6210db192507bfeb" "2ecfc608db5a5d29d0df7bf1e4647570f291f4664d3385c60b2d50fbae1c6a00" "8945af8d3ad6d4e9ce86e315e690f1f30b192b44a99135f296331737baea37e1" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(deft-extension "md")
 '(deft-text-mode (quote markdown-mode))
 '(erc-lurker-hide-list (quote ("PART" "QUIT")))
 '(erc-modules
   (quote
    (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring scrolltobottom stamp track)))
 '(erc-scrolltobottom-mode t)
 '(evil-emacs-state-modes
   (quote
    (archive-mode bbdb-mode bookmark-bmenu-mode bookmark-edit-annotation-mode browse-kill-ring-mode bzr-annotate-mode calc-mode cfw:calendar-mode completion-list-mode Custom-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode doc-view-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode google-maps-static-mode ibuffer-mode jde-javadoc-checker-report-mode magit-commit-mode magit-diff-mode magit-key-mode magit-log-mode magit-mode magit-reflog-mode magit-show-branches-mode magit-stash-mode magit-status-mode magit-wazzup-mode mh-folder-mode monky-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode occur-mode org-agenda-mode package-menu-mode proced-mode rcirc-mode rebase-mode recentf-dialog-mode reftex-select-bib-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tar-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-git-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode item-mode)))
 '(evil-intercept-maps (quote ((edebug-mode-map) (treeview-mode-map))))
 '(evil-mode nil)
 '(evil-overriding-maps
   (quote
    ((Buffer-menu-mode-map)
     (color-theme-mode-map)
     (comint-mode-map)
     (compilation-mode-map)
     (dictionary-mode-map)
     (ert-results-mode-map . motion)
     (Info-mode-map . motion)
     (speedbar-key-map)
     (speedbar-file-key-map)
     (speedbar-buffers-key-map))))
 '(fci-rule-color "#383838")
 '(flyspell-issue-message-flag nil)
 '(foreground-color "#839496")
 '(global-font-lock-mode t)
 '(hippie-expand-try-functions-list
   (quote
    (try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol ispell-complete-word)))
 '(inhibit-startup-screen t)
 '(ispell-local-dictionary-alist
   (quote
    (("american" "[A-Za-z]" "[^A-Za-z]" "" t
      ("-C" "-d" "en_US")
      "~latin1" iso-8859-1)
     ("swedish" "[A-Za-z\345\344\366\305\304\366]" "[^A-Za-z\345\344\366\305\304\366]" "[']" t
      ("-C" "-d" "sv_SE")
      "~latin1" iso-8859-1))))
 '(ispell-program-name "hunspell")
 '(linum-format "%5d ")
 '(newsticker-automatically-mark-items-as-old nil)
 '(newsticker-debug t)
 '(newsticker-html-renderer (quote w3m-region))
 '(newsticker-retrieval-interval 1600)
 '(newsticker-retrieval-method (quote intern))
 '(newsticker-url-list
   (quote
    (("Emacswiki news" "http://www.emacswiki.org/emacs?action=rss;match=%5E%5Cd%5Cd%5Cd%5Cd-%5Cd%5Cd-%5Cd%5Cd" nil nil nil)
     ("jwz" "http://www.jwz.org/blog/feed/" nil nil nil)
     ("Technomancy" "http://technomancy.us/feed/atom.xml" nil nil nil)
     ("lwn" "http://lwn.net/headlines/newrss" nil nil nil)
     ("The Setup" "http://usesthis.com/feed/" nil nil nil)
     ("Iamcal" "http://www.iamcal.com/rss/" nil nil nil)
     ("Emacs-fu" "http://emacs-fu.blogspot.com/feeds/posts/default" nil nil nil)
     ("Fun facts" "http://noahveltman.com/funfacts/rss/" nil nil nil)
     ("Daring Fireball" "http://daringfireball.net/index.xml" nil nil nil)
     ("Erin McKean" "http://lasersoptional.com/feed/" nil nil nil)
     ("Stephen Wolfram" "http://blog.stephenwolfram.com/feed/" nil nil nil)
     ("Wolfram Blog" "http://blog.wolfram.com/feed/" nil nil nil)
     ("Casey Johnston" "http://caseyjohnston.net/rss" nil nil nil)
     ("Jason Blevins" "http://jblevins.org/index.atom" nil nil nil)
     ("Julien Danjou" "http://julien.danjou.info/blog/index.xml" nil nil nil)
     ("Golang blog" "http://blog.golang.org/feeds/posts/default" nil nil nil))))
 '(newsticker-use-full-width nil)
 '(newsticker-wget-arguments (quote ("-q" "-O" "-" "--user-agent" "testing")))
 '(newsticker-wget-name "wget")
 '(org-babel-load-languages
   (quote
    ((haskell . t)
     (emacs-lisp . t)
     (emacs-lisp . t)
     (python . t))))
 '(org-babel-scheme-cmd "guile --no-auto-compile")
 '(org-capture-templates
   (quote
    (("t" "Todo" entry
      (file+headline "newgtd.org" "Tasks")
      "* TODO %^{Brief Description} %^g 
%?
Added: %U")
     ("j" "Journal" entry
      (file+headline "journal.org" "Journal")
      "** %^{Head Line} %U %^g
%i%?")
     ("B" "(we)Blog entry" entry
      (file+headline "journal.org" "Journal")
      "** %^{Head Line} %U %^g
:PROPERTIES:
:on: %t
:category:
:ex:
:tags:
:END:
%i%?")
     ("c" "Clipboard" entry
      (file+headline "journal.org" "")
      "** %^{Head Line} %U %^g
%c
%?")
     ("b" "Book" entry
      (file+headline "journal.org" "")
      "** %^{Book Title} %t :BOOK: 
%[.book_template.txt]
")
     ("f" "Film" entry
      (file+headline "journal.org" "")
      "** %^{Film Title} %t :FILM: 
%[.film_template.txt]
")
     ("a" "Daily Review" entry
      (file+headline "journal.org" "")
      "** Daily Review %U					:COACH: 
%[.daily_review.txt]
"))))
 '(org-custom-properties (quote ("STARTUP" "on")))
 '(org-default-notes-file "remember.org")
 '(org-export-in-background nil)
 '(org-export-initial-scope (quote subtree))
 '(org-export-show-temporary-export-buffer t)
 '(org-export-with-author nil)
 '(org-export-with-date nil)
 '(org-export-with-toc nil)
 '(org-html-postamble nil)
 '(org-html-use-unicode-chars t)
 '(org-make-link-description-function (quote jmn/url-get-title))
 '(org-remember-templates
   (quote
    (("Daily Review" 82 ".daily_review.txt
" "journal.org" nil nil))))
 '(org-src-fontify-natively nil)
 '(org-src-lang-modes
   (quote
    (("ocaml" . tuareg)
     ("elisp" . emacs-lisp)
     ("ditaa" . artist)
     ("asymptote" . asy)
     ("dot" . fundamental)
     ("sqlite" . sql)
     ("calc" . fundamental)
     ("C" . c)
     ("cpp" . c++)
     ("screen" . shell-script)
     ("clojure" . clojure))))
 '(org-structure-template-alist
   (quote
    (("s" "#+BEGIN_SRC ?

#+END_SRC" "<src lang=\"?\">

</src>")
     ("el" "#+BEGIN_SRC emacs-lisp

#+END_SRC" "<src lang=\"emacs-lisp\">

</src>")
     ("e" "#+BEGIN_EXAMPLE
?
#+END_EXAMPLE" "<example>
?
</example>")
     ("q" "#+BEGIN_QUOTE
?
#+END_QUOTE" "<quote>
?
</quote>")
     ("v" "#+BEGIN_VERSE
?
#+END_VERSE" "<verse>
?
</verse>")
     ("V" "#+BEGIN_VERBATIM
?
#+END_VERBATIM" "<verbatim>
?
</verbatim>")
     ("c" "#+BEGIN_CENTER
?
#+END_CENTER" "<center>
?
</center>")
     ("l" "#+BEGIN_LaTeX
?
#+END_LaTeX" "<literal style=\"latex\">
?
</literal>")
     ("L" "#+LaTeX: " "<literal style=\"latex\">?</literal>")
     ("h" "#+BEGIN_HTML
?
#+END_HTML" "<literal style=\"html\">
?
</literal>")
     ("H" "#+HTML: " "<literal style=\"html\">?</literal>")
     ("a" "#+BEGIN_ASCII
?
#+END_ASCII")
     ("A" "#+ASCII: ")
     ("i" "#+INDEX: ?" "#+INDEX: ?")
     ("I" "#+INCLUDE: %file ?" "<include file=%file markup=\"?\">"))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "STARTED(s)" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELLED(c@/!)"))))
 '(rw-hunspell-default-dictionary "sv_SE_Hunspell")
 '(rw-hunspell-delete-dictionary-base-alist t)
 '(rw-hunspell-dicpath-list (quote ("/usr/share/hunspell")))
 '(rw-hunspell-make-dictionary-menu nil)
 '(rw-hunspell-use-rw-ispell nil)
 '(save-interprogram-paste-before-kill t)
 '(scroll-bar-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(sml-modeline-numbers (quote percentage))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587 t)
 '(speck-hunspell-language-options
   (quote
    (("sv" iso-8859-1 nil t nil)
     ("da" utf-8 nil t nil)
     ("de" iso-8859-1 nil t nil)
     ("en" iso-8859-1 nil nil nil)
     ("fr" iso-8859-1 nil nil nil))))
 '(speck-hunspell-library-directory "/usr/share/hunspell")
 '(sr-speedbar-right-side nil)
 '(tab-always-indent nil)
 '(tab-width 8)
 '(tool-bar-mode nil)
 '(use-dialog-box nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(w3m-default-display-inline-images t)
 '(window-min-width 30)
 '(writeroom-width 100)
 '(x-select-enable-primary t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2e3436" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :family "Fantasque Sans Mono" :foundry "PfEd"))))
 '(fixed-pitch ((t (:underline nil))))
 '(newsticker-feed-face ((t (:inherit default :weight bold))) t)
 '(newsticker-immortal-item-face ((t (:inherit default :foreground "orange" :slant italic :weight bold))) t)
 '(newsticker-new-item-face ((t (:inherit default :weight bold))) t)
 '(newsticker-old-item-face ((t (:inherit default :foreground "orange3" :weight bold))) t)
 '(newsticker-statistics-face ((t (:inherit default :slant italic :height 0.8))) t)
 '(newsticker-treeview-face ((t (:inherit default :weight normal :family "sans"))) t)
 '(org-date ((t (:foreground "gray" :underline nil :weight normal))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "white smoke"))))
 '(org-level-2 ((t (:inherit outline-2 :foreground "white smoke"))))
 '(org-level-3 ((t (:foreground "dark gray"))))
 '(org-level-4 ((t (:foreground "white smoke"))))
 '(org-level-5 ((t (:inherit outline-5 :foreground "white smoke"))))
 '(org-level-6 ((t (:inherit outline-6 :foreground "white smoke"))))
 '(org-link ((((class color) (min-colors 89)) (:foreground "#b58900" :underline t))))
 '(org-todo ((t (:weight bold))))
 '(sml-modeline-end-face ((t nil)) t)
 '(variable-pitch ((t (:underline nil :weight normal :family "Junicode")))))

;; CUSTOM ENDS HERE
