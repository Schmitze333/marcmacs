;;;; Startup with a custom Dashboard ;;;;
(use-package dashboard
  :ensure t
  :demand
  :init
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-banner-logo-title "Happy Hacking!")
  (setq dashboard-startup-banner "~/.emacs.d/marcmacs/monstermacs.png")
  (setq dashboard-center-content t)
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-items
	'((recents . 4)
	  (projects . 5)
	  (agenda . 4)))
  (setq dashboard-set-file-icons t)
  :config
  (dashboard-setup-startup-hook))

;; Show Dashboard screen
(dashboard-refresh-buffer)
