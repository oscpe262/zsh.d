    BULLETTRAIN_CONTEXT_FG="black"
    BULLETTRAIN_CONTEXT_BG="229"
    BULLETTRAIN_IS_SSH_CLIENT="true"
    BULLETTRAIN_PROMPT_SEPARATE_LINE="false"
    BULLETTRAIN_STATUS_EXIT_SHOW="true"
    BULLETTRAIN_STATUS_BG="black"
    BULLETTRAIN_STATUS_ERROR_BG="red"
    BULLETTRAIN_STATUS_FG="black"
    BULLETTRAIN_TIME_SHOW="false"
    BULLETTRAIN_TIME_BG="white"
    BULLETTRAIN_TIME_FG="black"
    BULLETTRAIN_PROMPT_ADD_NEWLINE="false"
    BULLETTRAIN_DIR_BG="$BULLETTRAIN_CONTEXT_BG"
    BULLETTRAIN_DIR_FG="$BULLETTRAIN_CONTEXT_FG"
    BULLETTRAIN_DIR_CONTEXT_SHOW="false" #show user and machine in SCP format
    BULLETTRAIN_DIR_EXTENDED="2"
    BULLETTRAIN_GIT_COLORIZE_DIRTY="true"
    BULLETTRAIN_GIT_COLORIZE_DIRTY_BG_COLOR="black"
    BULLETTRAIN_GIT_COLORIZE_DIRTY_FG_COLOR="yellow"
    BULLETTRAIN_GIT_BG="black"
    BULLETTRAIN_GIT_FG="green"    
    BULLETTRAIN_CONTEXT_SHOW="false"
    BULLETTRAIN_EXEC_TIME_SHOW="false"
    BULLETTRAIN_CUSTOM_MSG=
    BULLETTRAIN_CUSTOM_BG="$BULLETTRAIN_CONTEXT_BG"
    BULLETTRAIN_CUSTOM_FG="$BULLETTRAIN_CONTEXT_FG"
    prompt_hostn(){prompt_segment $BULLETTRAIN_CONTEXT_BG $BULLETTRAIN_CONTEXT_FG $HOST}
    prompt_user(){prompt_segment $BULLETTRAIN_CONTEXT_FG $BULLETTRAIN_CONTEXT_BG $USER}
    BULLETTRAIN_PROMPT_ORDER=(
	time
#	custom
	hostn
	user
	custom
	git
	status
	context
	dir
	cmd_exec_time
    )
