;; Setup Python things

;; Use elpy
(use-package elpy :ensure
	:config
	(advice-add 'python-mode :before 'elpy-enable)
	(setq elpy-rpc-backend "jedi"))

;; Use flycheck for syntax checking on the fly
(use-package flycheck :ensure
	:config
	(add-hook 'elpy-mode-hook 'flycheck-mode))

;; Adhere to pep8 standards (hopefully this makes files automatically adjust when saving)
(use-package py-autopep8 :ensure
	:config
	(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package jedi :ensure
	:config
	(add-hook 'python-mode-hook 'jedi:setup)
	(setq jedi:complete-on-dot t))
