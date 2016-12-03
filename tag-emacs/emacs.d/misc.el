;; window-margin-mode: https://github.com/aculich/window-margin.el
;; (require 'window-margin)
;; (add-hook 'text-mode-hook 'turn-on-window-margin-mode)

;; (require 'edit-server)	; Chrome extension: http://www.emacswiki.org/emacs/EmacsClient#toc42
;; (edit-server-start)

;; (require 'deft)

;; (require 'org-related)
;; (require 'el4r)
;; (el4r-boot)
;; End of the el4r block.
;; User-setting area is below this line.

;; Experimental: Put modeline on top
;; (setq-default header-line-format mode-line-format) ; Copy mode-line
;; (setq-default mode-line-format nil) ; Remove mode-line

;; (load-theme 'whiteboard t)

; (require 'evil)
; (evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle)

;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!
;; ; Make URLs clickable in GUI Emacs
;; (add-hook 'find-file-hook 'goto-address-mode)

;; (run-at-time "00:05" 86400 '(lambda () (org-mobile-push-with-delay 1))) ;; refreshes agenda file each day


; (copy-region-as-kill) ;;  How to enable?

; (require 'go-mode-load)
; (require 'go-autocomplete)
; (require 'auto-complete-config)
