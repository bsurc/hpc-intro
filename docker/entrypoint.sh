#!/usr/bin/env bash
set -euo pipefail

require_config() {
  if [[ -z "${HPC_JEKYLL_CONFIG:-}" ]]; then
    echo "ERROR: HPC_JEKYLL_CONFIG is not set."
    echo "Set it to a snippet config path (see _includes/snippets_library/.../_config_options.yml)."
    exit 2
  fi
  export HPC_JEKYLL_CONFIG
}

case "${1:-help}" in
  serve)
    require_config
    if [[ -f Gemfile ]]; then bundle install; fi
    exec bundle exec jekyll serve \
      --host 0.0.0.0 --port "${PORT:-4000}" \
      --livereload --livereload-port "${LR_PORT:-35729}"
    ;;

  build)
    require_config
    if [[ -f Gemfile ]]; then bundle install; fi
    exec bundle exec jekyll build -d "${DEST:-/work/_site}"
    ;;

  pr)
    require_config
    : "${PR:?Set PR=<number> to build a pull request}"
    : "${REPO_URL:?Set REPO_URL to the git URL of the repo}"
    SRC="${SRC_DIR:-/tmp/src}"
    rm -rf "$SRC"
    echo "Cloning $REPO_URL ..."
    git clone --depth=1 "$REPO_URL" "$SRC"
    cd "$SRC"
    echo "Fetching PR #$PR ..."
    git fetch origin "pull/${PR}/head:pr-${PR}"
    git checkout "pr-${PR}"
    bundle install
    bundle exec jekyll build -d "/output/pr-${PR}"
    echo "Built PR #$PR to /output/pr-${PR}"
    ;;

  pr-serve)
    require_config
    : "${PR:?Set PR=<number> to serve a pull request}"
    : "${REPO_URL:?Set REPO_URL to the git URL of the repo}"
    PORT="${PORT:-4000}"
    LR_PORT="${LR_PORT:-35729}"
    SRC="${SRC_DIR:-/tmp/src}"
    rm -rf "$SRC"
    echo "Cloning $REPO_URL ..."
    git clone --depth=1 "$REPO_URL" "$SRC"
    cd "$SRC"
    echo "Fetching PR #$PR ..."
    git fetch origin "pull/${PR}/head:pr-${PR}"
    git checkout "pr-${PR}"
    bundle install
    exec bundle exec jekyll serve \
      --host 0.0.0.0 --port "$PORT" \
      --livereload --livereload-port "$LR_PORT"
    ;;

  help|--help|-h)
    cat <<'EOF'
Usage: entrypoint.sh [serve|build|pr]

  serve  - bundle install and run `jekyll serve` (ports 4000 & 35729 exposed)
  build  - bundle install and run `jekyll build` into /work/_site (or DEST)
  pr     - clone upstream repo, checkout PR=<num>, and build to /output/pr-<num>

Env:
  HPC_JEKYLL_CONFIG   REQUIRED: path to _config_options.yml from snippets library
  PR                  For 'pr' command, PR number to build
  REPO_URL            For 'pr' command, git URL (defaults set in compose)
  DEST                Build destination (default varies by command)
EOF
    ;;

  *)
    echo "Unknown command: $1"; exit 1;;
esac

