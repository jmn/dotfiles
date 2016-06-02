;; =================== MAIL AND NEWS ==================
;;
;; Note: This file should only contain public information.
;; 

(setq gnus-ignored-newsgroups "")		; List all labels in gmail.

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; (add-to-list 'gnus-secondary-select-methods '(nnimap "gmail"
(setq gnus-select-method
      '(nnimap "gmail"
						     (nnimap-address "imap.gmail.com")  ; it could also be imap.googlemail.com if that's your server.
						     (nnimap-server-port "imaps")
						     (nnimap-stream ssl)))

(setq smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(require 'bbdb)
(setq bbdb/news-auto-create-p t)	; Contacts
(bbdb-initialize 'gnus 'message)
(bbdb-insinuate-message)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(setq bbdb-send-mail-style 'gnus)
(setq bbdb-complete-name-full-completion t)
(setq bbdb-completion-type 'primary-or-name)
(setq bbdb-complete-name-allow-cycling t)
(setq
 bbdb-offer-save 1
 bbdb-use-pop-up t
 bbdb-electric-p t
 bbdb-popup-target-lines  1
 )
(setq bbdb-mua-update-interactive-p '(query . create)) ; Use ":" (colon) to add new BBDB entries from Gnus.
