;;;; Rust Development ;;;;

(use-package rustic
  :ensure t
  :custom
  (rustic-lsp-client 'eglot)
  (rustic-format-on-save t))
