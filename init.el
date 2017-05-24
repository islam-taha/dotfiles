;;; init-packages --- Summary
;;; Commentary:
;;; Code
(package-initialize)
(set 'ad-redefinition-action 'accept)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))

;; no tabs
(setq-default indent-tabs-mode nil)
(setq-default js-indent-level 2)
(setq-default global-indent-level 2)
(setq-default default-tab-width 2)

;; system encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq locale-coding-system 'utf-8)
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq-default default-buffer-file-coding-system 'utf-8))


;; some ui configuration
(setq-default truncate-lines t)
(setq-default frame-maximized t)
(setq ns-use-srgb-colorspace nil)
(setq debug-on-error t)
(setq scroll-bar-mode nil)
(setq visible-bell nil)
(setq ring-bell-function (lambda () (message "*beep*")))
(set-frame-font "Source Code Pro for Powerline 12")
(emacs-lisp-mode)
(show-paren-mode t)
(tool-bar-mode -1)
(global-linum-mode t)

;; auto close pairs
(electric-pair-mode)

;; delete trailing whitespaces on saving
(add-to-list 'write-file-functions 'delete-trailing-whitespace)

;; better scrolling
(setq scroll-margin 0
      scroll-conservatively 1000
      scroll-preserve-screen-position t)

;; separate custom code
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; no backups... please!
(setq auto-save-default nil)
(setq make-backup-files nil)
(desktop-save-mode nil)

