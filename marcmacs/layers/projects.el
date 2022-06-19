;;;; Managing Project layouts ;;;;

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode)
  :bind
  ("C-M-j" . projectile-run-vterm)
  (:map projectile-command-map
	("s-p". consult-project-buffer)
	("f" . consult-projectile-find-file))
  :bind-keymap
  ("s-p" . projectile-command-map)
  :init
  (when (file-directory-p "~/develop/ivx")
    (setq projectile-project-search-path '("~/develop/ivx")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package consult-projectile
  :after projectile)

(use-package perspective
  :custom
  (persp-mode-prefix-key (kbd "s-l"))
  :bind (("C-x C-b" . persp-list-buffers)
	 :map perspective-map
	 ("s-l" . persp-switch-last))   ; or use a nicer switcher, see below
  :config
  (persp-mode))

;; Integrate perspective.el with projectile
(use-package persp-projectile
  :bind
  (:map projectile-command-map ("l" . #'projectile-persp-switch-project)))
