Minor modes enabled in this buffer: Anzu Bug-Reference-Prog Corfu
Diff-Hl Display-Fill-Column-Indicator Display-Line-Numbers Eldoc
Flymake Font-Lock Goto-Address-Prog Hl-Line Normal-Erase-Is-Backspace
Rainbow-Delimiters Symbol-Overlay Whitespace-Cleanup
Whole-Line-Or-Region-Local

The major mode is CPerl mode defined in cperl-mode.el:

Major mode for editing Perl code.
Expression and list commands understand all C brackets.
Tab indents for Perl code.
Paragraphs are separated by blank lines only.
Delete converts tabs to spaces as it moves back.

Various characters in Perl almost always come in pairs: {}, (), [],
sometimes <>.  When the user types the first, she gets the second as
well, with optional special formatting done on {}.  (Disabled by
default.)  You can always quote (with C-q) the left
"paren" to avoid the expansion.  The processing of < is special,
since most the time you mean "less".  CPerl mode tries to guess
whether you want to type pair <>, and inserts is if it
appropriate.  You can set ‘cperl-electric-parens-string’ to the string that
contains the parens from the above list you want to be electrical.
Electricity of parens is controlled by ‘cperl-electric-parens’.
You may also set ‘cperl-electric-parens-mark’ to have electric parens
look for active mark and "embrace" a region if possible.’

CPerl mode provides expansion of the Perl control constructs:

   if, else, elsif, unless, while, until, continue, do,
   for, foreach, formy and foreachmy.

and POD directives (Disabled by default, see ‘cperl-electric-keywords’.)

The user types the keyword immediately followed by a space, which
causes the construct to be expanded, and the point is positioned where
she is most likely to want to be.  E.g., when the user types a space
following "if" the following appears in the buffer: if () { or if ()
} { } and the cursor is between the parentheses.  The user can then
type some boolean expression within the parens.  Having done that,
typing M-x cperl-linefeed places you - appropriately indented - on a
new line between the braces (if you typed M-x cperl-linefeed in a POD
directive line, then appropriate number of new lines is inserted).

If CPerl decides that you want to insert "English" style construct like

            bite if angry;

it will not do any expansion.  See also help on variable
‘cperl-extra-newline-before-brace’.  (Note that one can switch the
help message on expansion by setting ‘cperl-message-electric-keyword’
to nil.)

M-x cperl-linefeed is a convenience replacement for typing carriage
return.  It places you in the next line with proper indentation, or if
you type it inside the inline block of control construct, like

            foreach (@lines) {print; print}

and you are on a boundary of a statement inside braces, it will
transform the construct into a multiline and will place you into an
appropriately indented blank line.  If you need a usual
‘newline-and-indent’ behavior, it is on M-x newline-and-indent,
see documentation on ‘cperl-electric-linefeed’.

Use M-x cperl-invert-if-unless to change a construction of the form

	    if (A) { B }

into

            B if A;


Key             Binding

TAB		cperl-indent-command
C-j		newline-and-indent
(		cperl-electric-paren
)		cperl-electric-rparen
:		cperl-electric-terminator
;		cperl-electric-semi
<		cperl-electric-paren
[		cperl-electric-paren
]		cperl-electric-rparen
{		cperl-electric-lbrace
}		cperl-electric-brace
DEL		cperl-electric-backspace

<remap> <indent-for-comment>	cperl-indent-for-comment
<remap> <indent-region>		cperl-indent-region
<remap> <indent-sexp>		cperl-indent-exp

C-M-q		cperl-indent-exp
C-M-|		cperl-lineup

C-c C-a		cperl-toggle-auto-newline
C-c C-b		cperl-find-bad-style
C-c C-d		cperl-here-doc-spell
C-c C-e		cperl-toggle-electric
C-c C-f		auto-fill-mode
C-c C-j		cperl-linefeed
C-c C-k		cperl-toggle-abbrev
C-c C-n		cperl-narrow-to-here-doc
C-c C-p		cperl-pod-spell
C-c C-t		cperl-invert-if-unless
C-c C-v		cperl-next-interpolated-REx
C-c C-w		cperl-toggle-construct-fix
C-c C-x		cperl-next-interpolated-REx-0
C-c C-y		cperl-next-interpolated-REx-1

C-M-q		prog-indent-sexp
  (this binding is currently shadowed)

C-c C-h F	cperl-info-on-command
C-c C-h P	cperl-perldoc-at-point
C-c C-h a	cperl-toggle-autohelp
C-c C-h f	cperl-info-on-current-command
C-c C-h p	cperl-perldoc
C-c C-h v	cperl-get-help