;; set keys for Apple keyboard, for emacs in OS X
(setq-default mac-option-key-is-meta nil)
(setq-default mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq mac-control-modifier 'control)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Show help at current point
(setq help-at-pt-display-when-idle t)
(setq-default help-at-pt-timer-delay 0.5)
(help-at-pt-set-timer)

;; spaceline configs
(require 'spaceline-all-the-icons)
(spaceline-all-the-icons-theme)
(spaceline-all-the-icons--setup-anzu)
(spaceline-all-the-icons--setup-git-ahead)
(spaceline-all-the-icons--setup-neotree)

;;; Ruby configs
;; rubocop init
(require 'rubocop)
(add-hook 'ruby-mode-hook #'rubocop-mode)
(add-hook 'ruby-mode-hook 'robe-mode)

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
(require 'pry)
(require 'inf-ruby)
(setenv "PAGER" (executable-find "cat"))

;;; web mode
;; Code
(require 'web-mode)
(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-pairing t)
(setq-default web-mode-tag-auto-close-style t)
(setq-default web-mode-enable-current-element-highlight t)

;; Hooks
(add-hook 'html-mode-hook 'web-mode)
;;; end web mode

;;; yasnippet
(require 'yasnippet)
(require 'react-snippets)
(yas-global-mode 1)

;;; flycheck
(require 'flycheck)
(global-flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;;; helm stuff
;; Code:
(require 'helm-fuzzier)
(require 'helm-flx)
(require 'projectile)
(require 'helm-projectile)
(require 'helm-swoop)

(helm-fuzzier-mode 1)
(helm-flx-mode +1)
(projectile-mode)
(helm-projectile-on)

(setq-default helm-M-x-fuzzy-match 1)
(setq-default helm-mode-fuzzy-match 1)
(setq-default helm-apropos-fuzzy-match 1)
(setq-default helm-buffers-fuzzy-matching 1)
(setq-default helm-autoresize-mode t)
(setq-default projectile-remember-window-configs t)
(setq-default helm-autoresize-max-height 40
              helm-autoresize-min-height 20
              helm-split-window-in-side-p t)
(setq helm-flx-for-helm-find-files t
      helm-flx-for-helm-locate t)

(setq helm-projectile-fuzzy-match nil)
(setq projectile-enable-caching nil)
(setq projectile-switch-project-action 'projectile-dired)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
(setq projectile-require-project-root t)

(setq helm-swoop-split-with-multiple-windows nil)
(setq helm-swoop-split-direction 'split-window-horizontally)
(setq helm-swoop-use-fuzzy-match t)

;; MAPPINGS:
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-p") 'helm-projectile-find-file-in-known-projects)
(global-set-key (kbd "C-c C-p") 'projectile-find-file-in-known-projects)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-x C-k") 'helm-show-kill-ring)
(global-set-key (kbd "C-x p i") 'helm-package)
(global-set-key (kbd "C-c f") 'helm-swoop)
(global-set-key (kbd "C-c e f") 'helm-swoop--edit)

;;; end helm

;;; Company configs:
(require 'company)
(setq global-company-mode t)
(setq company-quickhelp-mode 1)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)

(setq-default company-dabbrev-downcase nil)
(setq-default company-quickhelp-delay 1)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "<tab>") #'company-complete))

(with-eval-after-load 'company
  (add-hook 'company-mode-hook (lambda ()
                                 (add-to-list 'company-backends 'company-capf)))
  (company-flx-mode +1))

(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-yasnippet t)
;; emacs-ycmd
(require 'ycmd)
(require 'company-ycmd)

;;; Code:
(add-hook 'after-init-hook #'global-ycmd-mode)
(set-variable 'ycmd-server-command '("python" "-u" "/Users/tensor/ycmd/ycmd"))
(set-variable 'ycmd-startup-timeout 1000)

;;; Code:
(company-ycmd-setup)

;; auto compile
(require 'auto-compile)
(auto-compile-mode)

;; anzu
(require 'anzu)
(anzu-mode 1)

;;; MAPPINGS:
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; git gutter
(require 'git-gutter+)
(global-git-gutter+-mode 1)

;; neotree
(require 'neotree)
(global-set-key (kbd "C-x C-;") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; shackle
(require 'shackle)
(shackle-mode 1)
(setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :size 0.4)
                      ("*git-gutter:diff"    :regexp t :align t :size 0.4)))

;; multiple cursors
(require 'multiple-cursors)

;; MAPPINGS:
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-,") 'mc/mark-all-like-this)

;; multi terminals
(require 'multi-term)
(global-set-key (kbd "C-x C-m") 'multi-term)
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)
            (term-set-escape-char ?\C-x)
            (define-key term-raw-map "\M-y" 'yank-pop)
            (define-key term-raw-map "\M-w" 'kill-ring-save)
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))

(defcustom term-unbind-key-list
  '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>")
  "The key list that will need to be unbind."
  :type 'list
  :group 'multi-term)

(defcustom term-bind-key-alist
  '(("C-c" . term-interrupt-subjob)
    ("C-p" . previous-line)
    ("C-n" . next-line)
    ("C-s" . isearch-forward)
    ("C-r" . isearch-backward)
    ("C-m" . term-send-raw)
    ("M-f" . term-send-forward-word)
    ("M-b" . term-send-backward-word)
    ("M-o" . term-send-backspace)
    ("M-p" . term-send-up)
    ("M-n" . term-send-down)
    ("M-M" . term-send-forward-kill-word)
    ("M-N" . term-send-backward-kill-word)
    ("M-r" . term-send-reverse-search-history)
    ("M-," . term-send-input)
    ("M-." . comint-dynamic-complete))
  "The key alist that will need to be bind."
  :type 'alist
  :group 'multi-term)

;; c/c++ configs + irony
(require 'cc-mode)
(require 'company-irony-c-headers)

(cmake-ide-setup)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  "Irony hook."
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(setq company-backends (delete 'company-semantic company-backends))
(setq cmake-ide-build-dir "bin")

(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

(font-lock-add-keywords 'c++-mode
                        '(("\\(\\w+\\)\\s-*\("
                           (1 font-lock-builtin-face))) t)
(font-lock-add-keywords 'c-mode
                        '(("\\(\\w+\\)\\s-*\("
                           (1 font-lock-builtin-face))) t)

(define-key c++-mode-map (kbd "C-c c") 'company-irony)

;; clang format
(require 'clang-format)
(setq-default clang-format-style-option "chromium")
;; keys mapping:
(global-set-key (kbd "C-c C-i") 'clang-format-region)
(global-set-key (kbd "C-c C-j") 'clang-format-buffer)

;; iedit
(require 'iedit)
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;;; MAPPINGS: to built-in functions
(global-set-key (kbd "M-/") 'comment-region)
(global-set-key (kbd "M-S-/") 'comment-region)

(global-set-key (kbd "C-v") 'next-buffer)
(global-set-key (kbd "M-v") 'previous-buffer)
(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "C-x C-n") 'linum-mode)

(global-set-key [M-up] (lambda () (interactive) (scroll-up 1)))
(global-set-key [M-down] (lambda () (interactive) (scroll-down 1)))

;;; custom functions
(defun select-current-line ()
  "Select the current line."
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

(defun run-compile-current-file ()
  "Compile and run current .cpp file."
  (interactive)
  (shell-command
   (format "osascript -e 'tell application \"Terminal\" to activate' -e 'tell application \"Terminal\" to do script \"cd %s;lkj\" in front window'"
           (file-name-directory buffer-file-name))))


(defun compile-current-file ()
  "Compile the current .cpp file."
  (interactive)
  (shell-command "clang++ -std=c++11 -DDEBUG -O2 *.cpp"))

(defun comment-current-line ()
  "Comment the current line."
  (interactive)
  (select-current-line)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(defun update-packages-list ()
  "Update installed packages in my file."
  (with-temp-file "/Users/tensor/.dotfiles/packages" (insert (format "%S" package-activated-list))))

(global-set-key (kbd "M-t") 'select-current-line)
(global-set-key (kbd "M-r") 'run-compile-current-file)
(global-set-key (kbd "M-b") 'compile-current-file)
(global-set-key (kbd "M-/") 'comment-current-line)
;;; init.el ends here
