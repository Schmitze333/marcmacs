;;;; Golang ;;;;

(use-package go-mode
  :defer t
  :init
  (defun set-go-test-shortcuts ()
    (message "Setting up go test shortcuts...")
    (global-set-key (kbd "C-, ,") #'go-test-current-file)
    (global-set-key (kbd "C-, C-,") #'go-test-current-test)
    (global-set-key (kbd "C-, b b") #'go-test-current-benchmark))

  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook #'gofmt-before-save)

  (use-package gotest :after go-mode)

  :config
  (add-hook 'go-mode-hook #'set-go-test-shortcuts)
  (add-hook 'go-mode-hook (lambda () (setq tab-width 4))))
