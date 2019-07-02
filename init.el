;; init.el --- Emacs configuration
;; Personal Emacs Config - by Shashank Swaminathan
;;
;; Special thanks to Dieter Brehm (https://github.com/Inkering), from who most of this code is inspired/taken from

;; improve startup time
(setq-default file-name-handler-alist nil
              gc-cons-threshold 402653184
							gc-cons-percentage 0.6)

;; misc
(setq c-default-style "linux"
      c-basic-offset 4
      sgml-basic-offset 4)
(c-set-offset `inline-open 0)
(setq-default tab-width 2)

;; Install Melpa
(require 'package)
(setq-default package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                                 ("melpa" . "https://melpa.org/packages/")
                                 ("org" . "https://orgmode.org/elpa/"))
              package-enable-at-startup nil
							load-prefer-newer t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
	(package-install 'use-package))

;; global show whitespace
(setq-default show-trailing-whitespace t)
(savehist-mode 1)
(show-paren-mode 1)
(column-number-mode 1)
(tool-bar-mode -1)
(global-linum-mode t)
(delete-selection-mode 1)

;; when using fill-paragraph or fill-region or auto-fill, set desired width
(setq-default fill-column 80)

;; don't just throw temp files everywhere please
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; don't show scroll bars
(toggle-scroll-bar -1)

;; how many lines to move when scrolling
(setq scroll-step 1)

;; turn all yes or no's to y's or n's
(fset 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-message t) ;; hide the startup message

(use-package dracula-theme :ensure
	:config
	(load-theme 'dracula t)) ;; load material theme

(use-package olivetti :ensure)

;; Smarter buffer management
(use-package ibuffer :ensure
	:bind ("C-x C-b" . ibuffer)
	:config
	(autoload 'ibuffer "ibuffer" "List Buffers." t))

;; company = complete-any, a completion backend
(use-package company :ensure
  :config
  (add-hook 'prog-mode-hook 'company-mode)
  (setq company-idle-delay 0.1)
  (bind-key "<C-tab>" 'company-manual-begin))

;; sort company completions by usage stats
(use-package company-statistics :ensure
  :config
(company-statistics-mode))

;; snippets
(use-package yasnippet-snippets :ensure)
(yas-global-mode 1)

;; syntax for markdown, essential for Readme files
(use-package markdown-mode :ensure
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
				 ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; A convenient filetree
(use-package neotree :ensure
  :bind ("<f8>" . neotree-toggle)
  :config
  (setq neo-theme (if (display-graphic-p) 'ascii 'arrow))) ; make the left-side markers pretty

;; simplifies the management of undo's
(use-package undo-tree :ensure
  :config
  (bind-key "M-/" 'undo-tree-visualize)
  (global-undo-tree-mode))

;; (displays possible commands in a minibuffer when a leader key is pressed)
(use-package which-key :ensure
  :config
  (which-key-mode))

;; git client for emacs
(use-package magit :ensure
  :bind ("C-x g" . magit-status)
  :config
(setq magit-completing-read-function 'ivy-completing-read))

;; dockerfile-mode
(use-package dockerfile-mode :ensure t
	:mode ("Dockerfile\\'" . dockerfile-mode))
