;;; git --- vcs!

;;; Commentary:

;;; Code:

(use-package magit
  :general
  (general-nmap "SPC g" '(:ignore t :which-key "git")
		"SPC gs" 'magit-status)

  :config
  (use-package evil-magit)

  (use-package magit-gh-pulls
    :config
    (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)))

;; TODO:
;;
;; - github integration
;; - shortcut to jump to a Jenkins build for a branch

(provide 'git)

;;; git.el ends here
