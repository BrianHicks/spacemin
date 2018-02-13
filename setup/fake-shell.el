;;; fake-shell --- eshell but named weird so I don't clobber it

;;; Commentary:

;;; Code:

(require 'eshell)
(require 'em-smart)

(setq eshell-where-to-jump 'begin
      eshell-review-quick-commands nil
      eshell-smart-space-goes-to-end t
      eshell-aliases-file "~/.emacs.d/eshell-aliases")

(general-nmap :prefix "<SPC>"
              "'" 'projectile-run-eshell)

(provide 'fake-shell)

;;; fake-shell.el ends here
