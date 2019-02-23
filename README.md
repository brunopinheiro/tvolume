# Tmux Volume
> Enables displaying the volume percentage in Tmux `status-right` and `status-left`

## Installation
> [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'brunopinheiro/tvolume'

Hit `prefix + I` to fetch the plugin and source it.

## Usage

Add `#{volume_percentage}` string to the existing `status-right` or `status-left` tmux option.
Example:
```sh
    # in .tmux.conf
    set -g status-right 'ᐘ·#{volume_percentage}'
```