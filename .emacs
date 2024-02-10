;; General
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)
(fido-vertical-mode)
(savehist-mode)
(setq vc-follow-symlinks t)
(setq inhibit-startup-screen t)
(setq c-basic-offset 8)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Add melpa package archive
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Package maintance/installation
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq
  use-package-always-ensure t
  use-package-verbose t)

;; Run a shell command on buffer contents
(defun shell-command-on-buffer ()
  (interactive)
  (shell-command-on-region
	(point-min) (point-max)
	(read-shell-command "Shell command on buffer: ")))
(global-set-key (kbd "M-\"") 'shell-command-on-buffer)

;; Package: Add path to emacs shell
(use-package exec-path-from-shell
			 :config
			 (exec-path-from-shell-initialize))

;; Package: Ivy
;;(use-package ivy
;;			 :init
;;			 (ivy-mode 1)
;;			 (setq
;;			   ivy-height 10
;;			   ivy-use-virtual-buffers t
;;			   ivy-use-selectable-prompt -1))

;; Package: Gotta have counsel too
;;(use-package counsel
;;			 :after ivy
;;			 :init
;;			 (counsel-mode 1)
;;			 :bind (:map ivy-minibuffer-map))

;; Package: company-mode
(use-package company
			 :bind (("C-." . company-complete))
			 :custom
			 (company-idle-delay 0)
			 (company-dabbrev-downcase nil)
			 (company-show-numbers t)
			 (company-tooltip-limit 9)
			 :config
			 (global-company-mode))
(global-set-key (kbd "C-c C-c") #'company-other-backend)

;; Package: Flycheck
(use-package flycheck
			 :config
			 (add-hook 'prog-mode-hook 'flycheck-mode)
			 (add-hook 'after-init-hook #'global-flycheck-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(flycheck exec-path-from-shell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
