; Programming convenience 
; skeleton-pair inserts the end parenthesis automatically

(show-paren-mode t)
(setq skeleton-pair t)
;; Auto insertion of corresponding parentheses. Can be annoying
;; So disabled for now. see also: "electricity", electric-pair-mode
;; (global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