Setting the variable ‘cperl-font-lock’ to t switches on ‘font-lock-mode’
(even with older Emacsen), ‘cperl-electric-lbrace-space’ to t switches
on electric space between $ and {, ‘cperl-electric-parens-string’ is
the string that contains parentheses that should be electric in CPerl
(see also ‘cperl-electric-parens-mark’ and ‘cperl-electric-parens’),
setting ‘cperl-electric-keywords’ enables electric expansion of
control structures in CPerl.  ‘cperl-electric-linefeed’ governs which
one of two linefeed behavior is preferable.  You can enable all these
options simultaneously (recommended mode of use) by setting
‘cperl-hairy’ to t.  In this case you can switch separate options off
by setting them to ‘null’.  Note that one may undo the extra
whitespace inserted by semis and braces in ‘auto-newline’-mode by
consequent M-x cperl-electric-backspace.

If your site has perl5 documentation in info format, you can use commands
M-x cperl-info-on-current-command and M-x cperl-info-on-command to access it.
These keys run commands ‘cperl-info-on-current-command’ and
‘cperl-info-on-command’, which one is which is controlled by variable
‘cperl-info-on-command-no-prompt’ and ‘cperl-clobber-lisp-bindings’
(in turn affected by ‘cperl-hairy’).

Even if you have no info-format documentation, short one-liner-style
help is available on M-x cperl-get-help, and one can run perldoc or
man via menu.

It is possible to show this help automatically after some idle time.
This is regulated by variable ‘cperl-lazy-help-time’.  Default with
‘cperl-hairy’ (if the value of ‘cperl-lazy-help-time’ is nil) is 5
secs idle time .  It is also possible to switch this on/off from the
menu, or via M-x cperl-toggle-autohelp.

Use M-x cperl-lineup to vertically lineup some construction - put the
beginning of the region at the start of construction, and make region
span the needed amount of lines.

Variables ‘cperl-pod-here-scan’, ‘cperl-pod-here-fontify’,
‘cperl-pod-face’, ‘cperl-pod-head-face’ control processing of POD and
here-docs sections.  Results of scan are used for indentation too.

Variables controlling indentation style:
 ‘cperl-tab-always-indent’
    Non-nil means TAB in CPerl mode should always reindent the current line,
    regardless of where in the line point is when the TAB command is used.
 ‘cperl-indent-left-aligned-comments’
    Non-nil means that the comment starting in leftmost column should indent.
 ‘cperl-auto-newline’
    Non-nil means automatically newline before and after braces,
    and after colons and semicolons, inserted in Perl code.  The following
    M-x cperl-electric-backspace will remove the inserted whitespace.
    Insertion after colons requires both this variable and
    ‘cperl-auto-newline-after-colon’ set.
 ‘cperl-auto-newline-after-colon’
    Non-nil means automatically newline even after colons.
    Subject to ‘cperl-auto-newline’ setting.
 ‘cperl-indent-level’
    Indentation of Perl statements within surrounding block.
    The surrounding block’s indentation is the indentation
    of the line on which the open-brace appears.
 ‘cperl-continued-statement-offset’
    Extra indentation given to a substatement, such as the
    then-clause of an if, or body of a while, or just a statement continuation.
 ‘cperl-continued-brace-offset’
    Extra indentation given to a brace that starts a substatement.
    This is in addition to ‘cperl-continued-statement-offset’.
 ‘cperl-brace-offset’
    Extra indentation for line if it starts with an open brace.
 ‘cperl-brace-imaginary-offset’
    An open brace following other text is treated as if it the line started
    this far to the right of the actual line indentation.
 ‘cperl-label-offset’
    Extra indentation for line that is a label.
 ‘cperl-min-label-indent’
    Minimal indentation for line that is a label.

Settings for classic indent-styles: K&R BSD=C++ GNU PBP PerlStyle=Whitesmith
  ‘cperl-indent-level’                5   4       2   4   4
  ‘cperl-brace-offset’                0   0       0   0   0
  ‘cperl-continued-brace-offset’     -5  -4       0   0   0
  ‘cperl-label-offset’               -5  -4      -2  -2  -4
  ‘cperl-continued-statement-offset’  5   4       2   4   4

CPerl knows several indentation styles, and may bulk set the
corresponding variables.  Use M-x cperl-set-style to do this or
set the ‘cperl-file-style’ user option.  Use
M-x cperl-set-style-back to restore the memorized preexisting
values (both available from menu).  See examples in
‘cperl-style-examples’.

Part of the indentation style is how different parts of if/elsif/else
statements are broken into lines; in CPerl, this is reflected on how
templates for these constructs are created (controlled by
‘cperl-extra-newline-before-brace’), and how reflow-logic should treat
"continuation" blocks of else/elsif/continue, controlled by the same
variable, and by ‘cperl-extra-newline-before-brace-multiline’,
‘cperl-merge-trailing-else’, ‘cperl-indent-region-fix-constructs’.

If ‘cperl-indent-level’ is 0, the statement after opening brace in
column 0 is indented on
‘cperl-brace-offset’+‘cperl-continued-statement-offset’.

Turning on CPerl mode calls the hooks in the variable ‘cperl-mode-hook’
with no args.

DO NOT FORGET to read micro-docs (available from ‘Perl’ menu)
or as help on variables ‘cperl-tips’, ‘cperl-problems’,
‘cperl-praise’, ‘cperl-speed’.

Global minor modes enabled: All-The-Icons-Completion
Auto-Compile-On-Load Auto-Compile-On-Save Auto-Encryption Blink-Cursor
Column-Number Context-Menu Corfu-Popupinfo Corfu-Terminal
Default-Text-Scale Delete-Selection Denote-Rename-Buffer Desktop-Save
Dimmer Diredfl-Global Electric-Indent Electric-Pair Envrc-Global
File-Name-Shadow Gcmh Global-Anzu Global-Auto-Revert Global-Corfu
Global-Diff-Hl Global-Eldoc Global-Font-Lock Global-Page-Break-Lines
Global-So-Long Global-Whitespace-Cleanup Hes Hyperbole
Immortal-Scratch Ipretty Line-Number Marginalia Menu-Bar
Mode-Line-Bell Mouse-Wheel Org-Super-Agenda Pixel-Scroll-Precision
Popper-Echo Popper Projectile Projectile-Rails-Global Recentf Repeat
Savehist Server Show-Paren Tab-Bar Tooltip Transient-Mark Vertico
Vertico-Mouse Which-Key Whole-Line-Or-Region-Global Winner Xterm-Mouse


Anzu minor mode (no indicator):
minor-mode which display search information in mode-line.

This is a minor mode.  If called interactively, toggle the ‘Anzu
mode’ mode.  If the prefix argument is positive, enable the mode,
and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘anzu-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Bug-Reference-Prog minor mode (no indicator):
Like ‘bug-reference-mode’, but only buttonize in comments and strings.

This is a minor mode.  If called interactively, toggle the
‘Bug-Reference-Prog mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘bug-reference-prog-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Corfu minor mode (no indicator):
COmpletion in Region FUnction.

This is a minor mode.  If called interactively, toggle the ‘Corfu
mode’ mode.  If the prefix argument is positive, enable the mode,
and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘corfu-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Diff-Hl minor mode (no indicator):
Toggle VC diff highlighting.

This is a minor mode.  If called interactively, toggle the
‘Diff-Hl mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘diff-hl-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Display-Fill-Column-Indicator minor mode (no indicator):
Toggle display of ‘fill-column’ indicator.

This uses ‘display-fill-column-indicator’ internally.

To change the position of the column displayed by default
customize ‘display-fill-column-indicator-column’.  You can change the
character for the indicator setting ‘display-fill-column-indicator-character’.
The globalized version is ‘global-display-fill-column-indicator-mode’,
which see.
This minor mode assumes the buffer uses a fixed-pitch font; if you
use variable-pitch fonts, the indicators on different lines might
not appear aligned.
See Info node ‘Displaying Boundaries’ for details.

This is a minor mode.  If called interactively, toggle the
‘Display-Fill-Column-Indicator mode’ mode.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘display-fill-column-indicator-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Display-Line-Numbers minor mode (no indicator):
Toggle display of line numbers in the buffer.

This uses ‘display-line-numbers’ internally.

To change the type of line numbers displayed by default,
customize ‘display-line-numbers-type’.  To change the type while
the mode is on, set ‘display-line-numbers’ directly.

This is a minor mode.  If called interactively, toggle the
‘Display-Line-Numbers mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘display-line-numbers-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Eldoc minor mode (indicator ElDoc):
Toggle echo area display of Lisp objects at point (ElDoc mode).

ElDoc mode is a buffer-local minor mode.  When enabled, the echo
area displays information about a function or variable in the
text where point is.  If point is on a documented variable, it
displays the first line of that variable’s doc string.  Otherwise
it displays the argument list of the function called in the
expression point is on.

This is a minor mode.  If called interactively, toggle the ‘Eldoc
mode’ mode.  If the prefix argument is positive, enable the mode,
and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘eldoc-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Flymake minor mode (indicator Flymake[0 0]):
Toggle Flymake mode on or off.

Flymake is an Emacs minor mode for on-the-fly syntax checking.
Flymake collects diagnostic information from multiple sources,
called backends, and visually annotates the buffer with the
results.

Flymake performs these checks while the user is editing.
The customization variables ‘flymake-start-on-flymake-mode’,
‘flymake-no-changes-timeout’ determine the exact circumstances
whereupon Flymake decides to initiate a check of the buffer.

The commands ‘flymake-goto-next-error’ and
‘flymake-goto-prev-error’ can be used to navigate among Flymake
diagnostics annotated in the buffer.

By default, ‘flymake-mode’ doesn’t override the C-x ` command, but
if you’re using Flymake a lot (and don’t use the regular compilation
mechanisms that often), it can be useful to put something like
the following in your init file:

  (setq next-error-function 'flymake-goto-next-error)

The visual appearance of each type of diagnostic can be changed
by setting properties ‘flymake-overlay-control’, ‘flymake-bitmap’
and ‘flymake-severity’ on the symbols of diagnostic types (like
‘:error’, ‘:warning’ and ‘:note’).

Activation or deactivation of backends used by Flymake in each
buffer happens via the special hook
‘flymake-diagnostic-functions’.

Some backends may take longer than others to respond or complete,
and some may decide to disable themselves if they are not
suitable for the current buffer.  The commands
‘flymake-running-backends’, ‘flymake-disabled-backends’ and
‘flymake-reporting-backends’ summarize the situation, as does the
special *Flymake log* buffer.

This is a minor mode.  If called interactively, toggle the
‘Flymake mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘flymake-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Font-Lock minor mode (no indicator):
Toggle syntax highlighting in this buffer (Font Lock mode).

When Font Lock mode is enabled, text is fontified as you type it:

 - Comments are displayed in ‘font-lock-comment-face’;
 - Strings are displayed in ‘font-lock-string-face’;
 - Certain other expressions are displayed in other faces
   according to the value of the variable ‘font-lock-keywords’.

To customize the faces (colors, fonts, etc.) used by Font Lock for
fontifying different parts of buffer text, use M-x customize-face.

You can enable Font Lock mode in any major mode automatically by
turning on in the major mode’s hook.  For example, put in your
~/.emacs:

 (add-hook 'c-mode-hook 'turn-on-font-lock)

Alternatively, you can use Global Font Lock mode to automagically
turn on Font Lock mode in buffers whose major mode supports it
and whose major mode is one of ‘font-lock-global-modes’.  For
example, put in your ~/.emacs:

 (global-font-lock-mode t)

Where major modes support different levels of fontification, you
can use the variable ‘font-lock-maximum-decoration’ to specify
which level you generally prefer.  When you turn Font Lock mode
on/off the buffer is fontified/defontified.

To add your own highlighting for some major mode, and modify the
highlighting selected automatically via the variable
‘font-lock-maximum-decoration’, you can use
‘font-lock-add-keywords’.

To fontify a buffer, without turning on Font Lock mode and
regardless of buffer size, you can use M-x font-lock-fontify-buffer.

To fontify a block (the function or paragraph containing point,
or a number of lines around point), perhaps because modification
on the current line caused syntactic change on other lines, you
can use M-x font-lock-fontify-block.

You can set your own default settings for some mode, by setting a
buffer local value for ‘font-lock-defaults’, via its mode hook.

The above is the default behavior of ‘font-lock-mode’; you may
specify your own function which is called when ‘font-lock-mode’
is toggled via ‘font-lock-function’.

This is a minor mode.  If called interactively, toggle the
‘Font-Lock mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘font-lock-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Goto-Address-Prog minor mode (no indicator):
Like ‘goto-address-mode’, but only for comments and strings.

This is a minor mode.  If called interactively, toggle the
‘Goto-Address-Prog mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘goto-address-prog-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Hl-Line minor mode (no indicator):
Toggle highlighting of the current line (Hl-Line mode).

Hl-Line mode is a buffer-local minor mode.  If
‘hl-line-sticky-flag’ is non-nil, Hl-Line mode highlights the
line about the buffer’s point in all windows.  Caveat: the
buffer’s point might be different from the point of a
non-selected window.  Hl-Line mode uses the function
‘hl-line-highlight’ on ‘post-command-hook’ in this case.

When ‘hl-line-sticky-flag’ is nil, Hl-Line mode highlights the
line about point in the selected window only.

This is a minor mode.  If called interactively, toggle the
‘Hl-Line mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘hl-line-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Normal-Erase-Is-Backspace minor mode (no indicator):
Toggle the Erase and Delete mode of the Backspace and Delete keys.

On window systems, when this mode is on, Delete is mapped to C-d
and Backspace is mapped to DEL; when this mode is off, both
Delete and Backspace are mapped to DEL.  (The remapping goes via
‘local-function-key-map’, so binding Delete or Backspace in the
global or local keymap will override that.)

In addition, on window systems, the bindings of C-Delete, M-Delete,
C-M-Delete, C-Backspace, M-Backspace, and C-M-Backspace are changed in
the global keymap in accordance with the functionality of Delete and
Backspace.  For example, if Delete is remapped to C-d, which deletes
forward, C-Delete is bound to ‘kill-word’, but if Delete is remapped
to DEL, which deletes backward, C-Delete is bound to
‘backward-kill-word’.

If not running on a window system, a similar effect is accomplished by
remapping C-h (normally produced by the Backspace key) and DEL via
‘keyboard-translate’: if this mode is on, C-h is mapped to DEL and DEL
to C-d; if it’s off, the keys are not remapped.

When not running on a window system, and this mode is turned on, the
former functionality of C-h is available on the F1 key.  You should
probably not turn on this mode on a text-only terminal if you don’t
have both Backspace, Delete and F1 keys.

See also ‘normal-erase-is-backspace’.

This is a minor mode.  If called interactively, toggle the
‘Normal-Erase-Is-Backspace mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(eq (terminal-parameter nil
'normal-erase-is-backspace) 1)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Rainbow-Delimiters minor mode (no indicator):
Highlight nested parentheses, brackets, and braces according to their depth.

This is a minor mode.  If called interactively, toggle the
‘Rainbow-Delimiters mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘rainbow-delimiters-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Symbol-Overlay minor mode (no indicator):
Minor mode for auto-highlighting symbol at point.

This is a minor mode.  If called interactively, toggle the
‘Symbol-Overlay mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘symbol-overlay-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Whitespace-Cleanup minor mode (no indicator):
Automatically call ‘whitespace-cleanup’ on save.

This is a minor mode.  If called interactively, toggle the
‘Whitespace-Cleanup mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘whitespace-cleanup-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Whole-Line-Or-Region-Local minor mode (no indicator):
Make chosen commands operate on the current line if no region is active.

Modify ‘whole-line-or-region-local-mode-map’ to change which
commands are affected.

This is a minor mode.  If called interactively, toggle the
‘Whole-Line-Or-Region-Local mode’ mode.  If the prefix argument
is positive, enable the mode, and if it is zero or negative,
disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘whole-line-or-region-local-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


All-The-Icons-Completion minor mode (no indicator):
Add icons to completion candidates.

This is a global minor mode.  If called interactively, toggle the
‘All-The-Icons-Completion mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'all-the-icons-completion-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Auto-Compile-On-Load minor mode (no indicator):
Before loading a library recompile it if it needs recompilation.

A library needs to be recompiled if the source file is newer than
its byte-compile destination.  Without this advice the outdated
byte code file would be loaded instead.

Also see the related ‘auto-compile-on-save-mode’.

This is a global minor mode.  If called interactively, toggle the
‘Auto-Compile-On-Load mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'auto-compile-on-load-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Auto-Compile-On-Save minor mode (no indicator):
Toggle Auto-Compile mode in all buffers.
With prefix ARG, enable Auto-Compile-On-Save mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Auto-Compile mode is enabled in all buffers where
‘turn-on-auto-compile-mode’ would do it.

See ‘auto-compile-mode’ for more information on Auto-Compile mode.


Auto-Encryption minor mode (no indicator):
Toggle automatic file encryption/decryption (Auto Encryption mode).

This is a global minor mode.  If called interactively, toggle the
‘Auto-Encryption mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'auto-encryption-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Blink-Cursor minor mode (no indicator):
Toggle cursor blinking (Blink Cursor mode).

If the value of ‘blink-cursor-blinks’ is positive (10 by default),
the cursor stops blinking after that number of blinks, if Emacs
gets no input during that time.

See also ‘blink-cursor-interval’ and ‘blink-cursor-delay’.

This command is effective only on graphical frames.  On text-only
terminals, cursor blinking is controlled by the terminal.

This is a global minor mode.  If called interactively, toggle the
‘Blink-Cursor mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'blink-cursor-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Column-Number minor mode (no indicator):
Toggle column number display in the mode line (Column Number mode).

See ‘mode-line-position-column-format’ for how this number is
presented.

This is a global minor mode.  If called interactively, toggle the
‘Column-Number mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'column-number-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Context-Menu minor mode (no indicator):
Toggle Context Menu mode.

When Context Menu mode is enabled, clicking the mouse button down-mouse-3
activates the menu whose contents depends on its surrounding context.

This is a global minor mode.  If called interactively, toggle the
‘Context-Menu mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'context-menu-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Key             Binding

<menu>		context-menu-open



Corfu-Popupinfo minor mode (no indicator):
Corfu info popup minor mode.

This is a global minor mode.  If called interactively, toggle the
‘Corfu-Popupinfo mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'corfu-popupinfo-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Corfu-Terminal minor mode (no indicator):
Corfu popup on terminal.

This is a global minor mode.  If called interactively, toggle the
‘Corfu-Terminal mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'corfu-terminal-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Default-Text-Scale minor mode (no indicator):
Change the size of the "default" face in every frame.

This is a global minor mode.  If called interactively, toggle the
‘Default-Text-Scale mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'default-text-scale-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Delete-Selection minor mode (no indicator):
Toggle Delete Selection mode.

When Delete Selection mode is enabled, typed text replaces the selection
if the selection is active.  Otherwise, typed text is just inserted at
point regardless of any selection.

See ‘delete-selection-helper’ and ‘delete-selection-pre-hook’ for
information on adapting behavior of commands in Delete Selection mode.

This is a global minor mode.  If called interactively, toggle the
‘Delete-Selection mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'delete-selection-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Denote-Rename-Buffer minor mode (no indicator):
Automatically rename Denote buffers to be easier to read.

A buffer is renamed upon visiting the underlying file.  This
means that existing buffers are not renamed until they are
visited again in a new buffer (files are visited with the command
‘find-file’ or related).

This is a global minor mode.  If called interactively, toggle the
‘Denote-Rename-Buffer mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'denote-rename-buffer-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Desktop-Save minor mode (no indicator):
Toggle desktop saving (Desktop Save mode).

When Desktop Save mode is enabled, the state of Emacs is saved from one
session to another.  The saved Emacs "desktop configuration" includes the
buffers, their file names, major modes, buffer positions, window and frame
configuration, and some important global variables.

To enable this feature for future sessions, customize ‘desktop-save-mode’
to t, or add this line in your init file:

    (desktop-save-mode 1)

When this mode is enabled, Emacs will save the desktop when it exits
(this may prompt you, see the option ‘desktop-save’).  The next time
Emacs starts, if this mode is active it will restore the desktop.

To manually save the desktop at any time, use the command M-x desktop-save.
To load it, use M-x desktop-read.

Once a desktop file exists, Emacs will auto-save it according to the
option ‘desktop-auto-save-timeout’.

To see all the options you can set, browse the ‘desktop’ customization group.

For further details, see info node ‘(emacs)Saving Emacs Sessions’.

This is a global minor mode.  If called interactively, toggle the
‘Desktop-Save mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'desktop-save-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Dimmer minor mode (no indicator):
Visually highlight the selected buffer.

This is a global minor mode.  If called interactively, toggle the
‘Dimmer mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'dimmer-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Diredfl-Global minor mode (no indicator):
Toggle Diredfl mode in all buffers.
With prefix ARG, enable Diredfl-Global mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Diredfl mode is enabled in all buffers where ‘(lambda nil (when
(derived-mode-p ’dired-mode) (diredfl-mode)))’ would do it.

See ‘diredfl-mode’ for more information on Diredfl mode.


Electric-Indent minor mode (no indicator):
Toggle on-the-fly reindentation of text lines (Electric Indent mode).

When enabled, this reindents whenever the hook ‘electric-indent-functions’
returns non-nil, or if you insert one of the "electric characters".
The electric characters normally include the newline, but can
also include other characters as needed by the major mode; see
‘electric-indent-chars’ for the actual list.

By "reindent" we mean remove any existing indentation, and then
indent the line according to context and rules of the major mode.

This is a global minor mode.  To toggle the mode in a single buffer,
use ‘electric-indent-local-mode’.

This is a global minor mode.  If called interactively, toggle the
‘Electric-Indent mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'electric-indent-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Electric-Pair minor mode (no indicator):
Toggle automatic parens pairing (Electric Pair mode).

Electric Pair mode is a global minor mode.  When enabled, typing
an open parenthesis automatically inserts the corresponding
closing parenthesis, and vice versa.  (Likewise for brackets, etc.).
If the region is active, the parentheses (brackets, etc.) are
inserted around the region instead.

To toggle the mode in a single buffer, use ‘electric-pair-local-mode’.

This is a global minor mode.  If called interactively, toggle the
‘Electric-Pair mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'electric-pair-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Envrc-Global minor mode (no indicator):
Toggle Envrc mode in all buffers.
With prefix ARG, enable Envrc-Global mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Envrc mode is enabled in all buffers where ‘(lambda nil (when (and
(not (minibufferp)) (not (file-remote-p default-directory))
(executable-find envrc-direnv-executable)) (envrc-mode 1)))’ would do
it.

See ‘envrc-mode’ for more information on Envrc mode.


File-Name-Shadow minor mode (no indicator):
Toggle file-name shadowing in minibuffers (File-Name Shadow mode).

File-Name Shadow mode is a global minor mode.  When enabled, any
part of a filename being read in the minibuffer that would be
ignored (because the result is passed through
‘substitute-in-file-name’) is given the properties in
‘file-name-shadow-properties’, which can be used to make that
portion dim, invisible, or otherwise less visually noticeable.

This is a global minor mode.  If called interactively, toggle the
‘File-Name-Shadow mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'file-name-shadow-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Gcmh minor mode (no indicator):
Minor mode to tweak Garbage Collection strategy.

This is a global minor mode.  If called interactively, toggle the
‘GCMH mode’ mode.  If the prefix argument is positive, enable the
mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'gcmh-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Global-Anzu minor mode (no indicator):
Toggle Anzu mode in all buffers.
With prefix ARG, enable Global Anzu mode if ARG is positive; otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Anzu mode is enabled in all buffers where ‘anzu--turn-on’ would do it.

See ‘anzu-mode’ for more information on Anzu mode.


Global-Auto-Revert minor mode (no indicator):
Toggle Global Auto-Revert Mode.

Global Auto-Revert Mode is a global minor mode that reverts any
buffer associated with a file when the file changes on disk.  Use
‘auto-revert-mode’ to revert a particular buffer.

If ‘global-auto-revert-non-file-buffers’ is non-nil, this mode
may also revert some non-file buffers, as described in the
documentation of that variable.  It ignores buffers with modes
matching ‘global-auto-revert-ignore-modes’, and buffers with a
non-nil value of ‘global-auto-revert-ignore-buffer’.

When a buffer is reverted, a message is generated.  This can be
suppressed by setting ‘auto-revert-verbose’ to nil.

This function calls the hook ‘global-auto-revert-mode-hook’.
It displays the text that ‘global-auto-revert-mode-text’
specifies in the mode line.

This is a global minor mode.  If called interactively, toggle the
‘Global Auto-Revert mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'global-auto-revert-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Global-Corfu minor mode (no indicator):
Toggle Corfu mode in all buffers.
With prefix ARG, enable Global Corfu mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Corfu mode is enabled in all buffers where ‘corfu--on’ would do it.

See ‘corfu-mode’ for more information on Corfu mode.


Global-Diff-Hl minor mode (no indicator):
Toggle Diff-Hl mode in all buffers.
With prefix ARG, enable Global Diff-Hl mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Diff-Hl mode is enabled in all buffers where ‘diff-hl--global-turn-on’
would do it.

See ‘diff-hl-mode’ for more information on Diff-Hl mode.


Global-Eldoc minor mode (no indicator):
Toggle Eldoc mode in all buffers.
With prefix ARG, enable Global Eldoc mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Eldoc mode is enabled in all buffers where ‘turn-on-eldoc-mode’ would
do it.

See ‘eldoc-mode’ for more information on Eldoc mode.


Global-Font-Lock minor mode (no indicator):
Toggle Font-Lock mode in all buffers.
With prefix ARG, enable Global Font-Lock mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Font-Lock mode is enabled in all buffers where
‘turn-on-font-lock-if-desired’ would do it.

See ‘font-lock-mode’ for more information on Font-Lock mode.


Global-Page-Break-Lines minor mode (no indicator):
Toggle Page-Break-Lines mode in all buffers.
With prefix ARG, enable Global Page-Break-Lines mode if ARG is
positive; otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Page-Break-Lines mode is enabled in all buffers where
‘page-break-lines-mode-maybe’ would do it.

See ‘page-break-lines-mode’ for more information on Page-Break-Lines
mode.


Global-So-Long minor mode (no indicator):
Toggle automated performance mitigations for files with long lines.

Many Emacs modes struggle with buffers which contain excessively long lines,
and may consequently cause unacceptable performance issues.

This is commonly on account of "minified" code (i.e. code that has been
compacted into the smallest file size possible, which often entails removing
newlines should they not be strictly necessary).

When such files are detected by ‘so-long-predicate’, we invoke the selected
‘so-long-action’ to mitigate potential performance problems in the buffer.

Use M-x so-long-commentary for more information.

Use M-x so-long-customize to open the customization group ‘so-long’ to
configure the behavior.

This is a global minor mode.  If called interactively, toggle the
‘Global So-Long mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'global-so-long-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Global-Whitespace-Cleanup minor mode (no indicator):
Toggle Whitespace-Cleanup mode in all buffers.
With prefix ARG, enable Global Whitespace-Cleanup mode if ARG is
positive; otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Whitespace-Cleanup mode is enabled in all buffers where
‘whitespace-cleanup-mode--maybe’ would do it.

See ‘whitespace-cleanup-mode’ for more information on
Whitespace-Cleanup mode.


Hes minor mode (no indicator):
Toggle highlighting of escape sequences.

This is a global minor mode.  If called interactively, toggle the
‘Hes mode’ mode.  If the prefix argument is positive, enable the
mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'hes-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Hyperbole minor mode (indicator Hypb):
Toggle Hyperbole global minor mode with M-x hyperbole-mode.

Hyperbole is the Everyday Hypertextual Information Manager.

When Hyperbole mode is enabled, the ‘hyperbole-mode’ variable
is non-nil, Hyperbole menus are enabled, as are Hyperbole keys.

Invoke the Hyperbole minibuffer menu with C-h h.  See the
Info documentation at "(hyperbole)Top".


Key             Binding

			hkey-either
M-<return>		hkey-either
S-<double-mouse-2>	action-mouse-key-emacs
S-<double-mouse-3>	assist-mouse-key-emacs
S-<down-mouse-2>	action-key-depress-emacs
S-<down-mouse-3>	assist-key-depress-emacs
S-<drag-mouse-2>	action-mouse-key-emacs
S-<drag-mouse-3>	assist-mouse-key-emacs
S-<mouse-2>		action-mouse-key-emacs
S-<mouse-3>		assist-mouse-key-emacs
S-<triple-mouse-2>	action-mouse-key-emacs
S-<triple-mouse-3>	assist-mouse-key-emacs
<double-mouse-1>	hui-select-thing-with-mouse
<triple-mouse-1>	hui-select-thing-with-mouse

<mode-line> S-<down-mouse-2>	action-key-depress-emacs
<mode-line> S-<down-mouse-3>	assist-key-depress-emacs
<mode-line> S-<drag-mouse-2>	action-mouse-key-emacs
<mode-line> S-<drag-mouse-3>	assist-mouse-key-emacs
<mode-line> S-<mouse-2>		action-mouse-key-emacs
<mode-line> S-<mouse-3>		assist-mouse-key-emacs

<vertical-line> S-<down-mouse-2> action-key-depress-emacs
<vertical-line> S-<down-mouse-3> assist-key-depress-emacs
<vertical-line> S-<drag-mouse-2> action-mouse-key-emacs
<vertical-line> S-<drag-mouse-3> assist-mouse-key-emacs
<vertical-line> S-<mouse-2>	 action-mouse-key-emacs
<vertical-line> S-<mouse-3>	 assist-mouse-key-emacs

<right-fringe> S-<down-mouse-2>	action-key-depress-emacs
<right-fringe> S-<down-mouse-3>	assist-key-depress-emacs
<right-fringe> S-<drag-mouse-2>	action-mouse-key-emacs
<right-fringe> S-<drag-mouse-3>	assist-mouse-key-emacs
<right-fringe> S-<mouse-2>	action-mouse-key-emacs
<right-fringe> S-<mouse-3>	assist-mouse-key-emacs

<left-fringe> S-<down-mouse-2>	action-key-depress-emacs
<left-fringe> S-<down-mouse-3>	assist-key-depress-emacs
<left-fringe> S-<drag-mouse-2>	action-mouse-key-emacs
<left-fringe> S-<drag-mouse-3>	assist-mouse-key-emacs
<left-fringe> S-<mouse-2>	action-mouse-key-emacs
<left-fringe> S-<mouse-3>	assist-mouse-key-emacs

<header-line> S-<down-mouse-2>	action-key-depress-emacs
<header-line> S-<down-mouse-3>	assist-key-depress-emacs
<header-line> S-<drag-mouse-2>	action-mouse-key-emacs
<header-line> S-<drag-mouse-3>	assist-mouse-key-emacs
<header-line> S-<mouse-2>	action-mouse-key-emacs
<header-line> S-<mouse-3>	assist-mouse-key-emacs

C-<insertchar>	hui-kill-ring-save
  (Remapped via <remap> <kill-ring-save>)

C-h A		hkey-help

M-RET		hkey-either
ESC <return>	hkey-either

C-c RET		hui-select-thing
C-c .		hui-select-goto-matching-delimiter
C-c /		hui-search-web
C-c @		hycontrol-windows-grid
C-c \		hycontrol-enable-windows-mode

C-x r s		hui-copy-to-register


This is a global minor mode.  If called interactively, toggle the
‘Hyperbole mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'hyperbole-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Immortal-Scratch minor mode (no indicator):
When the scratch buffer is killed, immediately respawn it.

This is a global minor mode.  If called interactively, toggle the
‘Immortal-Scratch mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'immortal-scratch-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Ipretty minor mode (no indicator):
Toggle ipretty mode globally.

   With no argument, this command toggles the mode.
   Non-null prefix argument turns on the mode.
   Null prefix argument turns off the mode.

This is a global minor mode.  If called interactively, toggle the
‘Ipretty mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'ipretty-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Line-Number minor mode (no indicator):
Toggle line number display in the mode line (Line Number mode).

Line numbers do not appear for very large buffers and buffers
with very long lines; see variables ‘line-number-display-limit’
and ‘line-number-display-limit-width’.

See ‘mode-line-position-line-format’ for how this number is
presented.

This is a global minor mode.  If called interactively, toggle the
‘Line-Number mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'line-number-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Marginalia minor mode (no indicator):
Annotate completion candidates with richer information.

This is a global minor mode.  If called interactively, toggle the
‘Marginalia mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'marginalia-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Menu-Bar minor mode (no indicator):
Toggle display of a menu bar on each frame (Menu Bar mode).

This command applies to all frames that exist and frames to be
created in the future.

This is a global minor mode.  If called interactively, toggle the
‘Menu-Bar mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘menu-bar-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Mode-Line-Bell minor mode (no indicator):
Flash the mode line instead of ringing the bell.

This is a global minor mode.  If called interactively, toggle the
‘Mode-Line-Bell mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'mode-line-bell-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Mouse-Wheel minor mode (no indicator):
Toggle mouse wheel support (Mouse Wheel mode).

This is a global minor mode.  If called interactively, toggle the
‘Mouse-Wheel mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'mouse-wheel-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Org-Super-Agenda minor mode (no indicator):
Group items in Org agenda views according to ‘org-super-agenda-groups’.
With prefix argument ARG, turn on if positive, otherwise off.


Pixel-Scroll-Precision minor mode (no indicator):
Toggle pixel scrolling.

When enabled, this minor mode allows to scroll the display
precisely, according to the turning of the mouse wheel.

This is a global minor mode.  If called interactively, toggle the
‘Pixel-Scroll-Precision mode’ mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'pixel-scroll-precision-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Popper-Echo minor mode (no indicator):
Toggle Popper Echo mode.

Show popup names in cycling order in the echo area when
performing an action that involves showing a popup.  These popups
can be accessed directly or acted upon by using quick keys (see
‘popper-echo-dispatch-keys’).

To define buffers as popups and customize popup display, see
‘popper-mode’.

This is a global minor mode.  If called interactively, toggle the
‘Popper-Echo mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'popper-echo-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Popper minor mode (no indicator):
Toggle Popper mode.

When enabled, treat certain buffer windows as popups, a class of
window that can be summoned or dismissed with a command.  See the
customization options for details on how to designate buffer
types as popups.

This is a global minor mode.  If called interactively, toggle the
‘Popper mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'popper-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Projectile minor mode (indicator Proj[bash_scripts:generic]):
Minor mode to assist project management and navigation.

When called interactively, toggle ‘projectile-mode’.  With prefix
ARG, enable ‘projectile-mode’ if ARG is positive, otherwise disable
it.

When called from Lisp, enable ‘projectile-mode’ if ARG is omitted,
nil or positive.  If ARG is ‘toggle’, toggle ‘projectile-mode’.
Otherwise behave as if called interactively.


Key             Binding

C-c p ESC	projectile-project-buffers-other-buffer
C-c p !		projectile-run-shell-command-in-root
C-c p &		projectile-run-async-shell-command-in-root
C-c p ?		projectile-find-references
C-c p C		projectile-configure-project
C-c p D		projectile-dired
C-c p E		projectile-edit-dir-locals
C-c p F		projectile-find-file-in-known-projects
C-c p I		projectile-ibuffer
C-c p K		projectile-package-project
C-c p L		projectile-install-project
C-c p P		projectile-test-project
C-c p R		projectile-regenerate-tags
C-c p S		projectile-save-project-buffers
C-c p T		projectile-find-test-file
C-c p V		projectile-browse-dirty-projects
C-c p a		projectile-find-other-file
C-c p b		projectile-switch-to-buffer
C-c p c		projectile-compile-project
C-c p d		projectile-find-dir
C-c p e		projectile-recentf
C-c p f		projectile-find-file
C-c p g		projectile-find-file-dwim
C-c p i		projectile-invalidate-cache
C-c p j		projectile-find-tag
C-c p k		projectile-kill-buffers
C-c p l		projectile-find-file-in-directory
C-c p m		projectile-commander
C-c p o		projectile-multi-occur
C-c p p		projectile-switch-project
C-c p q		projectile-switch-open-project
C-c p r		projectile-replace
C-c p t		projectile-toggle-between-implementation-and-test
C-c p u		projectile-run-project
C-c p v		projectile-vc
C-c p z		projectile-cache-current-file
C-c p <left>	projectile-previous-project-buffer
C-c p <right>	projectile-next-project-buffer

C-c p x e	projectile-run-eshell
C-c p x g	projectile-run-gdb
C-c p x i	projectile-run-ielm
C-c p x s	projectile-run-shell
C-c p x t	projectile-run-term
C-c p x v	projectile-run-vterm

C-c p s g	projectile-grep
C-c p s r	projectile-ripgrep
C-c p s s	projectile-ag
C-c p s x	projectile-find-references

C-c p 5 D	projectile-dired-other-frame
C-c p 5 a	projectile-find-other-file-other-frame
C-c p 5 b	projectile-switch-to-buffer-other-frame
C-c p 5 d	projectile-find-dir-other-frame
C-c p 5 f	projectile-find-file-other-frame
C-c p 5 g	projectile-find-file-dwim-other-frame
C-c p 5 t	projectile-find-implementation-or-test-other-frame

C-c p 4 C-o	projectile-display-buffer
C-c p 4 D	projectile-dired-other-window
C-c p 4 a	projectile-find-other-file-other-window
C-c p 4 b	projectile-switch-to-buffer-other-window
C-c p 4 d	projectile-find-dir-other-window
C-c p 4 f	projectile-find-file-other-window
C-c p 4 g	projectile-find-file-dwim-other-window
C-c p 4 t	projectile-find-implementation-or-test-other-window

C-c p x 4 v	projectile-run-vterm-other-window



Projectile-Rails-Global minor mode (no indicator):
Toggle Projectile-Rails mode in all buffers.
With prefix ARG, enable Projectile-Rails-Global mode if ARG is
positive; otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Projectile-Rails mode is enabled in all buffers where
‘projectile-rails-on’ would do it.

See ‘projectile-rails-mode’ for more information on Projectile-Rails
mode.


Recentf minor mode (no indicator):
Toggle keeping track of opened files (Recentf mode).

This mode maintains a list of recently opened files and makes it
easy to visit them.  The recent files list is automatically saved
across Emacs sessions.

You can use ‘recentf-open’ or ‘recentf-open-files’ to visit
files.

When Recentf mode is enabled, a "Open Recent" submenu is
displayed in the "File" menu, containing a list of files that
were operated on recently, in the most-recently-used order.

By default, only operations like opening a file, writing a buffer
to a file, and killing a buffer is counted as "operating" on
the file.  If instead you want to prioritize files that appear in
buffers you switch to a lot, you can say something like the following:

  (add-hook 'buffer-list-update-hook #'recentf-track-opened-file)

This is a global minor mode.  If called interactively, toggle the
‘Recentf mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'recentf-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Repeat minor mode (no indicator):
Toggle Repeat mode.

When Repeat mode is enabled, certain commands bound to multi-key
sequences can be repeated by typing a single key, after typing the
full key sequence once.
The commands which can be repeated like that are those whose symbol
 has the property ‘repeat-map’ which specifies a keymap of single
keys for repeating.
See ‘describe-repeat-maps’ for a list of all repeatable commands.

This is a global minor mode.  If called interactively, toggle the
‘Repeat mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'repeat-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Savehist minor mode (no indicator):
Toggle saving of minibuffer history (Savehist mode).

When Savehist mode is enabled, minibuffer history is saved
to ‘savehist-file’ periodically and when exiting Emacs.  When
Savehist mode is enabled for the first time in an Emacs session,
it loads the previous minibuffer histories from ‘savehist-file’.
The variable ‘savehist-autosave-interval’ controls the
periodicity of saving minibuffer histories.

If ‘savehist-save-minibuffer-history’ is non-nil (the default),
all recorded minibuffer histories will be saved.  You can arrange
for additional history variables to be saved and restored by
customizing ‘savehist-additional-variables’, which by default is
an empty list.  For example, to save the history of commands
invoked via M-x, add ‘command-history’ to the list in
‘savehist-additional-variables’.

Alternatively, you could customize ‘savehist-save-minibuffer-history’
to nil, and add to ‘savehist-additional-variables’ only those
history variables you want to save.

To ignore some history variables, add their symbols to the list
in ‘savehist-ignored-variables’.

This mode should normally be turned on from your Emacs init file.
Calling it at any other time replaces your current minibuffer
histories, which is probably undesirable.

This is a global minor mode.  If called interactively, toggle the
‘Savehist mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'savehist-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Server minor mode (no indicator):
Toggle Server mode.

Server mode runs a process that accepts commands from the
‘emacsclient’ program.  See Info node ‘Emacs server’ and
‘server-start’ for details.

This is a global minor mode.  If called interactively, toggle the
‘Server mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'server-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Show-Paren minor mode (no indicator):
Toggle visualization of matching parens (Show Paren mode).

When enabled, any matching parenthesis is highlighted in ‘show-paren-style’
after ‘show-paren-delay’ seconds of Emacs idle time.

Also see ‘show-paren-predicate’, which controls which buffers
this mode is enabled in.

This is a global minor mode.  To toggle the mode in a single buffer,
use ‘show-paren-local-mode’.

This is a global minor mode.  If called interactively, toggle the
‘Show-Paren mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'show-paren-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Tab-Bar minor mode (no indicator):
Toggle the tab bar in all graphical frames (Tab Bar mode).

This is a global minor mode.  If called interactively, toggle the
‘Tab-Bar mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘tab-bar-mode’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Tooltip minor mode (no indicator):
Toggle Tooltip mode.

When this global minor mode is enabled, Emacs displays help
text (e.g. for buttons and menu items that you put the mouse on)
in a pop-up window.

When Tooltip mode is disabled, Emacs displays help text in the
echo area, instead of making a pop-up window.

This is a global minor mode.  If called interactively, toggle the
‘Tooltip mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'tooltip-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Transient-Mark minor mode (no indicator):
Toggle Transient Mark mode.

Transient Mark mode is a global minor mode.  When enabled, the
region is highlighted with the ‘region’ face whenever the mark
is active.  The mark is "deactivated" after certain non-motion
commands, including those that change the text in the buffer, and
during shift or mouse selection by any unshifted cursor motion
command (see Info node ‘Shift Selection’ for more details).

You can also deactivate the mark by typing C-g or
M-ESC ESC.

Many commands change their behavior when Transient Mark mode is
in effect and the mark is active, by acting on the region instead
of their usual default part of the buffer’s text.  Examples of
such commands include M-;, M-x flush-lines, M-x keep-lines,
M-%, C-M-%, M-x ispell, and C-x u.
To see the documentation of commands that are sensitive to the
Transient Mark mode, invoke C-h d and type "transient"
or "mark.*active" at the prompt.

This is a global minor mode.  If called interactively, toggle the
‘Transient-Mark mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'transient-mark-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Vertico minor mode (no indicator):
VERTical Interactive COmpletion.

This is a global minor mode.  If called interactively, toggle the
‘Vertico mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'vertico-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Vertico-Mouse minor mode (no indicator):
Mouse support for Vertico.

This is a global minor mode.  If called interactively, toggle the
‘Vertico-Mouse mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'vertico-mouse-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Which-Key minor mode (no indicator):
Toggle ‘which-key-mode’.

This is a global minor mode.  If called interactively, toggle the
‘Which-Key mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'which-key-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Whole-Line-Or-Region-Global minor mode (no indicator):
Toggle Whole-Line-Or-Region-Local mode in all buffers.
With prefix ARG, enable Whole-Line-Or-Region-Global mode if ARG is
positive; otherwise, disable it.

If called from Lisp, toggle the mode if ARG is ‘toggle’.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Whole-Line-Or-Region-Local mode is enabled in all buffers where
‘(lambda nil (unless (apply ’derived-mode-p
whole-line-or-region-inhibit-modes) (whole-line-or-region-local-mode
1)))’ would do it.

See ‘whole-line-or-region-local-mode’ for more information on
Whole-Line-Or-Region-Local mode.


Winner minor mode (no indicator):
Toggle Winner mode on or off.

Winner mode is a global minor mode that records the changes in
the window configuration (i.e. how the frames are partitioned
into windows) so that the changes can be "undone" using the
command ‘winner-undo’.  By default this one is bound to the key
sequence C-c <left>.  If you change your mind (while undoing),
you can press C-c <right> (calling ‘winner-redo’).

This is a global minor mode.  If called interactively, toggle the
‘Winner mode’ mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'winner-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.


Xterm-Mouse minor mode (no indicator):
Toggle XTerm mouse mode.

Turn it on to use Emacs mouse commands, and off to use xterm mouse commands.
This works in terminal emulators compatible with xterm.  It only
works for simple uses of the mouse.  Basically, only non-modified
single clicks are supported.  When turned on, the normal xterm
mouse functionality for such clicks is still available by holding
down the SHIFT key while pressing the mouse button.

This is a global minor mode.  If called interactively, toggle the
‘Xterm-Mouse mode’ mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate ‘(default-value 'xterm-mouse-mode)’.

The mode’s hook is called both when the mode is enabled and when
it is disabled.
