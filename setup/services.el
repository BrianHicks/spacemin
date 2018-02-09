;;; services --- manage processes

;;; Commentary:

;;; Code:

(use-package prodigy
  :general
  (general-nmap :prefix "<SPC>"
                "S" 'prodigy)

  ;; C-w             prodigy-copy-cmd
  ;;   (that binding is currently shadowed by another mode)
  ;; $               prodigy-display-process
  ;; F               prodigy-clear-filters
  ;; M               prodigy-mark-all
  ;; S               prodigy-stop
  ;; T               prodigy-unmark-tag
  ;; U               prodigy-unmark-all
  ;; f               Prefix Command
  ;; g               revert-buffer
  ;; h               describe-mode
  ;; j               Prefix Command
  ;; m               prodigy-mark
  ;; r               prodigy-restart
  ;; s               prodigy-start
  ;; t               prodigy-mark-tag
  ;; u               prodigy-unmark
  ;; DEL             scroll-down-command
  ;; S-SPC           scroll-down-command
  ;; <backtab>       backward-button
  ;; <follow-link>   mouse-face
  ;; <mouse-2>       mouse-select-window
  ;;   (that binding is currently shadowed by another mode)
  ;; <remap>         Prefix Command
  ;;
  ;; j d             prodigy-jump-dired
  ;; j m             prodigy-jump-magit
  ;;
  ;; f n             prodigy-add-name-filter
  ;; f t             prodigy-add-tag-filter
  ;;
  ;; M-<             prodigy-first
  ;; M->             prodigy-last

  ;; (general-nmap :keymaps 'prodigy-mode-map
  ;;               "j" 'prodigy-next
  ;;               "J" 'prodigy-next-with-status
  ;;               "k" 'prodigy-prev
  ;;               "K" 'prodigy-prev-with-status
  ;;               "<RET>" 'prodigy-restart
  ;;               "q" 'quit-window
  ;;               )

  ;; (general-nmap :keymaps 'prodigy-mode-map
  ;;               :prefix ","
  ;;               "y" 'prodigy-copy-cmd
  ;;               "o" 'prodigy-browse)

  :config
  ;; https://github.com/dgtized/dotfiles/blob/master/site-lisp/clgc-prodigy.el
  (prodigy-define-tag
    :name 'zeus-server
    :command "zeus"
    :args '("server"
            "-p" "9000"
            "-b" "0.0.0.0")
    :ready-message "Listening on .+, CTRL\\+C to stop")

  (prodigy-define-tag
    :name 'zeus
    :command "zeus"
    :args '("--simple-status" "start")
    :ready-message "environment: development_environment status: ready")

  (prodigy-define-tag
    :name 'resque-pool
    :command "bundle"
    :args (prodigy-callback (service)
            (cons "exec" (cons "resque-pool" (plist-get service :resque-pool-args))))
    :ready-message "Resque Pool running")

  (prodigy-define-tag
    :name 'resque-scheduler
    :command "bundle"
    :args (prodigy-callback (service)
            (cons "exec" (cons "resque-scheduler" (plist-get service :resque-scheduler-args))))
    :ready-message "Schedules Loaded")

  (let ((local-services "~/.emacs.d/prodigy-services.el"))
    (if (file-exists-p local-services) (load-file local-services))))

(provide 'services)

;;; services.el ends here
