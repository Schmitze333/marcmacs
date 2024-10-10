;;;; Managing Project layouts ;;;;

(use-package projectile
  :diminish projectile-mode
  :init
  (when (file-directory-p "~/develop/ivx")
    (setq projectile-project-search-path '("~/develop/ivx")))
  (setq projectile-switch-project-action #'projectile-dired)
  :config
  (projectile-mode)
  :bind
  (("C-M-j" . projectile-run-eshell)
   :map projectile-command-map
   ("s-p". consult-project-buffer)
   ("f" . consult-projectile-find-file)
   :map global-map
   ("M-o s". projectile-run-shell)
   ("M-o e". projectile-run-eshell)
   ("M-o v". projectile-run-vterm)
   )
  :bind-keymap
  ("s-p" . projectile-command-map))

(use-package consult-projectile
  :after projectile)

(use-package perspective
  :bind ("C-x C-b" . persp-list-buffers)   ; or use a nicer switcher, see below
  (:map perspective-map
	("l" . persp-switch)
	("s-l" . persp-switch-last))
  :custom
  (persp-mode-prefix-key (kbd "s-l"))
  :config
  (persp-mode))

;; Integrate perspective.el with projectile
(use-package persp-projectile
  :bind
  (:map projectile-command-map ("l" . #'projectile-persp-switch-project)))

(use-package projectile-speedbar
  :bind
  ("M-<f2>" . #'projectile-speedbar-open-current-buffer-in-tree))
