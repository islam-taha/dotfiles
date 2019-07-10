;;; init-packages --- Summary
;;; Commentary:
;;; Code:
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
(global-hl-line-mode 1)


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
(setq-default winum-keymap
              (let ((map (make-sparse-keymap)))
                (define-key map (kbd "C-`") 'winum-select-window-by-number)
                (define-key map (kbd "C-²") 'winum-select-window-by-number)
                (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
                (define-key map (kbd "M-1") 'winum-select-window-1)
                (define-key map (kbd "M-2") 'winum-select-window-2)
                (define-key map (kbd "M-3") 'winum-select-window-3)
                (define-key map (kbd "M-4") 'winum-select-window-4)
                (define-key map (kbd "M-5") 'winum-select-window-5)
                (define-key map (kbd "M-6") 'winum-select-window-6)
                (define-key map (kbd "M-7") 'winum-select-window-7)
                (define-key map (kbd "M-8") 'winum-select-window-8)
                map))

(require 'fancy-battery)
(require 'winum)
(require 'spaceline-config)
(spaceline-helm-mode 1)
(spaceline-emacs-theme)

(setq-default
 powerline-height 18
 powerline-default-separator 'wave
 spaceline-flycheck-bullet "❖ %s"
 spaceline-separator-dir-left '(right . right)
 spaceline-separator-dir-right '(left . left))

(add-hook 'after-init-hook #'fancy-battery-mode)
(add-hook 'after-init-hook #'winum-mode)

;; use system shell path
;;(when (memq window-system '(mac ns x))
  ;;(exec-path-from-shell-initialize))

(setenv "PATH" (concat (getenv "PATH") ":/Users/tensor/.nvm/versions/node/v6.10.2/bin"))
(setq exec-path (append exec-path '("/Users/tensor/.nvm/versions/node/v6.10.2/bin")))

;;; Ruby configs
;; rspec
(require 'rspec-mode)
(setq rspec-use-bundler-when-possible t)
(setq rspec-use-spring-when-possible nil)

;; rubocop init
(require 'rubocop)
(add-hook 'ruby-mode-hook #'rubocop-mode)
(add-hook 'ruby-mode-hook 'robe-mode)

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
(require 'pry)
(require 'inf-ruby)
(setenv "PAGER" (executable-find "cat"))

;; smart parenthesis
(require 'smartparens-config)
(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'ruby-mode-hook #'smartparens-mode)
(add-hook 'js2-mode-hook #'smartparens-mode)
(add-hook 'web-mode-hook #'smartparens-mode)

;;; js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.sjs$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6$" . js2-mode))
(setq js2-allow-rhino-new-expr-initializer nil)
(setq js2-enter-indents-newline t)
(setq js2-global-externs '("module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
(setq js2-idle-timer-delay 0.1)
(setq js2-indent-on-enter-key nil)
(setq js2-mirror-mode nil)
(setq js2-strict-inconsistent-return-warning nil)
(setq js2-auto-indent-p t)
(setq js2-include-rhino-externs nil)
(setq js2-include-gears-externs nil)
(setq js2-concat-multiline-strings 'eol)
(setq js2-rebind-eol-bol-keys nil)
(setq js2-mode-show-parse-errors t)
(setq js2-mode-show-strict-warnings nil)

;;; web mode
;; Code
(require 'web-mode)
(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-pairing t)
(setq-default web-mode-tag-auto-close-style t)
(setq-default web-mode-enable-current-element-highlight t)

;; Hooks
(add-hook 'html-mode-hook 'web-mode)
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode, Adjust indent."
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  "Adjust jsx highlighting."
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(add-hook 'web-mode-hook
          (lambda ()
            (web-mode-set-content-type "jsx")
            (message "now set to: %s" web-mode-content-type)))

(add-hook 'web-mode-hook  'my-web-mode-hook)
;;; end web mode

;;; yasnippet
(require 'yasnippet)
(require 'react-snippets)
(yas-global-mode 1)


;;; flycheck
(require 'flycheck)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))
(flycheck-add-mode 'javascript-eslint 'web-mode)
(setq-default flycheck-temp-prefix ".flycheck")
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

;; use local node modules
(defun my/use-eslint-from-node-modules ()
  "Use local node modules."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

(defun myJSXHook ()
  "My Hook for JSX Files."
  (interactive)
  (web-mode)
  (web-mode-set-content-type "jsx")
  (flycheck-select-checker 'javascript-eslint)
  (flycheck-mode)
  (tern-mode t))

(add-to-list 'magic-mode-alist '("import " . myJSXHook) )

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
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'projectile-dired)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
(setq projectile-require-project-root t)
(setq projectile-indexing-method 'alien)
(setq helm-recentf-fuzzy-match t)
(setq helm-buffers-fuzzy-match t)

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
(global-set-key (kbd "C-c r") 'helm-recentf)

;;; end helm

;;; tern mode
;; (require 'tern)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))

;;; Company configs:
(require 'company)

(setq global-company-mode +1)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-quickhelp-mode 1)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-auto-complete 'company-explicit-action-p)
(setq company-auto-select-first-candidate nil)
(setq company-selection-wrap-around t)

(setq-default company-dabbrev-downcase nil)
(setq-default company-quickhelp-delay 1)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "<tab>") 'company-complete)
  (define-key company-active-map (kbd "TAB") 'company-complete))


;; emacs-ycmd
(require 'ycmd)
(require 'company-ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)
(set-variable 'ycmd-server-command '("python" "-u" "/Users/tensor/ycmd/ycmd"))

(company-ycmd-setup)

(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  "Add yassnippet BACKEND."
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

;; set default `company-backends'
(dolist (hook '(js-mode-hook
                js2-mode-hook
                js3-mode-hook
                web-mode-hook
                inferior-js-mode-hook))
  (add-hook hook
            (lambda ()
              (tern-mode t)
              (add-to-list (make-local-variable 'company-backends) 'company-tern))))

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
(setq neo-window-fixed-size nil)
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
;;(require 'cc-mode)

(cmake-ide-setup)

(setq cmake-ide-build-dir "bin")

(font-lock-add-keywords 'c++-mode
                        '(("\\(\\w+\\)\\s-*\("
                           (1 font-lock-builtin-face))) t)
(font-lock-add-keywords 'c-mode
                        '(("\\(\\w+\\)\\s-*\("
                           (1 font-lock-builtin-face))) t)


;; clang format
(require 'clang-format)
(setq-default clang-format-style-option "chromium")
;; keys mapping:
(global-set-key (kbd "C-c C-i") 'clang-format-region)
(global-set-key (kbd "C-c C-j") 'clang-format-buffer)

;; iedit
(require 'iedit)
(setq iedit-unmatched-lines-invisible-default t)

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
  (end-of-line)
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

(defun my-kill-thing-at-point (thing)
  "Kill the `thing-at-point' for the specified kind of THING."
  (let ((bounds (bounds-of-thing-at-point thing)))
    (if bounds
        (kill-region (car bounds) (cdr bounds))
      (error "No %s at point" thing))))

(defun my-kill-word-at-point ()
  "Kill the word at point."
  (interactive)
  (my-kill-thing-at-point 'word))

(global-set-key (kbd "C-c d w") 'my-kill-word-at-point)
(global-set-key (kbd "M-t") 'select-current-line)
(global-set-key (kbd "M-r") 'run-compile-current-file)
(global-set-key (kbd "M-b") 'compile-current-file)
(global-set-key (kbd "M-/") 'comment-current-line)
;;; init.el ends here
