export LC_ALL=en_US.UTF-8

# CUDA is opt-in; installation paths are local environment settings, not Git data.
if [ -n "${CUDA_HOME:-}" ]; then
    export PATH="${CUDA_HOME}/bin:${CUDA_HOME}/nsight-compute-2020.2.0:${PATH}"
    export LD_LIBRARY_PATH="${CUDA_HOME}/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
fi

# Scratch
export SCRATCH="${SCRATCH:-${HOME}/scratch}"

# OpenClaw: one internal control checkout; project storage follows the dev root.
export BUNKLAW_HOME="${BUNKLAW_HOME:-${HOME}/agents/bunklaw}"
export BUNKLAW_PROJECT_ROOT="${BUNKLAW_PROJECT_ROOT:-${HOME}/dev/agent-work/openclaw}"
export OPENCLAW_CONFIG_PATH="${BUNKLAW_HOME}/openclaw.json"

# Heavy tool data is configured locally; launchers reject unavailable storage.
if [ -f "${MY_SH_HOME:-$HOME/my-sh}/env/tool-storage.sh" ]; then
    . "${MY_SH_HOME:-$HOME/my-sh}/env/tool-storage.sh"
fi

# Hermes
export HERMES_HOME="$HOME/dev/slimherles"
