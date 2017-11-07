;;; helm --- pretty much everything?

;;; Commentary:
;;; I tried counsel and it was OK...  I think I like Helm better, if I
;;; can get it working reliably!

;;; Code:

(use-package helm
  :config
  (helm-mode 1)

  (evil-leader/set-key
    ;; commands
    "<SPC>" 'helm-M-x

    ;; *b*uffers
    "bb" 'helm-buffers-list
    )

  (use-package helm-projectile
    :config
    (helm-projectile-on)))

;;; helm.el ends here
