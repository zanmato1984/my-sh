# Source from shell startup or the tool launchers. No storage access at startup.
if [ -f "${TOOL_STORAGE_ENV:-$HOME/.tool-storage.env}" ]; then
    . "${TOOL_STORAGE_ENV:-$HOME/.tool-storage.env}"
fi

if [ -n "${TOOL_STORAGE_ROOT:-}" ]; then
    export COLIMA_HOME="$TOOL_STORAGE_ROOT/Colima/Home"
    export COLIMA_CACHE_HOME="$TOOL_STORAGE_ROOT/Colima/Cache"
    export LIMA_HOME="$COLIMA_HOME/_lima"
    export TIUP_HOME="$TOOL_STORAGE_ROOT/TiUP"
fi

case "$PATH" in
    "$HOME/.local/bin"|"$HOME/.local/bin":*) ;;
    *) export PATH="$HOME/.local/bin:$PATH" ;;
esac
