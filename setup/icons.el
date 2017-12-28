;;; icons --- graphics!

;;; Commentary:

;;; Code:

;; all the icons!
(use-package all-the-icons
  :general
  (general-nmap :prefix "SPC"
		"i" '(:ignore t :wk "inserting")
		"ii" 'all-the-icons-insert))

(use-package all-the-icons-dired
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(provide 'icons)

;;; icons.el ends here
