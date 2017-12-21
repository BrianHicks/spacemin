;;; helm --- pretty much everything?

;;; Commentary:
;;; I tried counsel and it was OK...  I think I like Helm better, if I
;;; can get it working reliably!

;;; Code:

(use-package helm
  :delight
  :config
  (helm-mode 1)

  (setq helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-file-cache-fuzzy-match t
        helm-window-prefer-horizontal-split t
        helm-display-function 'pop-to-buffer)

  (globalleader
   "<SPC>" 'helm-M-x

   "bb" 'helm-mini

   "y" '(:ignore t :which-key "yanking")
   "yp" 'helm-show-kill-ring)
  )

(use-package helm-projectile
  :config
  (helm-projectile-on)

  (setq helm-projectile-fuzzy-match t))

(use-package helm-ag)

;;; helm.el ends here
