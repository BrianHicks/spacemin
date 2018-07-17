;;; services --- manage processes

;;; Commentary:

;;; Code:

(use-package prodigy
  :general
  (general-nmap :prefix "<SPC>"
                "S" 'prodigy)

  (general-nmap :keymaps 'prodigy-mode-map
                "s" 'prodigy-start
                "S" 'prodigy-stop
                "R" 'prodigy-restart
                "$" 'prodigy-display-process
                "o" 'prodigy-browse
                "G" 'prodigy-refresh)

  (general-nmap :keymaps 'prodigy-mode-map
                :prefix ","
                "y" 'prodigy-copy-cmd
                "d" 'prodigy-jump-dired
                "g" 'prodigy-jump-magit

                "f" '(:ignore t :wk "filter")
                "fn" 'prodigy-add-name-filter
                "ft" 'prodigy-add-tag-filter
                "fa" 'prodigy-clear-filters)

  (general-nmap :keymaps '(prodigy-mode-map prodigy-view-mode-map)
                "q" 'quit-window)

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
    :name 'spring
    :command "spring"
    :args '("server")
    :ready-message "started on")

  (prodigy-define-tag
    :name 'rails-server
    :command "rails"
    :args '("server"
            "-p" "9000")
    :ready-message "Listening on .+, CTRL\\+C to stop")

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

  (prodigy-define-tag
    :name 'hugo
    :command "hugo"
    :args '("serve"
            "--bind" "127.0.0.1"
            "--port" "1313")
    :port 1313
    :ready-message "Press Ctrl\\+C to stop")

  (let ((local-services "~/.emacs.d/prodigy-services.el"))
    (if (file-exists-p local-services) (load-file local-services))))

(provide 'services)

;;; services.el ends here
