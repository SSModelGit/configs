;; Setup Java things

;; use meghanada

(use-package meghanada :ensure
  :defer t
  :init
  (add-hook 'java-mode-hook
            (lambda ()
							(meghanada-mode t)
							(flycheck-mode +1)
              (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))

  :config
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq c-basic-offset 2)
  (setq meghanada-server-remote-debug t)
;;  (setq meghanada-javac-xlint t)
	(cond
	 ((eq system-type 'windows-nt)
		(setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
		(setq meghanada-maven-path "mvn.cmd"))
	 (t
		(setq meghanada-java-path "java")
		(setq meghanada-maven-path "mvn")))
	:commands
	(meghanada-mode))
