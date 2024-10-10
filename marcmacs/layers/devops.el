(use-package terraform-mode
  :defer t
  :mode "\\.tf\\’"
  :init
  (add-to-list 'eglot-server-programs
	       '(terraform-mode "terraform-ls" "serve"))
  :after eglot)

(use-package terraform-doc)

(use-package k8s-mode
  :mode ("\\.yaml\.gotmpl\\'" . k8s-mode))

(use-package kubernetes-helm)
(use-package kubedoc)

