;; install package
;; (require 'install)

;; config generated things removed
;; add melpa in package archives

(load "package")

(setq package-list '(ace-jump-mode company-auctex auctex company-jedi company-web elpy company find-file-in-project flycheck flymake-google-cpplint flymake-easy google-c-style highlight-indentation hlinum ivy jedi auto-complete jedi-core epc ctable concurrent magit git-commit ghub graphql magit-popup material-theme multiple-cursors pkg-info epl popup powerline py-autopep8 python-environment deferred pyvenv quickrun restart-emacs s smartparens dash treepy web-completion-data web-mode which-key with-editor async yasnippet helm-projectile ripgrep auto-virtualenv prettier-js add-node-modules-path emmet-mode))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Ido mode which is very good, file find etc. etc.
(setq-default ido-mode)
(ido-mode 1)

;; Smartparens mode for smart insertion of parenthesis
(require 'smartparens-config)
(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'c-mode-hook #'smartparens-mode)
(add-hook 'python-mode-hook #'smartparens-mode)

;; I don't want the splash screen, load scratch directly
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)
(setq org-startup-indented t)

;; disable scrollbar-mode, toolbar-mode, menu-bar-mode
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; (linum-mode 1)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'text-mode-hook 'linum-mode)

;; hl-line-mode background color
;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#3e4446")
;; (set-face-background 'hl-line "#555")
;; (set-face-foreground 'highlight nil)

;; hlinum-mode for highlighting linum-number in linum
(require 'hlinum)
(hlinum-activate)

;; set color for highlight for selected text
;; (set-face-attribute 'region nil :background "#777" :foreground "#ffffff")
;; (set-face-attribute 'default nil :font "Inconsolata" )
;; (set-frame-font "Inconsolata" nil t)


;; flyspell
(setq flyspell-issue-welcome-flag nil)
(setq-default ispell-program-name "/usr/bin/aspell")
(setq-default ispell-list-command "list")


;for elisp to generate list
(setq tab-stop-list (number-sequence 4 120 4))

(define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)

(setq-default indent-tabs-mode nil)

(setq linum-format "%4d")

(setq-default indent-tabs-mode nil)

; this gives you a tab of 2 spaces
;; (defun try-to-add-imenu()
;;   (condition-case nil (imenu-add-to-menubar "xmenu") (error nil)))
;; (add-hook 'font-lock-mode-hook 'try-to-add-imenu)


; this is for auto-complete
;(add-to-list 'load-path "~/.emacs.d")    ; This may not be appeared if you have already added.
;; (require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20160416.604/dict")
; do default config for auto-complete
;; (require 'auto-complete-config)
;; (ac-config-default)

;; Use Alternative to auto-complete : company
(require 'company)
(company-mode 1)
(add-hook 'after-init-hook 'global-company-mode)

; GENERAL SETTINGS

; debug mode on,
;(setq debug-on-error t)
;(setq debug-on-quit t)


; my person Informations
(setq user-full-name "Nabin Bhattarai"
      user-mail-address "nbn.bhattarai99@gmail.com")


;; ============ Multi Cursor Configuratin ============
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; ============ END Multi Cursor Configuration ============

; using utf-8 as prefered encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; Turn on syntax highlighting for all buffer
(global-font-lock-mode t)

;; Line number mode
(setq line-number-display-limit-width 10000)

;; echo commands
(setq echo-keystrokes 0.4)


;; Don't warn me about large files unless they're at least 25MB
(setq large-file-warning-threshold (* 25 1024 1024))

;; Turn off unrequierd modes
;; menu-bar-mode : show menus at top of emacs
(when (functionp 'menu-bar-mode)
  (menu-bar-mode -1))

;; Line number/colums show modes
(line-number-mode 1)
(column-number-mode 1)

;; change yes/no to y/n key when asked
(defalias 'yes-or-no-p 'y-or-n-p)

;; Hide mouse when typing
(setq make-pointer-invisible t)

;; Require a newline at the end of files
(setq require-final-newline t)

;; Make search(and replace) using regex by default which is nice
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backword-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)

;; Make sure auto automatically rescan for imenu changes
(set-default 'imenu-rescan t)

;; smooth scrolling when I hit C-n
;; (use package smooth-scrolling
;;     :defer t
;;     :config
;;     (setq smooth-scroll-margin 4))

; expand-region : great for selecting the inside of Elasticsearch queries
;; (use package expand-region
;;     :defer t
;;     :bind (("C-c e" . er/expand-region)
;;            ("C-M-@" . er/contact-region)))


;;origami
;;oragami is a folding mode that supports a pretty good subset of language
;; (use package origami
;;     :bind (("C-c TAB" . origami-recursively-toggle-node)
;;            ("C-\\" . origami-recursively-toggle-node)
;;            ("M-\\" . origami-close-all-nodes)
;;            ("M-+" . origami-open-all-nodes))
;;     :init
;;     (global-origami-mode))

;; (add-to-list 'load-path (expand-file-path-name "$HOME/.emacs.d/elpa/origami-20160710.958"))
;; (require 'origami)
;; yafolding is alternative to origami

;; (require 'yafolding)
;; (yafolding-mode 1)

;; (require 'yafolding)
;; ;; (define-key yafolding-mode-map (kbd "C--tab") 'yafolding-toggle-all)
;; (define-key yafolding-mode-map (kbd "<C-S-return>") nil)
;; (define-key yafolding-mode-map (kbd "<C-M-return>") nil)
;; (define-key yafolding-mode-map (kbd "<C-return>") nil)
;; (define-key yafolding-mode-map (kbd "C-c <C-M-return>") 'yafolding-toggle-all)
;; (define-key yafolding-mode-map (kbd "C-c <C-S-return>") 'yafolding-hide-parent-element)
;; (define-key yafolding-mode-map (kbd "C-c <C-return>") 'yafolding-toggle-element)

; yasnippet autostart
(require 'yasnippet)
(yas-global-mode 1)

; let's define a function which initializes auto-complete-c-heaers
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-sources-c-headers)
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-pc-linux-gnu/6.1.1/include")
)

; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; key-binding for iedit
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; stark flymake-google-cpplint-load
;; let's define a function for flymake initialization

(defun my:flymake-google-init()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/bin/cpplint"))
  (flymake-google-cpplint-load)
)
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

;; start google-c-style with emacs
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; tun on semantic
(semantic-mode 1)

(require 'company-tabnine)
;; let's define a function which adds semantic as a suggestion backed to auto
; complete and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; set indentation to 4 spaces
(setq-default c-basic-offset 4)

;; turn on ede mode
(global-ede-mode 1)

(global-semantic-idle-scheduler-mode 1)

;; python IDE
(package-initialize)
(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; (add-hook 'elpy-mode-hook 'flycheck-mode)

;; fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; for autopep (formating python code automatically)
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; (add-to-list 'company-backends 'company-jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; auto virtualenv
(require 'auto-virtualenv)
(add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)

;; fixing another key binding bug in iedit modes
(define-key global-map (kbd "C-c o") 'iedit-mode)

;; fix C-S-enter for heading enter in ORG mode
(require 'org)
(define-key org-mode-map (kbd "M-S-RET") 'org-insert-todo-heading)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)


;; =============  This is for Predictive mode ============
;; (add-to-list 'load-path "$HOME/.emacs.d/predictive")
;; (add-to-list 'load-path "$HOME/.emacs.d/predictive/misc")
;; (add-to-list 'load-path "$HOME/.emacs.d/predictive/html")
;; (add-to-list 'load-path "$HOME/.emacs.d/predictive/latex")
;; (add-to-list 'load-path "$HOME/.emacs.d/predictive/texinfo")

;; (require 'predictive)

;; ============= End for predictive mode configurations =======


;; ============== Configurations for Latex mode =============
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(require 'company-auctex)
(company-auctex-init)
;; ========== End configurations for Latex mode ============

;; (require 'evil)
;; (evil-mode 1)

;; keep secrets with emacs
(setq epg-gpg-program "gpg2")

;; for material theme
;; (load-theme 'zenburn t)
(load-theme 'dracula t)

;; to decrease font of emacs
(set-face-attribute 'default (selected-frame) :height 130)

;; ;; switch windows with ace-window, it's cool
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq aw-background nil)
(defvar aw-dispatch-alist
'((?x aw-delete-window " Ace - Delete Window")
    (?m aw-swap-window " Ace - Swap Window")
    (?n aw-flip-window)
    (?v aw-split-window-vert " Ace - Split Vert Window")
    (?b aw-split-window-horz " Ace - Split Horz Window")
    (?i delete-other-windows " Ace - Maximize Window")
    (?o delete-other-windows))
"List of actions for `aw-dispatch-default'.")

;; for org-reveal
;; (require 'ox-reveal)
;; (setq org-reveal-root "file:/$HOME/.emacs.d/reveal.js/")

;; for powerline
(require 'powerline)
(powerline-default-theme)
;; which key for keybindging help
(require 'which-key)
(which-key-mode)

;; web mode
(add-hook 'web-mode-hook
          (lambda ()
            (rainbow-mode)
            (setq web-mode-markup-indent-offset 2)))

;; add node path on web mode
(add-hook 'web-mode-hook
          (lambda ()
            (add-to-list 'exec-path "/home/shadowswalker/.nvm/versions/node/v10.13.0/bin/")))

;; projectile mode
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; ace jump
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; for jsx (react)
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(defun web-mode-init-hook ()
  "Hooks for Web mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 4))
  
(add-hook 'web-mode-hook  'web-mode-init-hook)

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))

;; enable emmet with web-mode
(add-hook 'web-mode-hook  'emmet-mode)

(require 'prettier-js)
(add-hook 'web-mode-hook 'prettier-js-mode)

(setq prettier-js-args '(
                         "--trailing-comma" "all"
                         "--bracket-spacing" "false"
                         ))

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))
(put 'downcase-region 'disabled nil)

(require 'org-journal)
(setq org-journal-dir '/home/shadowswalker/Documents/org/journals)

;; set line-wrap
(global-visual-line-mode t)

;; multi-term for terminal
(require 'multi-term)
(global-set-key (kbd "C-c t") 'multi-term)

;; skewer mode
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode typescript-mode zenburn-theme writeroom-mode writegood-mode which-key web-mode-edit-element ujelly-theme smartparens ripgrep restart-emacs quickrun pythonic py-autopep8 prettier-js powerline org-journal multiple-cursors multi-term material-theme markdown-preview-mode magit jedi hlinum helm-projectile helm-ag google-c-style ghub flyspell-correct-ivy flymake-google-cpplint flycheck emmet-mode elpy ein dracula-theme doom-themes company-web company-tabnine company-jedi company-auctex clues-theme blackboard-theme auto-virtualenv add-node-modules-path ace-jump-mode abyss-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
