;;; json --- a little better than XML.

;;; Commentary:
;;; nothing to say, really.  It's JSON.

;;; Code:

(use-package json-mode
  :mode "\\.json\\'"
  :config
  (evil-leader/set-key-for-mode 'json-mode
    ;; *e*diting
    "mef" 'json-mode-beautify
    "met" 'json-toggle-boolean
    "meD" 'json-nullify-sexp
    ; TODO: these two should probably be a hydra
    "men" 'json-increment-number-at-point
    "mep" 'json-decrement-number-at-point

    ;; *y*anking
    "myp" 'json-mode-kill-path))

;;; json.el ends here
