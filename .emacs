(set 'ad-redefinition-action 'accept)
(setq package-enable-at-startup nil)
(package-initialize)

(emacs-lisp-mode)
(setq-default indent-tabs-mode nil)
(setq ns-use-srgb-colorspace nil)
(setq scroll-bar-mode nil)
(setq global-tab-width 2)
(setq global-indent-level 2)
(setq auto-save-default nil)
(setq-default truncate-lines t)
(global-linum-mode t)
(tool-bar-mode -1)
(setq make-backup-files nil)
(show-paren-mode t)
(setq-default frame-maximized t)

(set-default-font "Monaco 12")

;; set keys for Apple keyboard, for emacs in OS X
(setq mac-command-modifier 'meta) ; make cmd key do Meta
(setq mac-option-modifier 'super) ; make opt key do Super
(setq mac-control-modifier 'control) ; make Control key do Control

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(setq scroll-margin 0
      scroll-conservatively 1000
      scroll-preserve-screen-position t)

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.5)
(help-at-pt-set-timer)

(require 'cc-mode)

(add-hook 'term-mode-hook
          (lambda ()
            ;; C-x is the prefix command, rather than C-c
            (term-set-escape-char ?\C-x)
            (define-key term-raw-map "\M-y" 'yank-pop)
            (define-key term-raw-map "\M-w" 'kill-ring-save)
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))

(require 'rubocop)
(add-hook 'ruby-mode-hook #'rubocop-mode)

;; (add-hook 'js-mode-hook 'angular-mode)  ;
(add-hook 'html-mode-hook 'web-mode)
(setq web-mode-enable-current-element-highlight t)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq helm-autoresize-mode t)
(display-time)

(require 'auto-compile)
(auto-compile-mode)

(require 'anzu)
(anzu-mode 1)

(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

(require 'git-gutter)
(global-git-gutter-mode 1)

(require 'neotree)
(global-set-key (kbd "C-x C-;") 'neotree-toggle)

(set-face-background 'git-gutter:modified "purple")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-c C-f") 'git-gutter:popup-diff)

(setq helm-autoresize-max-height 40
      helm-autoresize-min-height 20
      helm-split-window-in-side-p t)
(global-set-key (kbd "M-x") 'helm-M-x)

(require 'shackle)
(shackle-mode 1)
(setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :size 0.4)
                      ("*git-gutter:diff"    :regexp t :align t :size 0.4)))

(require 'helm-fuzzier)
(helm-fuzzier-mode 1)
(setq helm-M-x-fuzzy-match 1)
(setq helm-mode-fuzzy-match 1)
(setq helm-apropos-fuzzy-match 1)
(setq helm-buffers-fuzzy-matching 1)

(require 'multiple-cursors)
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-,") 'mc/mark-all-like-this)

(global-set-key (kbd "C-x b") 'helm-buffers-list)

(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-enable-caching nil)
(setq projectile-switch-project-action 'projectile-dired)
(setq projectile-remember-window-configs t )
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
(setq projectile-require-project-root t)
(helm-projectile-on)
(setq helm-projectile-fuzzy-match nil)

(global-set-key (kbd "M-p") 'helm-projectile-find-file-in-known-projects)

(require 'web-mode)
(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-tag-auto-close-style t)


(desktop-save-mode nil)

(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

(global-set-key (kbd "M-t") 'select-current-line)
(global-set-key (kbd "M-/") 'comment-region)
(global-set-key (kbd "M-S-/") 'comment-region)

(defun run-compile-current-file ()
  "Compile and run current .cpp file"
  (interactive)
  (shell-command
   (format "osascript -e 'tell application \"Terminal\" to activate' -e 'tell application \"Terminal\" to do script \"cd %s;lkj\" in front window'"
           (file-name-directory buffer-file-name))))


(defun compile-current-file ()
  "Compile the current .cpp file"
  (interactive)
  (shell-command "clang++ -std=c++11 -DDEBUG -O2 *.cpp"))

(defun run-cmake-target ()
  (interactive)
  (shell-command ""))

(defun comment-current-line ()
  "Comment the current line"
  (interactive)
  (select-current-line)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "M-r") 'run-compile-current-file)
(global-set-key (kbd "M-b") 'compile-current-file)
(global-set-key (kbd "M-/") 'comment-current-line)
(global-set-key (kbd "C-v") 'next-buffer)
(global-set-key (kbd "M-v") 'previous-buffer)

(setq debug-on-error t)

(require 'clang-format)
(global-set-key (kbd "C-c C-i") 'clang-format-region)
(global-set-key (kbd "C-c C-j") 'clang-format-buffer)

(setq-default clang-format-style-option "chromium")

(setq visible-bell nil)
(setq ring-bell-function (lambda () (message "*beep*")))
(require 'company)
(require 'react-snippets)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))

(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

(global-flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(global-company-mode t)
(setq company-idle-delay -1)

(require 'yasnippet)
(yas-global-mode 1)

(add-to-list 'company-backends 'company-tern)
(setq company-minimum-prefix-length 1)
(add-hook 'ruby-mode-hook 'robe-mode)
(push 'company-robe company-backends)
(setq company-dabbrev-downcase nil)

(company-quickhelp-mode 1)
(setq company-quickhelp-delay 1)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "<tab>") #'company-complete))



(with-eval-after-load 'company
  (add-hook 'company-mode-hook (lambda ()
                                 (add-to-list 'company-backends 'company-capf)))
  (company-flx-mode +1))

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
(require 'pry)

(require 'inf-ruby)
(setenv "PAGER" (executable-find "cat"))

(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


(require 'spaceline-config)
(spaceline-spacemacs-theme)

(set-face-attribute 'mode-line nil :box nil)
(setq powerline-default-separator 'utf-8)

(define-key global-map (kbd "C-c ;") 'iedit-mode)
(define-key c++-mode-map (kbd "C-c c") 'company-irony)

(global-set-key (kbd "M-_") 'windresize)

(global-set-key [M-up] (lambda () (interactive) (scroll-up 1)))
(global-set-key [M-down] (lambda () (interactive) (scroll-down 1)))

(global-set-key (kbd "C-x C-n") 'linum-mode)

(cmake-ide-setup)
(setq cmake-ide-build-dir "bin")

(setq locale-coding-system 'utf-8)

(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

(setq display-battery-mode t)

(setq display-time-24hr-format t)

(setq display-time-default-load-average nil)

(font-lock-add-keywords 'c++-mode
                        '(("\\(\\w+\\)\\s-*\("
                           (1 font-lock-builtin-face))) t)
(font-lock-add-keywords 'c-mode
                        '(("\\(\\w+\\)\\s-*\("
                           (1 font-lock-builtin-face))) t)




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
