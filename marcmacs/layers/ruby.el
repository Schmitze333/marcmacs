;;;; Ruby Layer ;;;;

(use-package ruby-end
  :defer t)

(use-package flymake-ruby
  :hook (ruby-mode . flymake-ruby-load))

(use-package rubocop
  :hook (ruby-mode . rubocop-mode))

(use-package inf-ruby
  :defer t)

(use-package bundler
  :bind
  ((:map ruby-mode-map ("C-c b i" . #'bundle-install))
   (:map ruby-mode-map ("C-c b x" . #'bundle-exec))
   (:map ruby-mode-map ("C-c b u" . #'bundle-update))
   (:map ruby-mode-map ("C-c b o" . #'bundle-outdated))))

(use-package rspec-mode
  :hook (ruby-mode)
  :init
  (add-hook 'compilation-filter-hook #'inf-ruby-auto-enter)
  (add-hook 'rspec-before-verification-hook #'save-some-buffers)
  :config
  (rspec-install-snippets)
  (setq compilation-scroll-output t))

(use-package minitest
  :defer t)
