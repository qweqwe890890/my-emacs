(setq load-path (cons "~/.emacs.d/site-lisp/org-7.8.11/lisp" load-path))


(define-key global-map "\C-cc" 'org-remember)

(require 'org-remember)
;;(setq remember-annotation-functions '(org-remember-annotation))
;;(setq remember-handler-functions '(org-remember-handler))
;;(add-hook 'remember-mode-hook 'org-remember-apply-template)
(org-remember-insinuate)
(setq org-directory "~/GTD/")
(setq org-remember-templates '(
	("New" ?n "* %? %t \n %i\n %a" "~/.emacs.d/GTD/inbox.org" )
	("Task" ?t "** TODO %? %t\n %i\n %a" "~/.emacs.d/GTD/task.org" "Tasks")
	("Calendar" ?c "** TODO %?\n %i\n %a" "~/.emacs.d/GTD/task.org" "Tasks")
	("Book" ?c "** %? %t\n %i\n %a" "~/.emacs.d/GTD/book.org" "Book")
	("Learning" ?l "** TODO %? %T\n %i\n %a" "~/.emacs.d/GTD/learning.org" "Tasks")
	("Project" ?p "** %? %t\n %i\n %a" "~/.emacs.d/GTD/project.org" "Project")))
(setq org-default-notes-file (concat org-directory "/inbox.org"))


;;设置TODO关键字
(setq org-todo-keywords
(list "TODO(t)" "|" "CANCELED(c)" "DONE(d)"))
;; 将项目转接在各文件之间，方便清理和回顾。
(custom-set-variables
'(org-refile-targets
(quote
(("inbox.org" :level . 1)("canceled.org" :level . 1) ("finished.org":level . 1))
)))
;; 快速打开inbox
(defun inbox() (interactive) (find-file "~/.emacs.d/GTD/inbox.org"))
(global-set-key "\C-cz" 'inbox)
;; 快速启动 agenda-view
(define-key global-map "\C-ca" 'org-agenda-list)
(define-key global-map "\C-ct" 'org-todo-list)
(define-key global-map "\C-cm" 'org-tags-view)
;;显示他们的内容
(setq org-agenda-files
(list "~/.emacs.d/GTD/inbox.org"
"~/.emacs.d/GTD/task.org"
"~/.emacs.d/GTD/book.org"
"~/.emacs.d/GTD/learning.org"
"~/.emacs.d/GTD/project.org"))
;;开机自动显示日程表
;;(org-agenda-list t)
;;关闭其它窗口
;;(delete-other-windows)

;; org-capture
(define-key global-map [(f8)] 'org-capture)
(setq org-capture-templates
      `(("t" "Todo" entry (file+headline "~/GTD/todo.org" "Tasks")
         "* TODO %?\n  %i" :prepend t)

        ("n" "Note" entry (file+headline "~/GTD/notes.org" "Notes")
         "* %U %?\n\n  %i" :prepend t :empty-lines 1)

        ;; ...

        ("w" "Web Account" table-line
         (file+headline "~/.emacs.d/.account.org.gpg" "Web accounts")
         "| %? | | %a | %U |")

        ("c" "Card Account" table-line
         (file+headline "~/.emacs.d/.account.org.gpg" "Card accounts")
         "| %? | | | | %U |")))

(provide 'gtd-setting)
