;; Publishing (using org-jekyll)
(require 'ox-publish)
(require 'org-jekyll)

(setq org-publish-jmn "~/git/foo")
(setq org-publish-jmn-blog "~/Dropbox/GTD/")

(setq org-jekyll-lang-subdirs '(("en" . "publish-blog/blog/")))

(setq org-publish-project-alist
        '(
             ("jmn-technotes-org"
               :base-directory "~/Dropbox/GTD/"
               :recursive t
               :base-extension "org"
               :publishing-directory "~/git/jmn.github.io/"
               :exclude "^blog\\|newgtd.org\\|mobile.org\\|mobileorg.org"
               :site-root "http://jmn.github.io"
               :jekyll-sanitize-permalinks t
               :publishing-function org-publish-org-to-html
               :section-numbers nil
               :headline-levels 4
               :table-of-contents t
               :auto-index nil
               :auto-preamble nil
               :body-only t
               :auto-postamble nil))
)

(add-to-list 'org-publish-project-alist
             '("jmn-img"
               :base-directory "~/Dropbox/GTD/"
               :recursive t
               :exclude "^publish"
               :base-extension "jpg\\|gif\\|png"
               :publishing-directory "~/git/jmn.github.io/"
               :publishing-function org-publish-attachment))

(add-to-list 'org-publish-project-alist
             '("jmn" :components ("jmn-technotes-org"
                                 "jmn-img")))

(add-to-list 'org-publish-project-alist
             '("jmn-technotes"
               :base-directory "~/Dropbox/GTD/"
               :recursive t
               :base-extension "org"
               :publishing-directory "~/git/jmn.github.io/"
               :blog-publishing-directory "~/git/jmn.github.io/"
               :site-root "http://jmn.github.io"
               :jekyll-sanitize-permalinks t
               :publishing-function org-publish-org-to-html
               :section-numbers nil
               :headline-levels 4
               :table-of-contents nil
               :auto-index nil
               :auto-preamble nil
               :body-only t
               :auto-postamble nil))

;; Remap org-mode meta keys for convenience
;; (mapcar (lambda (state)
;; 	  (evil-declare-key state org-mode-map
;; 			    (kbd "M-l") 'org-metaright
;; 			    (kbd "M-h") 'org-metaleft
;; 			    (kbd "M-k") 'org-metaup
;; 			    (kbd "M-j") 'org-metadown
;; 			    (kbd "M-L") 'org-shiftmetaright
;; 			    (kbd "M-H") 'org-shiftmetaleft
;; 			    (kbd "M-K") 'org-shiftmetaup
;; 			    (kbd "M-J") 'org-shiftmetadown))
;; 	'(normal insert))
;; 


;; Org
;; Use a different typeface (font) for org-mode
;; (add-hook 'text-mode-hook 'variable-pitch-mode)

;; ;; (add-hook 'org-mode-hook (lambda ()
;;                            (setq buffer-face-mode-face '(:font "Bitstream Vera Sans Mono-12"))
;;                            (buffer-face-mode)))

;; Use fixed-width font for tables and variable-pitch for text
;; (defun my-adjoin-to-list-or-;; symbol (element list-or-symbol)
;;   (let ((list (if (not (listp list-or-symbol))
;;                   (list list-or-symbol)
;;                 list-or-symbol)))
;;     (require 'cl-lib)
;;     (cl-adjoin element list)))

;; (eval-after-load "org"
;;   '(mapc
;;     (lambda (face)
;;       (set-face-attribute
;;        face nil
;;        :inherit
;;        (my-adjoin-to-list-or-symbol
;;         'fixed-pitch
;;         (face-attribute face :inherit))))
;;     (list 'org-code 'org-block 'org-table 'org-block-background)))
