## Synopsis

helm sources for [emmet-mode][emmet-mode]'s snippets.

## Requirements

- [helm][helm]
- [emmet-mode][emmet-mode]

## Installation

### Manual

Just drop `helm-emmet.el`. somewhere in your `load-path`.

```lisp
(add-to-list 'load-path "~/somewhere")
```

### MELPA

If you're an Emacs 24 user or you have a recent version of package.el
you can install `helm-emmet.el` from the [MELPA](http://melpa.milkbox.net/) repository.

## Usage

### `helm-emmet`

Helm to preview or expand Emmet's snippets.

These actions are available.

* Preview snippet
* Expand snippet directly

## Customize

### `helm-emmet-snippet-first-line`

Face used for a first line of snippet in helm buffer.

[helm]:https://github.com/emacs-helm/helm
[emmet-mode]:https://github.com/smihica/emmet-mode
