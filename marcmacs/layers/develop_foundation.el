;;;; Basic stuff for all programming ;;;;

;;; Prerequisites ;;;
;; Go:
;; - go install golang.org/x/tools/cmd/goimports@latest
;; - go install golang.org/x/tools/gopls@latest
;; - asdf reshim golang

;; Set up some basics
(add-hook 'prog-mode-hook (lambda()
	  (electric-pair-mode)
	  (electric-quote-mode)
	  (show-paren-mode)
	  (yafolding-mode)
	  (setq show-trailing-whitespace t)))

;; add-node-modules-path
;; (use-package add-node-modules-path)

;; (use-package prism)

;; (setq use-package-ensure-function 'quelpa)
;; (use-package copilot
;;   :ensure t
;;   :quelpa (copilot :fetcher github
;;                    :repo "zerolfx/copilot.el"
;;                    :branch "main"
;;                    :files ("dist" "*.el"))
;;   :config
;;   (global-set-key (kbd "s-o") 'copilot-complete)
;;   (global-set-key (kbd "s-M-o") 'copilot-panel-complete)
;;   (define-key copilot-completion-map (kbd "C-l") 'copilot-accept-completion)
;;   (define-key copilot-completion-map (kbd "C-n") 'copilot-next-completion)
;;   (define-key copilot-completion-map (kbd "C-p") 'copilot-previous-completion)
;;   (define-key copilot-completion-map (kbd "s-i") 'copilot-clear-overlay))

;; (use-package makefile-executor)

;; json-mode
;; (use-package json-mode
;;   :defer t
;;   :config
;;   (setq js-indent-level 2))

;; (use-package csv-mode)

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
;; (use-package eglot
;;   :config
;;   (add-to-list 'eglot-server-programs
;; 	       '(
;; 		 (web-mode . ("typescript-language-server" "--stdio"))))
;;   (add-hook 'ruby-mode-hook (lambda ()
;; 			      (setq eglot-stay-out-of '(flymake))
;; 			      (eglot-ensure)))
;;   (add-hook 'web-mode-hook 'eglot-ensure)
;;   (add-hook 'go-mode-hook 'eglot-ensure)
;;   (add-hook 'c++-mode-hook (lambda ()
;; 			     (setq eglot-stay-out-of '(flymake))))
;;   (add-hook 'rust-mode-hook (lambda ()
;; 			     (setq eglot-stay-out-of '(flymake))
;; 			     (eglot-ensure)))
;;   (add-hook 'python-mode-hook (lambda ()
;; 				(eglot-ensure)))
;;   :hook
;;   (eglot-managed-hook . me/flymake-eslint-enable-maybe))

;; (use-package flycheck
;;   :custom
;;   (flycheck-gcc-language-standard "c++14")
;;   (flycheck-clang-language-standard "c++14")
;;   :hook (c++-mode . flycheck-mode))

;; Tree-sitter setup
;; (setq treesit-language-source-alist
;; 	     '(
;; 	       (bash "https://github.com/tree-sitter/tree-sitter-bash")
;; 	       (cmake "https://github.com/uyha/tree-sitter-cmake")
;; 	       (css "https://github.com/tree-sitter/tree-sitter-css")
;; 	       (elisp "https://github.com/Wilfred/tree-sitter-elisp")
;; 	       (go "https://github.com/tree-sitter/tree-sitter-go")
;; 	       (html "https://github.com/tree-sitter/tree-sitter-html")
;; 	       (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
;; 	       (json "https://github.com/tree-sitter/tree-sitter-json")
;; 	       (make "https://github.com/alemuller/tree-sitter-make")
;; 	       (markdown "https://github.com/ikatyang/tree-sitter-markdown")
;; 	       (python "https://github.com/tree-sitter/tree-sitter-python")
;; 	       (toml "https://github.com/tree-sitter/tree-sitter-toml")
;; 	       (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
;; 	       (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
;; 	       (yaml "https://github.com/ikatyang/tree-sitter-yaml")
;; 	       ))
