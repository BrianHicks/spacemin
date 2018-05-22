;;; project-nav --- project drawer

;;; Commentary:

;;; Code:

; dired
; TODO: how to use use-package here?

(general-nmap "-" 'dired-jump)

(general-nmap :prefix "<SPC>"
              "ff" 'dired-jump-other-window)

(general-nmap :keymaps 'dired-mode-map
              ;; overrides
              ";" 'evil-ex

              ; moving around
              "-" 'dired-jump)

(general-nmap :keymaps 'dired-mode-map
              :prefix ","
              "e" '(:ignore t :wk "encryption")
              "ed" 'epa-dired-do-decrypt
              "ee" 'epa-dired-do-encrypt
              "es" 'epa-dired-do-sign
              "ev" 'epa-dired-do-verify)

(provide 'project-nav)

;;; project-nav.el ends here
