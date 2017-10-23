;; magit is great! Hooray!
(use-package magit
  :config
  (evil-leader/set-key "gs" 'magit-status)
  (use-package evil-magit))

;; TODO:
;;
;; - github integration
;; - shortcut to jump to a PR for a branch
;; - shortcut to jump to a Jenkins build for a branch
