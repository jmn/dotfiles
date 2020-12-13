;; Better links in org-mode exports
;; https://tecosaur.github.io/emacs-config/config.html#nicer-generated-heading

(use-package dash-functional
  :config
  (defvar org-reference-contraction-max-words 3
    "Maximum number of words in a reference reference.")
  (defvar org-reference-contraction-max-length 35
    "Maximum length of resulting reference reference, including joining characters.")
  (defvar org-reference-contraction-stripped-words
    '("the" "on" "in" "off" "a" "for" "by" "of" "and" "is" "to")
    "Superfluous words to be removed from a reference.")
  (defvar org-reference-contraction-joining-char "-"
    "Character used to join words in the reference reference.")

  (defun org-reference-contraction-truncate-words (words)
    "Using `org-reference-contraction-max-length' as the total character 'budget' for the WORDS
and truncate individual words to conform to this budget.

To arrive at a budget that accounts for words undershooting their requisite average length,
the number of charachters in the budget freed by short words is distributed among the words
exceeding the average length.  This adjusts the per-word budget to be the maximum feasable for
this particular situation, rather than the universal maximum average.

This budget-adjusted per-word maximum length is given by the mathematical expression below:

max length = \\floor{ \\frac{total length - chars for seperators - \\sum_{word \\leq average length} length(word) }{num(words) > average length} }"
    ;; trucate each word to a max word length determined by
    ;;
    (let* ((total-length-budget (- org-reference-contraction-max-length  ; how many non-separator chars we can use
				   (1- (length words))))
	   (word-length-budget (/ total-length-budget                      ; max length of each word to keep within budget
				  org-reference-contraction-max-words))
	   (num-overlong (-count (lambda (word)                            ; how many words exceed that budget
				   (> (length word) word-length-budget))
				 words))
	   (total-short-length (-sum (mapcar (lambda (word)                ; total length of words under that budget
					       (if (<= (length word) word-length-budget)
						   (length word) 0))
					     words)))
	   (max-length (/ (- total-length-budget total-short-length)       ; max(max-length) that we can have to fit within the budget
			  num-overlong)))
      (mapcar (lambda (word)
		(if (<= (length word) max-length)
		    word
		  (substring word 0 max-length)))
	      words)))

  (defun org-reference-contraction (reference-string)
    "Give a contracted form of REFERENCE-STRING that is only contains alphanumeric characters.
Strips 'joining' words present in `org-reference-contraction-stripped-words',
and then limits the result to the first `org-reference-contraction-max-words' words.
If the total length is > `org-reference-contraction-max-length' then individual words are
truncated to fit within the limit using `org-reference-contraction-truncate-words'."
    (let ((reference-words
	   (-filter (lambda (word)
		      (not (member word org-reference-contraction-stripped-words)))
		    (split-string
		     (->> reference-string
			  downcase
			  (replace-regexp-in-string "\\[\\[[^]]+\\]\\[\\([^]]+\\)\\]\\]" "\\1") ; get description from org-link
			  (replace-regexp-in-string "[-/ ]+" " ") ; replace seperator-type chars with space
			  (replace-regexp-in-string "[^a-z0-9 ]" "") ; strip chars which need %-encoding in a uri
			  ) " "))))
      (when (> (length reference-words)
	       org-reference-contraction-max-words)
	(setq reference-words
	      (cl-subseq reference-words 0 org-reference-contraction-max-words)))

      (when (> (apply #'+ (1- (length reference-words))
		      (mapcar #'length reference-words))
	       org-reference-contraction-max-length)
	(setq reference-words (org-reference-contraction-truncate-words reference-words)))

      (mapconcat 'identity reference-words org-reference-contraction-joining-char)))


  (define-minor-mode unpackaged/org-export-html-with-useful-ids-mode
    "Attempt to export Org as HTML with useful link IDs.
Instead of random IDs like \"#orga1b2c3\", use heading titles,
made unique when necessary."
    :global t
    (if unpackaged/org-export-html-with-useful-ids-mode
	(advice-add #'org-export-get-reference :override #'unpackaged/org-export-get-reference)
      (advice-remove #'org-export-get-reference #'unpackaged/org-export-get-reference)))

  (defun unpackaged/org-export-get-reference (datum info)
    "Like `org-export-get-reference', except uses heading titles instead of random numbers."
    (let ((cache (plist-get info :internal-references)))
      (or (car (rassq datum cache))
	  (let* ((crossrefs (plist-get info :crossrefs))
		 (cells (org-export-search-cells datum))
		 ;; Preserve any pre-existing association between
		 ;; a search cell and a reference, i.e., when some
		 ;; previously published document referenced a location
		 ;; within current file (see
		 ;; `org-publish-resolve-external-link').
		 ;;
		 ;; However, there is no guarantee that search cells are
		 ;; unique, e.g., there might be duplicate custom ID or
		 ;; two headings with the same title in the file.
		 ;;
		 ;; As a consequence, before re-using any reference to
		 ;; an element or object, we check that it doesn't refer
		 ;; to a previous element or object.
		 (new (or (cl-some
			   (lambda (cell)
			     (let ((stored (cdr (assoc cell crossrefs))))
			       (when stored
				 (let ((old (org-export-format-reference stored)))
				   (and (not (assoc old cache)) stored)))))
			   cells)
			  (when (org-element-property :raw-value datum)
			    ;; Heading with a title
			    (unpackaged/org-export-new-named-reference datum cache))
			  (when (member (car datum) '(src-block table example fixed-width property-drawer))
			    ;; Nameable elements
			    (unpackaged/org-export-new-named-reference datum cache))
			  ;; NOTE: This probably breaks some Org Export
			  ;; feature, but if it does what I need, fine.
			  (org-export-format-reference
			   (org-export-new-reference cache))))
		 (reference-string new))
	    ;; Cache contains both data already associated to
	    ;; a reference and in-use internal references, so as to make
	    ;; unique references.
	    (dolist (cell cells) (push (cons cell new) cache))
	    ;; Retain a direct association between reference string and
	    ;; DATUM since (1) not every object or element can be given
	    ;; a search cell (2) it permits quick lookup.
	    (push (cons reference-string datum) cache)
	    (plist-put info :internal-references cache)
	    reference-string))))

  (defun unpackaged/org-export-new-named-reference (datum cache)
    "Return new reference for DATUM that is unique in CACHE."
    (cl-macrolet ((inc-suffixf (place)
			       `(progn
				  (string-match (rx bos
						    (minimal-match (group (1+ anything)))
						    (optional "--" (group (1+ digit)))
						    eos)
						,place)
				  ;; HACK: `s1' instead of a gensym.
				  (-let* (((s1 suffix) (list (match-string 1 ,place)
							     (match-string 2 ,place)))
					  (suffix (if suffix
						      (string-to-number suffix)
						    0)))
				    (setf ,place (format "%s--%s" s1 (cl-incf suffix)))))))
      (let* ((headline-p (eq (car datum) 'headline))
	     (title (if headline-p
			(org-element-property :raw-value datum)
		      (or (org-element-property :name datum)
			  (concat (org-element-property :raw-value
							(org-element-property :parent
									      (org-element-property :parent datum)))))))
	     ;; get ascii-only form of title without needing percent-encoding
	     (ref (concat (org-reference-contraction (substring-no-properties title))
			  (unless (or headline-p (org-element-property :name datum))
			    (concat ","
				    (pcase (car datum)
				      ('src-block "code")
				      ('example "example")
				      ('fixed-width "mono")
				      ('property-drawer "properties")
				      (_ (symbol-name (car datum))))
				    "--1"))))
	     (parent (when headline-p (org-element-property :parent datum))))
	(while (--any (equal ref (car it))
		      cache)
	  ;; Title not unique: make it so.
	  (if parent
	      ;; Append ancestor title.
	      (setf title (concat (org-element-property :raw-value parent)
				  "--" title)
		    ;; get ascii-only form of title without needing percent-encoding
		    ref (org-reference-contraction (substring-no-properties title))
		    parent (when headline-p (org-element-property :parent parent)))
	    ;; No more ancestors: add and increment a number.
	    (inc-suffixf ref)))
	ref)))

  (add-hook 'org-load-hook #'unpackaged/org-export-html-with-useful-ids-mode))
