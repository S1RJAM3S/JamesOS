log() {
	local timestamp
	printf -v timestamp '%(%Y-%m-%d %H:%M:%S)T' -1
	echo "[$timestamp] $*" >> "$SIRJAMES_INSTALL_LOG"
}

run_logged() {
	local script="$1"
	export CURR_SCRIPT="$script"

	log "START: $script"
	bash "$script" </dev/null >> "$SIRJAMES_INSTALL_LOG" 2>&1

	local exit_code=$?

	if (( exit_code == 0 )); then
		log "COMPLETED: $script"
	else
		log "FAILED: $script (EXIT CODE: $exit_code)" >> "$SIRJAMES_INSTALL_LOG"
	fi

	return $exit_code
}
