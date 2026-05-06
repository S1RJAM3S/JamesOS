if ! command -v gum &>/dev/null; then
	pkg-install gum
fi

export GUM_CONFIRM_PROMPT_FOREGROUND="6"
export GUM_CONFIRM_SELECTED_FOREGROUND="0"
export GUM_CONFIRM_SELECTED_BACKGROUND="2"
export GUM_CONFIRM_UNSELECTED_FOREGROUND="7"
export GUM_CONFIRM_UNSELECTED_BACKGROUND="0"

clear_screen() {
	printf "\033[H\033[2J\033[3J"
}
