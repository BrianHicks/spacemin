;;; profiling.el --- what's going slowly?

;;; Commentary:

;;; Code:

(use-package esup
  :general
  (general-nmap :prefix "SPC"
                "m" '(:ignore t :wk "meta")
                "mp" 'esup))

(provide 'profiling)

;;; profiling.el ends here
