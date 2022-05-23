;;;; Basic stuff for all programming ;;;;

;; add-node-modules-path
(use-package add-node-modules-path
  :hook (ruby-mode web-mode))

;; json-mode
(use-package json-mode
  :defer t
  :config
  (setq js-indent-level 2))

;; Prettier 🧞‍♀️
(use-package
  prettier-js
  :hook (web-mode . prettier-js-mode)
  (ruby-mode . prettier-js-mode))

;; (use-package lsp-mode
;;   :init
;;   :hook ((web-mode . lsp-deferred)
;;    (ruby-mode . lsp-deferred)
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :config
;;   (setq lsp-log-io nil)
;;   (setq lsp-restart 'auto-restart)
;;   (setq lsp-keymap-prefix "C-c l")
;;   :commands lsp-deferred)

;; (use-package lsp-ui
;;   :custom
;;   (lsp-ui-sideline-show-diagnostics t)
;;   (lsp-ui-sideline-show-hover t)
;;   (lsp-ui-sideline-show-code-actions t)
;;   :commands lsp-ui-mode)

;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; eglot
(use-package eglot
  :config
  ;; (setq eglot-stay-out-of '(flymake))
  ;; (add-hook 'eglot--managed-mode-hook (lambda ()
					;; (add-hook 'flymake-diagnostic-functions
						  ;; 'eglot-flymake-backend nil t)))
  ;; (add-hook 'ruby-mode-hook 'eglot-ensure)
  (add-to-list 'eglot-server-programs '(web-mode . ("typescript-language-server" "--stdio")))
  (add-hook 'ruby-mode-hook (lambda ()
			      (setq eglot-stay-out-of '(flymake))
			      (eglot-ensure)))
  (add-hook 'web-mode-hook 'eglot-ensure)
  (add-hook 'go-mode-hook 'eglot-ensure))
