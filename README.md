# My-SH

A shell-based working environment framework in which you can switch shell and domain however you want. It also contains some handy configurations of useful tools such as `vim` and `tmux`.

## Internal bootstrap and SSD tool data

Keep the **sole** my-sh checkout at `$HOME/my-sh` on the internal disk, not
under an external `$HOME/dev`. Existing installations should update `MY_SH_HOME`,
the `my-sh.sh` source line and their existing config/plugin symlinks. Relocation
does not require running or changing `install.sh`; the old installer can overwrite
independent configuration such as Codex's, so do not use it for this migration.

Manage portable storage exports in `env/tool-storage.sh`. Machine-specific paths
belong only in the untracked `$HOME/.tool-storage.env`; use
`env/tool-storage.env.example` as a guide. Source the env script from `.zshenv`
for noninteractive zsh and from `my-sh.sh` for other configured shells. This only
sets environment/PATH and does not open the SSD during ordinary shell startup.

Install `colima`, `docker` and `tiup` symlinks in `$HOME/.local/bin` pointing to
`scripts/tool-storage-run`. The launchers load the same exports themselves, so
agents and cron need not inherit an interactive shell's environment. They check
the volume filesystem, storage identity and existing data directories before
invoking the internal CLI binaries. Missing/wrong storage fails without creating
an internal fallback. Directly invoking a vendor binary bypasses these checks.

Storage layout: `ToolCache/Colima/Home` (VM/config/image and volume disk),
`ToolCache/Colima/Cache` (downloads), and `ToolCache/TiUP` (components and state).
Move data only while writers are stopped, retain verified recovery archives,
and use compatibility symlinks for old default paths rather than second copies.
Keep the TiUP executable in `$HOME/.local/libexec/tiup`; point the SSD's
`TiUP/bin/tiup` at the guarded launcher. Docker client auth/config stays internal.
On macOS, Lima's cache path is fixed: link `$HOME/Library/Caches/lima` to
`ToolCache/Colima/Cache/Lima`, and the default Colima cache path to
`ToolCache/Colima/Cache`, so vendor tools without inherited exports also use SSD.
Bind-mounted project directories must also be mounted into the Colima VM.

Before rollback, snapshot **current** data first. Move current state back or
compare recovery archives in a new staging directory; never extract an old
archive over newer images, histories or working-tree changes.

## Usage

1. Choose your preferable shell to use - so far only `zsh` and `bash` are supported.
2. Install the enhancement for shell - `oh-my-zsh` for `zsh` and `bash-it` for `bash`.
3. Choose your domain - it could be `goron`, `zora`, etc.
4. Install `my-sh` by running:

    ```install.sh <shell> <domain>```
