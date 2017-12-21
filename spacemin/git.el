;;; magit --- the best frontend for git in emacs

;;; Commentary:
;;; omg it's so good I love it

;;; Code:

(use-package magit)

(use-package evil-magit
  :config
  (evil-leader/set-key "gs" 'magit-status))

(use-package magit-gh-pulls
  :init
  (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls))

;; TODO:
;;
;; - github integration
;; - shortcut to jump to a Jenkins build for a branch

;;; git.el ends here
