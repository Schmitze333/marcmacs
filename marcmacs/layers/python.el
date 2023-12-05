(use-package pytest
  :config
  (add-to-list 'pytest-project-root-files "pytest.ini")
  (add-hook 'python-mode-hook
	    (lambda ()
            (local-set-key (kbd "C-, a") 'pytest-all)
            (local-set-key (kbd "C-, m") 'pytest-module)
            (local-set-key (kbd "C-, ,") 'pytest-one)
            (local-set-key (kbd "C-, f") 'pytest-failed)
            (local-set-key (kbd "C-, l") 'pytest-again)
            (local-set-key (kbd "C-, d") 'pytest-directory)
            (local-set-key (kbd "C-, A") 'pytest-pdb-all)
            (local-set-key (kbd "C-, M") 'pytest-pdb-module)
            (local-set-key (kbd "C-, <") 'pytest-pdb-one))))
