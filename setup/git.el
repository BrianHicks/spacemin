;;; git --- vcs!

;;; Commentary:

;;; Code:

(use-package magit
  :general
  (general-nmap :prefix "SPC"
                "g" '(:ignore t :which-key "git")
                "gs" 'magit-status
                "gb" 'magit-blame)

  :config
  (setq git-commit-fill-column 72))

(use-package evil-magit
  :after magit)

(use-package magit-gh-pulls
  :after magit
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls))

(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode 1))

;; TODO:
;;
;; - github integration
;; - shortcut to jump to a Jenkins build for a branch

(provide 'git)

;;; git.el ends here
