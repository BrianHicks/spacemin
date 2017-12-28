;;; lang-json --- a little better than XML.

;;; Commentary:
;;; nothing to say, really.  It's JSON.

;;; Code:

(use-package json-mode
  :bind-leader-local
  ("e" '(:ignore t :which-key "edit")
   "ef" 'json-mode-beautify
   "et" 'json-toggle-boolean
   "eD" 'json-nullify-sexp
					; TODO: these two should probably be a hydra
   "en" 'json-increment-number-at-point
   "ep" 'json-decrement-number-at-point

   "y" '(:ignore t :which-key "yanking")
   "yp" 'json-mode-kill-path))

(provide 'lang-json)

;;; lang-json.el ends here
