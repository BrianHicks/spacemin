;;; git --- vcs!

;;; Commentary:

;;; Code:

(use-package magit
  :bind-prefix
  ("g" '(:ignore t :which-key "git")
   "gs" 'magit-status))

(use-package evil-magit)

(use-package magit-gh-pulls
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls))

;; TODO:
;;
;; - github integration
;; - shortcut to jump to a Jenkins build for a branch

(provide 'git)

;;; git.el ends here
