#!/bin/bash

##=Category: Constants | _KIT_VERSION
##=Description
##		Defined KIT_VERSION current version
__BASH_KIT_VERSION=1.10

##=Category: Constants | _SHELL
##=Description
##		Defined kit shell ksh or bash
export __KIT_SHELL="BASH"
##=Category: Constants | __TRUE
##=Description
##		Defined __TRUE constant that equal to 0
__TRUE=0

##=Category: Constants | __FALSE
##=Description
##		Defined __FALSE constant that equal to 1
__FALSE=1

##=Category: Constants | __EXIT_STATUS_SUCCESS
##=Description
##		Defined __EXIT_STATUS_SUCCESS constant that equal to 0
typeset -r __EXIT_STATUS_SUCCESS=0

##=Category: Constants | __EXIT_STATUS_FAILED
##=Description
##		Defined __EXIT_STATUS_FAILED constant that equal to 1
typeset -r __EXIT_STATUS_FAILED=1

##=Category: Constants | __EXIT_STATUS_WRONG_FUNCTION_USE
##=Description
##		Defined __EXIT_STATUS_WRONG_FUNCTION_USE constant that equal to 2
typeset -r __EXIT_STATUS_WRONG_FUNCTION_USE=2

##=Category: Constants | __EXIT_STATUS_FILE_NOT_FOUND
##=Description
##		Defined __EXIT_STATUS_FILE_NOT_FOUND constant that equal to 10
typeset -r __EXIT_STATUS_FILE_NOT_FOUND=10

##=Category: Constants | __EXIT_STATUS_FAILED_TO_CREATE_FILE
##=Description
##		Defined __EXIT_STATUS_FAILED_TO_CREATE_FILE constant that equal to 11
typeset -r __EXIT_STATUS_FAILED_TO_CREATE_FILE=11

##=Category: Constants | __EXIT_STATUS_FAILED_WRITE_TO_FILE
##=Description
##		Defined __EXIT_STATUS_FAILED_WRITE_TO_FILE constant that equal to 12
typeset -r __EXIT_STATUS_FAILED_WRITE_TO_FILE=12

##=Category: Constants | __EXIT_STATUS_FAILED_TO_CHANGE_PERMISSION
##=Description
##		Defined __EXIT_STATUS_FAILED_TO_CHANGE_PERMISSION constant that equal to 13
typeset -r __EXIT_STATUS_FAILED_TO_CHANGE_PERMISSION=13

##=Category: Constants | __EXIT_STATUS_DIRECTORY_NOT_EXIST
##=Description
##		Defined __EXIT_STATUS_DIRECTORY_NOT_EXIST constant that equal to 14
typeset -r __EXIT_STATUS_DIRECTORY_NOT_EXIST=14


##=Category: Constants | __EXIT_STATUS_FAILED_TO_CREATE_DIRECTORY
##=Description
##		Defined __EXIT_STATUS_FAILED_TO_CREATE_DIRECTORY constant that equal to 15
typeset -r __EXIT_STATUS_FAILED_TO_CREATE_DIRECTORY=15

##=Category: Constants | __EXIT_STATUS_DB_CONNECTION_FAILED
##=Description
##		Defined __EXIT_STATUS_DB_CONNECTION_FAILED constant that equal to 30
typeset -r __EXIT_STATUS_DB_CONNECTION_FAILED=30

##=Category: Constants | __EXIT_STATUS_SQL_ERROR
##=Description
##		Defined __EXIT_STATUS_SQL_ERROR constant that equal to 31
typeset -r __EXIT_STATUS_SQL_ERROR=31

##=Category: Constants | __EXIT_STATUS_DB_ROW_NOT_EXIST
##=Description
##		Defined __EXIT_STATUS_DB_ROW_NOT_EXIST constant that equal to 32
typeset -r __EXIT_STATUS_DB_ROW_NOT_EXIST=32

##=Category: Constants | __EXIT_STATUS_DB_COLUMN_NOT_EXIST
##=Description
##		Defined __EXIT_STATUS_DB_COLUMN_NOT_EXIST constant that equal to 33
typeset -r __EXIT_STATUS_DB_COLUMN_NOT_EXIST=33

##=Category: Variables | __SCRIPTNAME
##=Description
##		Name of the parent script
##=Note
##  If script didn't get the parameter the default value is NOT_DEFINED
typeset  __SCRIPTNAME="NOT_DEFINED"
if [[ -n "$1" ]] 
then
	__SCRIPTNAME="${1##*/}"
fi

##=Category: Variables | __SCRIPT_PATH
##=Description
##		The path of the parent script
##=Note
##  If script didn't get the parameter the default value is NOT_DEFINED
typeset  __SCRIPT_PATH="NOT_DEFINED"
if [[ -n "$1" ]] 
then
	__SCRIPT_PATH="${1}"
fi

##=Category: Variables | __LONG_USAGE_HELP 
##=Description
##	Defined the usage text 
##
##=Note
## To use variables in the help text use the variable name without
## an escape character, eg. ${OS_VERSION}
##
__LONG_USAGE_HELP='
      [??? add additional parameter here ???] 
'

##=Category: Variables | __LOG_DIRECTORY
##=Description
##  __LOG_DIRECTORY - Directory of log files
##
##=Note
##	 You can also set this environment variable before starting the script
__LOG_DIRECTORY="${__LOG_DIRECTORY:=${HOME}/logs}"

##=Category: Variables | __LOG_NAME_TYPE
##=Description
##  __LOG_NAME_TYPE - Define the script log name. Can get the below values:
##			SCRIPT_NAME_ONLY - (Default) contains the script name only.
##      UNIQUE_NAME - the log name will contain the timestamp and PID
##
##=Note
##	 You can also set this environment variable before starting the script
__LOG_NAME_TYPE="${__LOG_NAME_TYPE:=SCRIPT_NAME_ONLY}"
if [[ -z "${__LOGFILE}" && "${__LOG_NAME_TYPE}" = "UNIQUE_NAME" ]] 
then
	__LOGFILE=${__LOG_DIRECTORY}/${__SCRIPTNAME%.*}_`date +"%d-%m-%Y_%H:%M:%S"`_$$.log
fi

##=Category: Variables | __DISABLE_LOG_NAME_OVERWRITE
##=Description
##  __DISABLE_LOG_NAME_OVERWRITE - Define if the name of the log will be calculated by Kit.
##  Default value is FALSE
##
##=Note
##	 You can also set this environment variable before starting the script
__DISABLE_LOG_NAME_OVERWRITE=${__DISABLE_LOG_NAME_OVERWRITE:=$__FALSE}

##=Category: Variables | __CLEAN_LOG_FILE
##=Description
##  __CLEAN_LOG_FILE - Define if clean the log file.
##  Default value is TRUE
##
##=Note
##	 You can also set this environment variable before starting the script
__CLEAN_LOG_FILE=${__CLEAN_LOG_FILE:=$__TRUE}

##=Category: Variables |__LOGFILE
##=Description
##  __LOGFILE - fully qualified name of the logfile used
##
##=Note
##	 You can also set this environment variable before starting the script
if [[ "${__DISABLE_LOG_NAME_OVERWRITE}" -eq ${__TRUE} ]]
then
	__LOGFILE="${__LOG_DIRECTORY}/${__SCRIPTNAME%.*}.log"
else
	__LOGFILE="${__LOGFILE:=${__LOG_DIRECTORY}/${__SCRIPTNAME%.*}.log}"
fi

# -----------------------------------------------------------------------------
##=Category: Constants | __LOG_TRACE_SEVERITY
##=Description
##		Defined __LOG_TRACE_SEVERITY constant that equal to 0
__LOG_TRACE_SEVERITY=0

# -----------------------------------------------------------------------------
##=Category: Constants | __LOG_DEBUG_SEVERITY
##=Description
##		Defined __LOG_DEBUG_SEVERITY constant that equal to 1
__LOG_DEBUG_SEVERITY=1

# -----------------------------------------------------------------------------
##=Category: Constants | __LOG_INFO_SEVERITY
##=Description
##		Defined __LOG_INFO_SEVERITY constant that equal to 2
__LOG_INFO_SEVERITY=2

# -----------------------------------------------------------------------------
##=Category: Constants | __LOG_WARNING_SEVERITY
##=Description
##		Defined __LOG_WARNING_SEVERITY constant that equal to 3
__LOG_WARNING_SEVERITY=3

# -----------------------------------------------------------------------------
##=Category: Constants | __LOG_ERROR_SEVERITY
##=Description
##		Defined __LOG_ERROR_SEVERITY constant that equal to 4
__LOG_ERROR_SEVERITY=4

# -----------------------------------------------------------------------------
##=Category: Variables | __TRACE_PREFIX
##=Description
## __TRACE_PREFIX - prefix for TRACE messages
##   Default  "[TRACE] "
##=Note
##	 You can also set this environment variable before starting the script
__TRACE_PREFIX="${__TRACE_PREFIX:-[TRACE] }"

# -----------------------------------------------------------------------------
##=Category: Variables | __DEBUG_PREFIX
##=Description
## __DEBUG_PREFIX - prefix for DEBUG messages
##   Default "[DEBUG] "
##=Note
##	 You can also set this environment variable before starting the script
__DEBUG_PREFIX="${__DEBUG_PREFIX:-[DEBUG] }"

# -----------------------------------------------------------------------------
##=Category: Variables | __INFO_PREFIX
##=Description
## __INFO_PREFIX - prefix for INFO messages
##   Default "[INFO] "
##
##=Note
##	 You can also set this environment variable before starting the script
__INFO_PREFIX="${__INFO_PREFIX:-[INFO ] }"

# -----------------------------------------------------------------------------
##=Category: Variables | __WARNING_PREFIX
##=Description
## __WARNING_PREFIX - prefix for WARNING messages 
##   Default "[WARNING] "
##=Note
##	 You can also set this environment variable before starting the script
__WARNING_PREFIX="${__WARNING_PREFIX:-[WARN ] }"

# -----------------------------------------------------------------------------
##=Category: Variables | __ERROR_PREFIX
##=Description
## __ERROR_PREFIX - prefix for ERROR messages 
##   Default "[ERROR] "
##=Note
##	 You can also set this environment variable before starting the script
__ERROR_PREFIX="${__ERROR_PREFIX:-[ERROR] }"

# -----------------------------------------------------------------------------
##=Category: Variables | __LOG_SEVERITY
##=Description
## __LOG_SEVERITY - defined the default log severity 
## Default Debug severity
##=Note
##	 You can also set this environment variable before starting the script
##
__LOG_SEVERITY=${__LOG_SEVERITY:=${__LOG_DEBUG_SEVERITY}}

# -----------------------------------------------------------------------------
##=Category: Variables | __SCREEN_LOG_SEVERITY
##=Description
## __SCREEN_LOG_SEVERITY - defined the default screen message severity 
## Default the same as log severity
##=Note
##	 You can also set this environment variable before starting the script
##
__SCREEN_LOG_SEVERITY=${__SCREEN_LOG_SEVERITY:=${__LOG_SEVERITY}}

# -----------------------------------------------------------------------------
##=Category: Variables | __KIT_LOG_SEVERITY
##=Description
## __KIT_LOG_SEVERITY - defined the default ksh kit message severity 
## Default Debug severity
##=Note
##	 You can also set this environment variable before starting the script
##
__KIT_LOG_SEVERITY=${__KIT_LOG_SEVERITY:=${__LOG_TRACE_SEVERITY}}

# -----------------------------------------------------------------------------
##=Category: Variables | __LOG_HTML_MODE
##=Description
## __LOG_HTML_MODE - define if the log will be in html format.
## Default is false ( no html mode )
##=Note
##	 You can also set this environment variable before starting the script
##
__LOG_HTML_MODE=${__LOG_HTML_MODE:=${__FALSE}}

# -----------------------------------------------------------------------------
##=Category: Variables | __HTML_START_LINE_DELIMETER
##=Description
## __HTML_START_LINE_DELIMETER - define the html start line delimiter string.
## Default is empty string
##=Note
##	 You can also set this environment variable before starting the script
##
__HTML_START_LINE_DELIMETER=${__HTML_START_LINE_DELIMETER:=""}

# -----------------------------------------------------------------------------
##=Category: Variables | __HTML_END_LINE_DELIMETER
##=Description
## __HTML_END_LINE_DELIMETER - define the html end line delimiter string.
## Default is <br/>
##=Note
##	 You can also set this environment variable before starting the script
##
__HTML_END_LINE_DELIMETER=${__HTML_END_LINE_DELIMETER:="<br/>"}

##=Category: Variables | __LOG_HEADER_CHARACTER
##=Description
## __LOG_HEADER_CHARACTER - define the charcter of header border
##	Default - "#"
##
##=Note
##	 You can also set this environment variable before starting the script
##
__LOG_HEADER_CHARACTER=${__LOG_HEADER_CHARACTER:='#'}

##=Category: Variables | __LOG_HEADER_PADDING_SIZE
##=Description
## __LOG_HEADER_PADDING_SIZE - define the padding from the left and right border.
##	Default - 5 characters
##
##=Note
##	 You can also set this environment variable before starting the script
##
__LOG_HEADER_PADDING_SIZE=${__LOG_HEADER_PADDING_SIZE:=5}
	
##=Category: Variables | __LOG_EMPTY_LINE_BEFORE_HEADER
##=Description
## __LOG_EMPTY_LINE_BEFORE_HEADER - define if print the empty line before header message.
##	Default - TRUE
##
##=Note
##	 You can also set this environment variable before starting the script
##
__LOG_EMPTY_LINE_BEFORE_HEADER=${__LOG_EMPTY_LINE_BEFORE_HEADER:=${__TRUE}}

##=Category: Variables | __LOG_EMPTY_LINE_AFTER_HEADER
##=Description
## __LOG_EMPTY_LINE_AFTER_HEADER - define if print the empty line after header message.
##	Default - FALSE
##
##=Note
##	 You can also set this environment variable before starting the script
##
__LOG_EMPTY_LINE_AFTER_HEADER=${__LOG_EMPTY_LINE_AFTER_HEADER:=${__FALSE}}

##=Category: Variables | __EXIT_ON_FAILED
##=Description
## __EXIT_ON_FAILED - define if the script will be exit immediate if any error occur in the KSH Kit functions.
##	Default - FALSE
##
##=Note
##	 You can also set this environment variable before starting the script
##
__EXIT_ON_FAILED=${__EXIT_ON_FAILED:=${__FALSE}}

##=Category: Variables | __PRINT_TIME_STAMP
##=Description
## __PRINT_TIME_STAMP - if equal to __TRUE than, the time stamp will append to the message.
##	Default - TRUE
##
##=Note
##	 You can also set this environment variable before starting the script
##
__PRINT_TIME_STAMP=${__PRINT_TIME_STAMP:=${__TRUE}}

##=Category: Variables | __TIME_STAMP_FORMAT
##=Description
## __TIME_STAMP_FORMAT - define the time stamp format. For more details see man date
##	Default - %d/%m/%Y %H:%M:%S
##
##=Note
##	 You can also set this environment variable before starting the script
##
__TIME_STAMP_FORMAT=${__TIME_STAMP_FORMAT:="%d/%m/%Y %H:%M:%S"}

##=Category: Variables | __DELETE_OLD_CHANGED_LOG_FILE
##=Description
## __DELETE_OLD_CHANGED_LOG_FILE - define if the old log file will be deleted via change log file function.
##	Default - \${__TRUE}
##
##=Note
##	 You can also set this environment variable before starting the script
##
__DELETE_OLD_CHANGED_LOG_FILE=${__DELETE_OLD_CHANGED_LOG_FILE:=${__TRUE}}


##=Category: Variables | __OVERWRITE
##=Description
## __OVERWRITE mode - overwrite existing files or not 
## Default - False
##
##=Note
##	 You can also set this environment variable before starting the script
##
__OVERWRITE_MODE=${__OVERWRITE_MODE:=${__FALSE}}


##=Category: Variables | __QUIET_MODE
##=Description
## __QUIET_MODE - do not print messages to STDOUT 
##	Default - False
##
##=Note
##	 You can also set this environment variable before starting the script
##
__QUIET_MODE=${__QUIET_MODE:=${__FALSE}}

##=Category: Variables | __LOG_QUIET_MODE
##=Description
## __LOG_QUIET_MODE - do not print messages to the log 
##	Default - False
##
##=Note
##	 You can also set this environment variable before starting the script
##
__LOG_QUIET_MODE=${__LOG_QUIET_MODE:=${__FALSE}}

##=Category: Variables | __APPEND_OLD_LOG_FILE_TO_NEW
##=Description
## __APPEND_OLD_LOG_FILE_TO_NEW - append the old log file to the new file when change the log file name. 
##	Default - True
##
##=Note
##	 You can also set this environment variable before starting the script
##
__APPEND_OLD_LOG_FILE_TO_NEW=${__APPEND_OLD_LOG_FILE_TO_NEW:=${__TRUE}}

function __Exit_On_Failed_Flag
{
	typeset __FUNCTION="__Exit_On_Failed_Flag"; ${__FUNCTION_INIT} ; ${__DEBUG_CODE}
	
	if [[ "${__EXIT_ON_FAILED}" = "${__TRUE}" ]] 
	then
		
		if [[ $# -ne 2 && $# -ne 3 ]] 
		then
			Error_Msg "Wrong usage of ${__FUNCTION} function."
			Exit ${__EXIT_STATUS_WRONG_FUNCTION_USE}
		fi
		
		typeset RC=${1}
		typeset FUNCTION_NAME="$2"
		typeset ERROR_MESSAGE="$3"
		if [[ "${RC}" != "${__EXIT_STATUS_SUCCESS}" ]] 
		then
			Error_Msg "The ${FUNCTION_NAME} function finished with error. ${ERROR_MESSAGE}. Exit because the __EXIT_ON_FAILED variable is true."
			Exit "${RC}"
		fi
	fi
	
	return ${__EXIT_STATUS_SUCCESS}
}

# -----------------------------------------------------------------------------
##=Category: Flow Control | Exit_If_Failed
## 
##=Usage: Exit_If_Failed exit_status [message]
##
##=Input Parameters
##=Parameter: exit_status - the exit status to check
##=Parameter: message (optional) - message to print
##=Description
##		execute exit if exit_status is not 0 and print a message
##    
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success 
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## # Exit from script if ls command failed
## ls /tmp
## Exit_If_Failed $?
## ...
function Exit_If_Failed
{
	typeset __FUNCTION="Exit_If_Failed";    ${__FUNCTION_INIT} ; ${__DEBUG_CODE}
	
	if [[ $# -lt 1 ]] 
	then
		Error_Msg Wrong usage of ${__FUNCTION} function
		exit ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	__PRE_EXIT_FUNCTION=${__PRE_EXIT_FUNCTION:-""}
	typeset THISRC=${__EXIT_STATUS_SUCCESS}
	typeset RC=${1}
	shift
	typeset MESSAGE=$*
	
	isNumber ${RC}
	THISRC=$?
	if [[ ${THISRC} -ne 0 ]] 
	then
		Error_Msg "The exit status [${RC}] is not number."
		eval ${__PRE_EXIT_FUNCTION}
		Script_Finalization
		exit ${__EXIT_STATUS_FAILED}
	fi
	
	if [[ "${RC}" != "0" ]] 
	then
		if [[ -n "${MESSAGE}" ]] 
		then
			Error_Msg ${MESSAGE}
		fi
		eval ${__PRE_EXIT_FUNCTION}
		Script_Finalization
		exit ${RC}
	fi
	
	return ${THISRC}
}

# -----------------------------------------------------------------------------
##=Category: Logging | Print_Kit_Msg
##
##=Usage: Print_Kit_Msg message
## 
##=Input Parameters
##=Parameter: message - message to print
##
##=Description
##		print a ksh kit message to STDOUT and write it also to the logfile
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Print_Kit_Msg add this line to log
## ...
function Print_Kit_Msg {
	typeset __FUNCTION="Print_Kit_Msg";    ${__FUNCTION_INIT} ; ${__DEBUG_CODE}

	if [[ $# -lt 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	typeset THISRC=${__EXIT_STATUS_SUCCESS}
	typeset THISMSG="$*"
	
	Print_Severity_Msg ${__KIT_LOG_SEVERITY} "$*"
	typeset THISRC=$?
	
	__Exit_On_Failed_Flag ${THISRC} "${__FUNCTION}"
	return ${THISRC}
}

# -----------------------------------------------------------------------------
##=Category: String and Number | Check_Variable_Not_Empty
## 
##=Usage: Check_Variable_Not_Empty variable_name
##
##=Input Parameters
##=Parameter: variable_name - the variable name to check
##
##=Description
##		checking if variable is empty
##    
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: __EXIT_STATUS_FAILED - Variable is empty
##
##=Example
## ...
## # Check if ABP_MARKET_ID variable is empty
## Check_Variable_Not_Empty ABP_MARKET_ID
## ...
function Check_Variable_Not_Empty
{
	typeset __FUNCTION="Check_Variable_Not_Empty";    ${__FUNCTION_INIT} ; ${__DEBUG_CODE}
	
	if [[ $# -ne 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset VARIABLE_NAME=${1}
	typeset VARIABLE_VALUE=`eval echo '$'${VARIABLE_NAME}`
	typeset THISRC=${__EXIT_STATUS_SUCCESS}
	
	if [[ -z ${VARIABLE_VALUE} ]] 
	then
		Debug_Msg "Variable ${VARIABLE_NAME} is empty"
		THISRC=${__EXIT_STATUS_FAILED}
	else 
		Debug_Msg "Variable ${VARIABLE_NAME}=${VARIABLE_VALUE}"
	fi
		
	return ${THISRC}
}

# -----------------------------------------------------------------------------

##=Category: Flow Control | Return_If_Failed
## 
##=Usage: eval `Return_If_Failed return_status message`
##
##=Input Parameters
##=Parameter: return_status - the exit status to check
##=Parameter: message - (optional) to print
##=Description
##		print return command to STDOUT if return_status is not 0 and add a message to log
##    
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success 
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## # return from function if ls command failed
## ls /tmp
## eval `Return_If_Failed $? Failed to do ls command`
## ...
function Return_If_Failed
{
	typeset __FUNCTION="Return_If_Failed";    ${__FUNCTION_INIT} ; ${__DEBUG_CODE}
	
	if [[ $# -lt 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		echo return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset THISRC=${__EXIT_STATUS_SUCCESS}
	typeset RC=${1}
	shift
	typeset MESSAGE=$*
	
	isNumber ${RC}
	THISRC=$?
	if [[ ${THISRC} -ne ${__EXIT_STATUS_SUCCESS} ]] 
	then
		Error_Msg The exit status "<${RC}>" is not number
		echo return ${__EXIT_STATUS_FAILED}
		__Exit_On_Failed_Flag ${__EXIT_STATUS_FAILED} "${__FUNCTION}"
		return ${__EXIT_STATUS_FAILED}
	fi
	
	if [[ "${RC}" != "0" ]] 
	then
		if [[ -n "${MESSAGE}" ]] 
		then
			Error_Msg ${MESSAGE}
		fi
		echo "return ${RC}"
		__Exit_On_Failed_Flag ${RC} "${__FUNCTION}"
		return ${RC}
	fi
	
	return ${__EXIT_STATUS_SUCCESS}
}

# -----------------------------------------------------------------------------
##=Category: String and Number | isNumber
##
##=Usage: isNumber testValue
## 
##=Description
##		check if a value is an integer
##
##=Input Parameters
##=Parameter: testValue (mandatory) - parameter that we want to test
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - testValue is a number
##=Exit Status: __EXIT_STATUS_FAILED - testValue is not a number
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Function Exported Variables
##=Exported Variable: __ARITMETICAL_NUMBER_PRESENTATION - arithmetical number presentation. ( without + sign )
##
##=Example
## ...
## read INPUT_DATA
## isNumber ${INPUT_DATA}
## ...
function isNumber {
  typeset __FUNCTION="isNumber";    ${__FUNCTION_INIT} ; ${__DEBUG_CODE}
	typeset -F ARITMETICAL_PRESENTATION;
	
	if [[ $# -ne 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset NUMBER_TO_TEST=$1
	echo ${NUMBER_TO_TEST} | egrep "^[-+]?([0-9]+)(\.[0-9]+)?$" >/dev/null 2>&1
	 
	if [[ $? -eq 0 ]] 
	then
		ARITMETICAL_PRESENTATION=${NUMBER_TO_TEST}
		__ARITMETICAL_NUMBER_PRESENTATION=${ARITMETICAL_PRESENTATION}
		return ${__EXIT_STATUS_SUCCESS}
	else
		return ${__EXIT_STATUS_FAILED}
	fi
}

# -----------------------------------------------------------------------------
##=Category: Working with Files and Directories | INI_File_Parser
##
##=Usage: INI_File_Parser ini_file section [prefix]
## 
##=Description
##		Read the ini configuration file and define all the variables under specific section.
## 
##=Input Parameters
##=Parameter: ini_file - the ini configuration file.
##=Parameter: section - the section name.
##=Parameter: prefix  - Optional. The prefix for created variables. Default value is empty.
##     
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: __EXIT_STATUS_FAILED - Failed
##=Exit Status: __EXIT_STATUS_FILE_NOT_FOUND - File not found
##
##=Function Exported Variables
##=Exported Variable: variables - all variable in the specific block
##
##=Example
## 	...
## 	INI_File_Parser my_file.ini GLOBAL
## 	...
##
function INI_File_Parser
{
	typeset __FUNCTION="INI_File_Parser";

	# checking function parameters
	if [[ $# -lt 2 || $# -gt 3 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset INI_FILE="$1"
	typeset SECTION_NAME="$2"
	typeset OPTIONAL_PREFIX="$3"
	typeset IS_REQUEST_SECTION_EXIST=${__FALSE}
	
	Check_File_Exist ${INI_FILE}
	if [[ ${__EXIT_STATUS_SUCCESS} -ne $? ]]
	then
		Error_Msg "The INI file ${INI_FILE} is not exists"
		__Exit_On_Failed_Flag ${__EXIT_STATUS_FILE_NOT_FOUND} "${__FUNCTION}"
		return ${__EXIT_STATUS_FILE_NOT_FOUND}
	fi
	
	Create_Temp_File
	typeset INI_TEMP_FILE=${__TEMP_FILE}

	if [[ $? -ne ${__EXIT_STATUS_SUCCESS} ]]
	then
		Error_Msg "Failed to get the list of all inherit files."

		return ${__EXIT_STATUS_FAILED}
	fi
	
	typeset NUMBER_OF_SECTIONS=`grep "^\[${SECTION_NAME}\]" ${INI_FILE} |wc -l`
	if [[ ${NUMBER_OF_SECTIONS} -gt 1 ]]
	then
		Error_Msg "There section [${SECTION_NAME}] appears more than once inside INI file [${INI_FILE}]"
		return ${__EXIT_STATUS_FAILED}
	fi
	if [[ ${NUMBER_OF_SECTIONS} -eq 1 ]] 
	then
		awk '/^\['${SECTION_NAME}'\]/ {block_flag=1; next} /^\[/ {block_flag=0} block_flag==1 && !/^[\t ]*$/ && !/^[ 	]*#/' ${INI_FILE} >> ${INI_TEMP_FILE}
		IS_REQUEST_SECTION_EXIST=${__TRUE}
	fi
	
	if [[ ${IS_REQUEST_SECTION_EXIST} -eq ${__FALSE} ]]
	then
		Error_Msg "There are no section ${SECTION_NAME} in INI file ${INI_FILE} or inheritance ini."
		return ${__EXIT_STATUS_FAILED}
	fi
	
	while read LINE
	do

		if [[ ! `echo ${LINE} | grep "="` ]]; then
			continue
		fi

		if [[ `echo ${LINE} | grep -c "^[ 	]*="` -gt 0 ]]
		then
			Warning_Msg "The line [${LINE}] is not valid inside INI file ${INI_FILE}"
			continue
		fi
		Print_Kit_Msg "Define new variable [${OPTIONAL_PREFIX}${LINE}]"
		
		`export "${OPTIONAL_PREFIX}${LINE}" 2>/dev/null` 
		
		if [[ $? -ne 0 ]] 
		then
			Error_Msg "Failed to define the variable [${OPTIONAL_PREFIX}${LINE}]"
			return ${__EXIT_STATUS_FAILED}}
		else
			export "${OPTIONAL_PREFIX}${LINE}"
		fi
	done < ${INI_TEMP_FILE}
	#delete temp file
	rm -f ${INI_TEMP_FILE}
	return ${__EXIT_STATUS_SUCCESS}
}

# -----------------------------------------------------------------------------
##=Category: Logging | Error_Msg
##
##=Usage: Error_Msg message
##
##=Input Parameters
##=Parameter: message - message to print
## 
##=Description
##		print a message with ERROR severity to STDOUT and write it also to the logfile
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Error_Msg Error message example
## ...
function Error_Msg {
	typeset __FUNCTION="Error_Msg";    ${__FUNCTION_INIT} ; ${__DEBUG_CODE}

	if [[ $# -lt 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
  
	Print_Severity_Msg ${__LOG_ERROR_SEVERITY} "$*"
	typeset THISRC=$?
	__Exit_On_Failed_Flag ${THISRC} "${__FUNCTION}"
	return ${THISRC}
}

# -----------------------------------------------------------------------------
##=Category: Logging | Print_Msg_File
##
##=Usage: Print_Msg_File file
## 
##=Input Parameters
##=Parameter: file - file location
##
##=Description
##		file context will be printed to STDOUT and added to log file
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_FILE_NOT_FOUND - File doesn't exist
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Print_Msg_File /tmp/scipt_output
## ...
function Print_Msg_File {
	typeset __FUNCTION="Print_Msg_File";

	if [[ $# -ne 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	typeset THISRC=${__EXIT_STATUS_SUCCESS}
	typeset MESSAGE_FILE=${1}
	
	if [[ -f ${MESSAGE_FILE} ]] 
	then
		[  ${__QUIET_MODE} -ne ${__TRUE} ] && cat  ${MESSAGE_FILE} 2>/dev/null
		[ ${__LOG_QUIET_MODE} -ne ${__TRUE} ] && [ -n "${__LOGFILE}" ] && [ -f "${__LOGFILE}" ] &&  cat  ${MESSAGE_FILE} >>${__LOGFILE} 2>&1
		THISRC=$?
	else
		Error_Msg "Message file ${MESSAGE_FILE} doesn't exists."
		return ${__EXIT_STATUS_FILE_NOT_FOUND}
	fi
	return ${THISRC}
}

# -----------------------------------------------------------------------------
#=Category: Logging | Print_Severity_Msg_File
#
#=Usage: Print_Severity_Msg_File severity file
# 
#=Input Parameters
#=Parameter: severity - the message severity, can be 0,1,2,3,4 ( when 0 = __LOG_TRACE_SEVERITY )
#=Parameter: file - file location
#
#=Description
#		file context will be printed to STDOUT and added to log file
#      
#=Function Exit Status
#=Exit Status: __EXIT_STATUS_SUCCESS - Success
#=Exit Status: __EXIT_STATUS_FILE_NOT_FOUND - File doesn't exist
#=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
#
#=Example
# ...
# Print_Severity_Msg_File /tmp/scipt_output
# ...
function Print_Severity_Msg_File {
	typeset __FUNCTION="Print_Severity_Msg_File"; 

	if [[ $# -ne 2 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	typeset THISRC=${__EXIT_STATUS_SUCCESS}
	typeset REQUESTED_SEVERITY="$1"
	typeset MESSAGE_FILE="$2"
	
	if [[ -f ${MESSAGE_FILE} ]] 
	then
		[ ${__QUIET_MODE} -ne ${__TRUE} ] && [ ${__SCREEN_LOG_SEVERITY} -le ${REQUESTED_SEVERITY} ] && cat "${MESSAGE_FILE}" 2>/dev/null
		[ ${__LOG_QUIET_MODE} -ne ${__TRUE} ] && [ ${__LOG_SEVERITY} -le ${REQUESTED_SEVERITY} ] && [ -n "${__LOGFILE}" ] && [ -f "${__LOGFILE}" ] &&  cat "${MESSAGE_FILE}" >>"${__LOGFILE}" 2>&1
		THISRC=$?
	else
		Error_Msg "Message file ${MESSAGE_FILE} doesn't exists."
		return ${__EXIT_STATUS_FILE_NOT_FOUND}
	fi
	return ${THISRC}
}

# -----------------------------------------------------------------------------
#=Category: Logging | Severity_Header_Msg
#
#=Usage: Severity_Header_Msg severity header_message
#
#=Input Parameters
#=Parameter: severity - the header severity, can be 0,1,2,3,4 ( when 0 = __LOG_TRACE_SEVERITY )
#=Parameter: header_message - message to print as header
# 
#=Description
#		print a header with TRACE severity to STDOUT and write it also to the logfile.
#       You can control the header behavior by below variables:
#        __LOG_HEADER_CHARACTER, __LOG_HEADER_PADDING_SIZE, 
#        __LOG_EMPTY_LINE_BEFORE_HEADER, __LOG_EMPTY_LINE_AFTER_HEADER
#      
#=Function Exit Status
#=Exit Status: __EXIT_STATUS_SUCCESS - Success
#=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
#
#=Example
# ...
# Severity_Header_Msg $__LOG_TRACE_SEVERITY "Step Started..."
# ...
function Severity_Header_Msg {
	typeset __FUNCTION="Severity_Header_Msg"; ${__FUNCTION_INIT} ; ${__DEBUG_CODE}

	if [[ $# -lt 2 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function"
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset REQUESTED_SEVERITY="$1"
	shift
	
	typeset SEVERITY_PREFIX
	case "${REQUESTED_SEVERITY}" in
		${__LOG_TRACE_SEVERITY} ) SEVERITY_PREFIX="${__TRACE_PREFIX}"
									;;
		${__LOG_DEBUG_SEVERITY} ) SEVERITY_PREFIX="${__DEBUG_PREFIX}"
									;;
		${__LOG_INFO_SEVERITY} ) SEVERITY_PREFIX="${__INFO_PREFIX}"
									;;
		${__LOG_WARNING_SEVERITY} ) SEVERITY_PREFIX="${__WARNING_PREFIX}"
									;;
		${__LOG_ERROR_SEVERITY} ) SEVERITY_PREFIX="${__ERROR_PREFIX}"
									;;
		* )	Error_Msg "Wrong usage of ${__FUNCTION} function. Wrong severity [${REQUESTED_SEVERITY}]. Can be ${__LOG_TRACE_SEVERITY} - ${__LOG_ERROR_SEVERITY}"
				__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
				return ${__EXIT_STATUS_WRONG_FUNCTION_USE}				
				;;
	esac
	typeset PADDING_STR=`printf "%0${__LOG_HEADER_PADDING_SIZE}d" | tr "0" " "`
	typeset MESSAGE_LENGTH=`echo "${__LOG_HEADER_CHARACTER}${PADDING_STR}$*${PADDING_STR}${__LOG_HEADER_CHARACTER}" | wc -c`
	MESSAGE_LENGTH=$(( ${MESSAGE_LENGTH} - 1 ))
	typeset HEADER_STRING=`printf "%0${MESSAGE_LENGTH}d" | tr "0" "${__LOG_HEADER_CHARACTER}"`
	
	if [[ ${__LOG_EMPTY_LINE_BEFORE_HEADER} -eq ${__TRUE} ]] 
	then
		Print_Severity_Msg ${REQUESTED_SEVERITY} ""
	fi
	Print_Severity_Msg ${REQUESTED_SEVERITY} "${HEADER_STRING}"
	Print_Severity_Msg ${REQUESTED_SEVERITY} "${__LOG_HEADER_CHARACTER}${PADDING_STR}$*${PADDING_STR}${__LOG_HEADER_CHARACTER}"
	Print_Severity_Msg ${REQUESTED_SEVERITY} "${HEADER_STRING}"
	typeset THISRC=$?
	if [[ ${__LOG_EMPTY_LINE_AFTER_HEADER} -eq ${__TRUE} ]] 
	then
		Print_Severity_Msg ${REQUESTED_SEVERITY} ""
		THISRC=$?
	fi
	__Exit_On_Failed_Flag ${THISRC} "${__FUNCTION}"
	return ${THISRC}
}

# -----------------------------------------------------------------------------
##=Category: Logging | Debug_Header_Msg
##
##=Usage: Debug_Header_Msg header_message
##
##=Input Parameters
##=Parameter: header_message - message to print as header
## 
##=Description
##		print a header with DEBUG severity to STDOUT and write it also to the logfile.
##      You can control the header behavior by below variables:
##        __LOG_HEADER_CHARACTER, __LOG_HEADER_PADDING_SIZE, 
##        __LOG_EMPTY_LINE_BEFORE_HEADER, __LOG_EMPTY_LINE_AFTER_HEADER
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Debug_Header_Msg "Step Started..."
## ...
function Debug_Header_Msg {
	typeset __FUNCTION="Debug_Header_Msg"; ${__FUNCTION_INIT} ; ${__DEBUG_CODE}

	if [[ $# -ne 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	Severity_Header_Msg ${__LOG_DEBUG_SEVERITY} "$*"
	typeset THISRC=$?
	__Exit_On_Failed_Flag ${THISRC} "${__FUNCTION}"
	return ${THISRC}
}

# -----------------------------------------------------------------------------
##=Category: Logging | Info_Header_Msg
##
##=Usage: Info_Header_Msg header_message
##
##=Input Parameters
##=Parameter: header_message - message to print as header
## 
##=Description
##		print a header with INFO severity to STDOUT and write it also to the logfile.
##      You can control the header behavior by below variables:
##        __LOG_HEADER_CHARACTER, __LOG_HEADER_PADDING_SIZE, 
##        __LOG_EMPTY_LINE_BEFORE_HEADER, __LOG_EMPTY_LINE_AFTER_HEADER
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Info_Header_Msg "Step Started..."
## ...
function Info_Header_Msg {
	typeset __FUNCTION="Info_Header_Msg"; ${__FUNCTION_INIT} ; ${__DEBUG_CODE}

	if [[ $# -ne 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	Severity_Header_Msg ${__LOG_INFO_SEVERITY} "$*"
	typeset THISRC=$?
	__Exit_On_Failed_Flag ${THISRC} "${__FUNCTION}"
	return ${THISRC}
}

# -----------------------------------------------------------------------------
##=Category: Logging | Warning_Header_Msg
##
##=Usage: Warning_Header_Msg header_message
##
##=Input Parameters
##=Parameter: header_message - message to print as header
## 
##=Description
##		print a header with WARNING severity to STDOUT and write it also to the logfile.
##      You can control the header behavior by below variables:
##        __LOG_HEADER_CHARACTER, __LOG_HEADER_PADDING_SIZE, 
##        __LOG_EMPTY_LINE_BEFORE_HEADER, __LOG_EMPTY_LINE_AFTER_HEADER
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Warning_Header_Msg "Step Started..."
## ...
function Warning_Header_Msg {
	typeset __FUNCTION="Warning_Header_Msg"; ${__FUNCTION_INIT} ; ${__DEBUG_CODE}

	if [[ $# -ne 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	Severity_Header_Msg ${__LOG_WARNING_SEVERITY} "$*"
	typeset THISRC=$?
	__Exit_On_Failed_Flag ${THISRC} "${__FUNCTION}"
	return ${THISRC}
}
# -----------------------------------------------------------------------------
##=Category: Logging | Error_Header_Msg
##
##=Usage: Error_Header_Msg header_message
##
##=Input Parameters
##=Parameter: header_message - message to print as header
## 
##=Description
##		print a header with ERROR severity to STDOUT and write it also to the logfile.
##      You can control the header behavior by below variables:
##        __LOG_HEADER_CHARACTER, __LOG_HEADER_PADDING_SIZE, 
##        __LOG_EMPTY_LINE_BEFORE_HEADER, __LOG_EMPTY_LINE_AFTER_HEADER
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Error_Header_Msg "Step Started..."
## ...
function Error_Header_Msg {
	typeset __FUNCTION="Error_Header_Msg"; ${__FUNCTION_INIT} ; ${__DEBUG_CODE}

	if [[ $# -ne 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	Severity_Header_Msg ${__LOG_ERROR_SEVERITY} "$*"
	typeset THISRC=$?
	__Exit_On_Failed_Flag ${THISRC} "${__FUNCTION}"
	return ${THISRC}
}


# -----------------------------------------------------------------------------
##=Category: Logging | Info_Msg
## 
##=Usage: Info_Msg message
##
##=Input Parameters
##=Parameter: message - message to print
## 
##=Description
##		print a message with INFO severity to STDOUT and write it also to the logfile
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Info_Msg Info message example
## ...
function Info_Msg {
	typeset __FUNCTION="Info_Msg";    ${__FUNCTION_INIT} ; ${__DEBUG_CODE}

	if [[ $# -lt 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
  
	Print_Severity_Msg ${__LOG_INFO_SEVERITY} "$*"
	typeset THISRC=$?
	__Exit_On_Failed_Flag ${THISRC} "${__FUNCTION}"
	return ${THISRC}
}
# -----------------------------------------------------------------------------
##=Category: Logging | Debug_Msg
##
##=Usage: Debug_Msg message
##
##=Input Parameters
##=Parameter: message - message to print
## 
##=Description
##		print a message with DEBUG severity to STDOUT and write it also to the logfile
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Debug_Msg Debug message example
## ...
function Debug_Msg {
	typeset __FUNCTION="Debug_Msg";
	
	if [[ $# -lt 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
  
	Print_Severity_Msg ${__LOG_DEBUG_SEVERITY} "$*"
	typeset THISRC=$?

	return ${THISRC}
}

# -----------------------------------------------------------------------------
##=Category: Logging | Warning_Msg
## 
##=Usage: Warning_Msg message
##
##=Input Parameters
##=Parameter: message - message to print
## 
##=Description
##		print a message with WARNING severity to STDOUT and write it also to the logfile
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Warning_Msg Warining message example
## ...
function Warning_Msg {
	typeset __FUNCTION="Warning_Msg";
	if [[ $# -lt 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."

		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	Print_Severity_Msg ${__LOG_WARNING_SEVERITY} "$*"
	typeset THISRC=$?
	return ${THISRC}
}



# -----------------------------------------------------------------------------
##=Category: Variables | __TEMP_ROOT_DIR 
##=Description
##	 __TEMP_ROOT_DIR - directory for temporary files
##   The default is $TMPDIR (if defined), or $TMP (if defined), 
##   or $TEMP (if defined) or /tmp if none of the variables is defined.
##
__TEMP_ROOT_DIR="${TMPDIR:-${TMP:-${TEMP:-/tmp}}}"

# -----------------------------------------------------------------------------
##=Category: Variables | __TEMPFILE_PERMISSION   
##=Description
## Defined permission for temporary file.
## Default value 755
##
__TEMPFILE_PERMISSION=755

##=Category: Variables | __TEMPDIR_PERMISSION   
##=Description
## Defined permission for temporary directory.
## Default value 755
__TEMPDIR_PERMISSION=755

##=Category: Variables | __TEMPFILE_MAX_RETRY_NUM
##=Description
## Defined max number of rerty to create temp file.
## Default value 755
__TEMPFILE_MAX_RETRY_NUM="${__TEMPFILE_MAX_RETRY_NUM:=10}"

# -----------------------------------------------------------------------------
##=Category: Working with Files and Directories | Create_Temp_File
##
##=Usage: Create_Temp_File 
## 
##=Description
## 		Create temporary file in __TEMP_ROOT_DIR directory.
## 		The file created with __TEMPFILE_PERMISSION permission.
## 		The temporary file name will be <__SCRIPTNAME>.<Procces ID>.<Random number>
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: __EXIT_STATUS_FAILED - Failed
##
##=Function Exported Variables
##=Exported Variable: __TEMP_FILE - temporary file
##
##=Example
## ...
## Create_Temp_File
## ...
function Create_Temp_File
{
	typeset __FUNCTION="Create_Temp_File"; 

	# checking function parameters
	if [[ $# -ne 0 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset THISRC=${__EXIT_STATUS_SUCCESS}
		
	if [[ ! -d "${__TEMP_ROOT_DIR}" ]] 
	then
		Error_Msg "Temp FS ${__TEMP_ROOT_DIR} doesn't exist. Can't create temp file ${__TEMP_FILE}"
		return ${__EXIT_STATUS_FAILED}  
	fi
	
	typeset CURRENT_EXECUTION=0
	while [[ ${CURRENT_EXECUTION} -lt ${__TEMPFILE_MAX_RETRY_NUM} ]]
	do 
		__TEMP_FILE=${__TEMP_ROOT_DIR}/${__SCRIPTNAME}.$$.$( Rand )
		if [[ ! -f ${__TEMP_FILE} ]] 
		then
			CURRENT_EXECUTION=0
			break
		fi
		CURRENT_EXECUTION=$(( ${CURRENT_EXECUTION} + 1 ))
	done
	
	if [[ ${CURRENT_EXECUTION} -ne 0 ]] 
	then
		Error_Msg "Failed to create temp files [${__TEMPFILE_MAX_RETRY_NUM}] times. Each time file was already exists."
		return ${__EXIT_STATUS_FAILED}  
	fi
	
	: > ${__TEMP_FILE}
	
	THISRC=$?
	if [[ ${THISRC} -ne ${__EXIT_STATUS_SUCCESS} ]] 
	then
		Error_Msg "Failed to create temporary file ${__TEMP_FILE}"
		return ${__EXIT_STATUS_FAILED}  
	else
		Trace_Msg "Temporary ${__TEMP_FILE} file created"
		__TEMP_FILE_LIST[${#__TEMP_FILE_LIST[*]}]="${__TEMP_FILE}"
	fi
	
	chmod ${__TEMPFILE_PERMISSION} ${__TEMP_FILE} 2>/dev/null
	THISRC=$?
	if [[ ${THISRC} -ne ${__EXIT_STATUS_SUCCESS} ]] 
	then
		Error_Msg "Failed to change permission for temporary file ${__TEMP_FILE} to ${__TEMPFILE_PERMISSION}"
		return ${__EXIT_STATUS_FAILED}  
	else
		Trace_Msg "Temporary Permission change for ${__TEMP_FILE} file to ${__TEMPFILE_PERMISSION}"
	fi
	return ${THISRC}
}

##=Category: String and Number | Rand
##
##=Usage: Rand
## 
##=Description
##   print a random number to STDOUT
## 
## This function prints the contents of the environment variable RANDOM
## to STDOUT. If that variable is not defined, it uses awk to create
## a random number. If awk is not available the function prints nothing to
## STDOUT
##      
##=Function Exit Status
##=Exit Status:	0 - random number printed to STDOUT
##=Exit Status:  1 - can not create a random number
##=Example
## Rand
## ...
## MY_RAND=`Rand`

function Rand 
{
	typeset __FUNCTION="Rand";
	typeset __THISRC=${__EXIT_STATUS_FAILED}
  
	if [[ $# -ge 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	if [[ -n "${RANDOM}" ]] 
	then
		echo "${RANDOM}${RANDOM}"
		__THISRC=${__EXIT_STATUS_SUCCESS}
	elif which od >/dev/null ; 
	then
		typeset TEMP_VAR=`od -An -N2  -t uL /dev/random | sed 's/ *//'`
		echo ${TEMP_VAR}
		__THISRC=${__EXIT_STATUS_SUCCESS}
	fi
	
	return ${__THISRC}
}

# -----------------------------------------------------------------------------
##=Category: Logging | Trace_Msg
##
##=Usage: Trace_Msg message
## 
##=Input Parameters
##=Parameter: message - message to print
##
##=Description
##		print a message with TRACE severity to STDOUT and write it also to the logfile
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Trace_Msg Trace message example
## ...
function Trace_Msg {
	typeset __FUNCTION="Trace_Msg"; 

	if [[ $# -lt 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	Print_Severity_Msg ${__LOG_TRACE_SEVERITY} "$*"
	typeset THISRC=$?	
	return ${THISRC}
	}

# -----------------------------------------------------------------------------
##=Category: Logging | Print_Kit_Msg
##
##=Usage: Print_Kit_Msg message
## 
##=Input Parameters
##=Parameter: message - message to print
##
##=Description
##		print a ksh kit message to STDOUT and write it also to the logfile
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## Print_Kit_Msg add this line to log
## ...
function Print_Kit_Msg {
	typeset __FUNCTION="Print_Kit_Msg";

	if [[ $# -lt 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	typeset THISRC=${__EXIT_STATUS_SUCCESS}
	typeset THISMSG="$*"
	typeset THISRC=$?
	
	return ${THISRC}
}

##=Category: Working with Files and Directories | Check_File_Exist
## 
##=Usage: Check_File_Exist file
##
##=Input Parameters
##=Parameter: file - file to check
##
##=Description
##		Check if file exists
##    
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success 
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: __EXIT_STATUS_FILE_NOT_FOUND - File not found
##
##=Example
## ...
## Check_File_Exist ${HOME}/.local.ini
## ...
function Check_File_Exist
{
	typeset __FUNCTION="Check_File_Exist";
	
	if [[ $# -ne 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset FILE_TO_CHECK=${1}
	typeset THISRC=${__EXIT_STATUS_SUCCESS}
	if [[ -f "${FILE_TO_CHECK}" ]] 
	then
		Print_Kit_Msg "The ${FILE_TO_CHECK} file exists"
	else
		Print_Kit_Msg "The ${FILE_TO_CHECK} file doesn't exist"
		THISRC=${__EXIT_STATUS_FILE_NOT_FOUND}
	fi
	return ${THISRC}		
}


# -----------------------------------------------------------------------------
##=Category: Variables | __RUNNING_IN_SENSATIVE_MODE
##=Description
##  __RUNNING_IN_SENSATIVE_MODE - define if script running in sensative mode. 
##  If yes, the sensative data in the log will be hidden.
##  Default values is $__TRUE
##
##=Note
##	 You can also set this environment variable before starting the script
__RUNNING_IN_SENSATIVE_MODE="${__RUNNING_IN_SENSATIVE_MODE:=$__TRUE}"

# -----------------------------------------------------------------------------


##=Begin Skipped Documentation
# -----------------------------------------------------------------------------
#=Category: Logging | Print_Severity_Msg
#
#=Usage: Print_Msg severity message
# 
#=Input Parameters
#=Parameter: severity - the message severity, can be 0,1,2,3,4 ( when 0 = __LOG_TRACE_SEVERITY )
#=Parameter: message - message to print
#
#=Description
#		print a message with severity to STDOUT and write it also to the logfile
#      
#=Function Exit Status
#=Exit Status: __EXIT_STATUS_SUCCESS - Success
#=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
#
#=Example
# ...
# Print_Severity_Msg $__LOG_TRACE_SEVERITY "add this line to log"
# ...
function Print_Severity_Msg {
	typeset __FUNCTION="Print_Severity_Msg";

	if [[ $# -lt 2 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	typeset THISRC=${__EXIT_STATUS_SUCCESS}
	typeset REQUESTED_SEVERITY="$1"
	shift
	
	typeset SEVERITY_PREFIX
	case "${REQUESTED_SEVERITY}" in
		${__LOG_TRACE_SEVERITY} ) SEVERITY_PREFIX="${__TRACE_PREFIX}"
									;;
		${__LOG_DEBUG_SEVERITY} ) SEVERITY_PREFIX="${__DEBUG_PREFIX}"
									;;
		${__LOG_INFO_SEVERITY} ) SEVERITY_PREFIX="${__INFO_PREFIX}"
									;;
		${__LOG_WARNING_SEVERITY} ) SEVERITY_PREFIX="${__WARNING_PREFIX}"
									;;
		${__LOG_ERROR_SEVERITY} ) SEVERITY_PREFIX="${__ERROR_PREFIX}"
									;;
		* )	Error_Msg "Wrong usage of ${__FUNCTION} function. Wrong severity [${REQUESTED_SEVERITY}]. Can be ${__LOG_TRACE_SEVERITY} - ${__LOG_ERROR_SEVERITY}"
				return ${__EXIT_STATUS_WRONG_FUNCTION_USE}				
				;;
	esac
	
	typeset THISMSG="${SEVERITY_PREFIX}$*"
	if [[ "${__PRINT_TIME_STAMP}" = "${__TRUE}" ]] 
	then
		THISMSG="[$(date +"${__TIME_STAMP_FORMAT}")] ${THISMSG}"
	fi

	if [[ "${__LOG_HTML_MODE}" -eq ${__TRUE} ]] 
	then
		THISMSG="${__HTML_START_LINE_DELIMETER}${THISMSG}${__HTML_END_LINE_DELIMETER}"
	fi

	if [[ ${__QUIET_MODE} -ne ${__TRUE} && ${__SCREEN_LOG_SEVERITY} -le ${REQUESTED_SEVERITY} ]]
	then
		echo "${THISMSG}"
	fi 
	if [[ ${__LOG_QUIET_MODE} -ne ${__TRUE} && ${__LOG_SEVERITY} -le ${REQUESTED_SEVERITY} && -n "${__LOGFILE}" && -f "${__LOGFILE}" ]] 
	then
		echo "${THISMSG}" >>"${__LOGFILE}"
	THISRC=$?
	fi

	return ${THISRC}
}

# -----------------------------------------------------------------------------
##=Category: Working with Files and Directories | Get_File_Permission
##
##=Usage: Get_File_Permission file/directory [notation]
## 
##=Description
##		Return the file or directory permission.
##		By default the return value will be in octal notation 
## 
##=Input Parameters
##=Parameter: file/directory - the path to file or directory that you want to get permission 
##=Parameter: notation - (optional) The notation type. Can be OCTAL or SYMBOL. By default it's OCTAL 
##     
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: __EXIT_STATUS_FAILED - Failed
##=Exit Status: __EXIT_STATUS_FILE_NOT_FOUND - File not found
##
##=Function STDOUT: print the file/directory permission
##
##=Example
## 	...
##  # get permission of /etc/passwd file
## 	PERM=`Get_File_Permission /etc/passwd`
##
##	# get permission of /tmp directory in symbol mode
##	DIR_PER=`Get_File_Permission /tmp SYMBOL`
## 	...
##
function Get_File_Permission
{
	typeset __FUNCTION="Get_File_Permission"; ${__FUNCTION_INIT}; ${__DEBUG_CODE}
	
	# checking function parameters
	if [[ $# -lt 1 || $# -gt 2 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	typeset FILE_NAME="$1"
	typeset NOTATION="OCTAL"
	typeset PERMISSION=""
	typeset FINAL_PERMISSION=""
	
	if [[ -n "$2" ]] 
	then
		NOTATION="$2"
	fi
	
	if [[ "${NOTATION}" != "OCTAL" && "${NOTATION}" != "SYMBOL" ]] 
	then
		Error_Msg "Wrong notation ${NOTATION}. Can be only OCTAL or SYMBOL"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	if [[ ! -a "${FILE_NAME}" ]] 
	then
		Error_Msg "The ${FILE_NAME} doesn't exist."
		return ${__EXIT_STATUS_FILE_NOT_FOUND}
	fi
	
	PERMISSION=`ls -Lld "${FILE_NAME}" | awk '{ print $1}' | cut -c2-`
	if [[ "OCTAL" = "${NOTATION}" ]] 
	then
		PERMISSION="000${PERMISSION}"
		PERMISSION=`echo ${PERMISSION} | sed -e 's/-/0/g' -e 's/r/4/g' -e 's/w/2/g' -e 's/x/1/g'`
		PERMISSION=`echo ${PERMISSION} | sed 's/^.\(....\)s/4\11/'`
		PERMISSION=`echo ${PERMISSION} | sed 's/^.\(....\)S/4\10/'`
		PERMISSION=`echo ${PERMISSION} | sed 's/^\(.\).\(......\)s/\12\21/'`
		PERMISSION=`echo ${PERMISSION} | sed 's/^\(.\).\(......\)S/\12\20/'`
		PERMISSION=`echo ${PERMISSION} | sed 's/^\(..\).\(........\)t/\11\21/'`
		PERMISSION=`echo ${PERMISSION} | sed 's/^\(..\).\(........\)T/\11\20/'`
		
		typeset INDEX=0
		typeset TEMP_SUM=0
		for INDEX in 1 2 3 4
		do
			typeset NUM1=`echo ${PERMISSION} | cut -c1`
			typeset NUM2=`echo ${PERMISSION} | cut -c2`
			typeset NUM3=`echo ${PERMISSION} | cut -c3`
			
			TEMP_SUM=$(( 0${NUM1} + 0${NUM2} + 0${NUM3} ))
			FINAL_PERMISSION="${FINAL_PERMISSION}${TEMP_SUM}"
			PERMISSION=`echo ${PERMISSION} | cut -c4-`
		done
	else
		FINAL_PERMISSION=${PERMISSION}		
	fi
	
	echo "${FINAL_PERMISSION}"
	return ${__EXIT_STATUS_SUCCESS}
}


# TODO
# -----------------------------------------------------------------------------
##=Category: Flow Control | Script_Finalization
##
##=Usage: Script_Finalization 
## 
##=Description
##		Delete the temporary files and directories in the end of the script.
##    Depened on 
## 
##=Return Code
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success 
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: __EXIT_STATUS_FAILED - Failed
##
##=Example
## 	...
## 	Script_Finalization
## 	...
function Script_Finalization
{
	typeset __FUNCTION="Script_Finalization";
	
	if [[ $# -lt 0 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset CURRENT_DELETE
	# remove temporary files
	if [[ "${__NO_TEMPFILES_DELETE}"x != "${__TRUE}"x ]] 
	then   
		Print_Kit_Msg "Removing temporary files ..."
		for CURRENT_DELETE in ${__TEMP_FILE_LIST[*]} ; do
	 		Print_Kit_Msg "Removing the file \"${CURRENT_DELETE}\" ..."
			if [[ -f "${CURRENT_DELETE}" ]] 
			then
				rm "${CURRENT_DELETE}" 2>/dev/null 
				[ $? -ne 0 ] && Warning_Msg "Error removing the file \"${CURRENT_DELETE}\" "
			fi
		done
	else
		Print_Kit_Msg "__NO_TEMPFILES_DELETE is set -- skipping removing temporary files"
	fi

	# remove temporary directories
	if [[ "${__NO_TEMPDIR_DELETE}"x != "${__TRUE}"x ]] 
	then   
		Print_Kit_Msg "Removing temporary directories ..."
		for CURRENT_DELETE in ${__TEMP_DIR_LIST} ; do
			Print_Kit_Msg "Removing the directory \"${CURRENT_DELETE}\" ..."
			if [[ -d "${CURRENT_DELETE}" ]] 
			then
				rm -r "${CURRENT_DELETE}" 2>/dev/null
				[ $? -ne 0 ] && Warning_Msg "Error removing the directory \"${CURRENT_DELETE}\" "
			fi
		done
	else
		Print_Kit_Msg "__NO_TEMPDIR_DELETE is set -- skipping removing temporary directories"
	fi
	
	return ${__EXIT_STATUS_SUCCESS}
}

# -----------------------------------------------------------------------------
##=Category: Flow Control | Send_Mail
##
##=Usage: Send_Mail.ksh mail_to subject body_files [attached_files] 
## 
##=Description
##		Send mail function. Function can send mail in different formats html/plain text, with/out attached files.
##		The mail type (html or plain) define via __MAIL_MIME variable.
##		You can control the mail from address by overwriting the __MAIL_FROM variable. The default value is "$USER@treato.com"
##		You can also define the CC and BSS by definition of __MAIL_CC and __MAIL_BCC variables.
## 
##=Input Parameters
##=Parameter: mail_to - List of Recipient, separated by comma 
##=Parameter: subject - subject of mail
##=Parameter: body_files - list of files that will be in the mail body (files separated by comma)
##=Parameter: attached_files(Optional) - list of file that will be attached in the mail. (file separated  by comma)
##
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: __EXIT_STATUS_FAILED - Failed
##=Exit Status: __EXIT_STATUS_FILE_NOT_FOUND - File not found
##
##=Example
## 	...
## 	Send_Mail "yuris@treato.com" "Mail Subject - Test" "Mail body here" "/etc/hosts,/etc/passwd"
## 	...
##
function Send_Mail
{
	typeset __FUNCTION="Send_Mail";
	
	# checking function parameters
	if [[ $# -ne 3 && $# -ne 4  ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	typeset MAIL_TO="$1"
	typeset MAIL_SUBJECT="$2"
	typeset MAIL_BODY="$3"
	typeset MAIL_ATTACHED_FILES="$4"
 
	Create_Temp_File
	typeset MAIL_FILE=$__TEMP_FILE
	typeset EXIT_STATUS=${__EXIT_STATUS_SUCCESS}
	
	if [[ -z ${MAIL_TO} ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function--> MAIL_TO Parameter Not Defined "
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	if [[ -z ${MAIL_SUBJECT} ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function--> MAIL_SUBJECT Parameter Not Defined "
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	if [[ -z ${__MAIL_FROM} ]] 
	then
		__MAIL_FROM="${USER}@treato.com"
	fi
	
	Find_File mail ${PATH}:/usr/sbin/
	if [[ $? -ne ${__EXIT_STATUS_SUCCESS} ]] 
	then
		Error_Msg "The sendmail command not found."
		return ${__EXIT_STATUS_FAILED}
	fi
	typeset SENDMAIL_COMMAND="${__FILE_FOUND_DIR}/mail"
	typeset UUENCODE_COMMAND=""
		
	if [[ -n ${MAIL_ATTACHED_FILES} ]] 
	then
		for FILE in `echo ${MAIL_ATTACHED_FILES} | tr "," " "`
		do 
			if [[ ! -f  ${FILE} ]] 
			then
				Error_Msg "The $FILE doesn't exist."
				return ${__EXIT_STATUS_FILE_NOT_FOUND}
			fi
		done
	fi


	${SENDMAIL_COMMAND} -a ${MAIL_ATTACHED_FILES} -s \"${MAIL_SUBJECT}\" ${MAIL_TO} <<< \"${MAIL_BODY}\"
	
	EXIT_STATUS=$?
	return ${EXIT_STATUS}
}

# -----------------------------------------------------------------------------
##=Category: Working with Files and Directories | Find_File
## 
##=Usage: Find_File search_file search_path
##
##=Input Parameters
##=Parameter: search_file - the file to search
##=Parameter: search_path - the search path, delimiter is ':' ( Like PATH variable )
##
##=Description
##		search file in search_path parameter
##    
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: __EXIT_STATUS_FILE_NOT_FOUND - File not found
##
##=Function Exported Variables
##=Exported Variable: __FILE_FOUND_DIR - containt the directory name 
##
##=Example
## ...
## # Search data.xml file in ${HOME}/data, /tmp/test and $PATH directories
## SEARCH_PATH=${HOME}/data:/tmp/test:${PATH}
## Find_File data.xml ${SEARCH_PATH}
## ...
function Find_File
{
	typeset __FUNCTION="Find_File";
	
	if [[ $# -ne 2 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset SEARCH_FILE=${1}
	typeset SEARCH_PATH=${2}
	
	__FILE_FOUND_DIR=""
	
	typeset THISRC=${__EXIT_STATUS_FILE_NOT_FOUND}
	typeset CURRENT_PATH=""
	for CURRENT_PATH in `echo ${SEARCH_PATH} | tr ":" " "`
	do
		if [[ -f "${CURRENT_PATH}/${SEARCH_FILE}" ]] 
		then
			Debug_Msg The ${SEARCH_FILE} found in ${CURRENT_PATH} directory
			THISRC=${__EXIT_STATUS_SUCCESS}
			__FILE_FOUND_DIR=${CURRENT_PATH}
			break
		fi
	done
	
	return ${THISRC}
}

# -----------------------------------------------------------------------------
##=Category: Working with Files and Directories | Create_Empty_File
##
##=Usage: Create_Empty_File file
## 
##=Description
##	 Create the empty file if it doesn't exist, otherwise reset the file to be empty.
## 
##=Input Parameters
##=Parameter: file - the file path 
##     
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: __EXIT_STATUS_FAILED - Failed
##
##=Example
## 	...
## 	Create_Empty_File ${HOME}/mydir/status_file
## 	...
##
function Create_Empty_File
{
	typeset __FUNCTION="Create_Empty_File";
	
	if [[ $# -ne 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset REQUESTED_FILE="$1"
	
	if [[ ! -f ${REQUESTED_FILE} ]] 
	then
		typeset DIR_BASE=`dirname ${REQUESTED_FILE}`
		if [[ ! -d ${DIR_BASE} ]]
		then
			mkdir -p ${DIR_BASE} 2>/dev/null
			if [[ $? -ne 0 ]] 
			then
				Error_Msg "Faild to create [${DIR_BASE}] directory."
				return ${__EXIT_STATUS_FAILED}
			fi
		fi
	fi
	
	: > ${REQUESTED_FILE} 2>/dev/null
	if [[ $? -ne 0 ]] 
	then
		Error_Msg "Faild to create [${REQUESTED_FILE}] file."
		return ${__EXIT_STATUS_FAILED}
	fi
	
	return ${__EXIT_STATUS_SUCCESS}
}

# -----------------------------------------------------------------------------
##=Category: Data Base | Check_DB_Connection
##
##=Usage: Check_DB_Connection db_connection
##
##=Input Parameters
##=Parameter: db_connection - the data base connection ( user/password@instance )
##
##=Description
##		Checking connection to DataBase.
##      
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status:  Not 0 - Failed 
##
##=Example
## ...
## Check_DB_Connection --host="db01-isrl01" --user="root" --password="flr@1234" Flr_Users7
## ...
function Check_DB_Connection
{
	typeset __FUNCTION="Check_DB_Connection";    ${__FUNCTION_INIT} ; ${__DEBUG_CODE}
	
	if [[ $# -ne 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset DB_URL=${1}
	typeset THISRC=${__EXIT_STATUS_SUCCESS}
	
	Create_Temp_File
	THISRC=$?
	__Exit_On_Failed_Flag ${THISRC} "${__FUNCTION}" "Failed to create temporary file"
	eval `Return_If_Failed ${THISRC} Failed to create temporary file`
	
	Find_File mysql "${PATH}"
	THISRC=$?
	__Exit_On_Failed_Flag ${THISRC} "${__FUNCTION}" "No mysql command in PATH variable. [${PATH}]"
	eval `Return_If_Failed ${THISRC} "No mysql command in PATH variable. [${PATH}]"`	
	
	mysql ${DB_URL}  -e 'show databases;' > ${__TEMP_FILE}
		
	grep 'Database'  ${__TEMP_FILE} >/dev/null 2>&1
	THISRC=$?
	
	if [[ ${THISRC} -eq 0 ]]
	then
		Print_Kit_Msg "Connection to ${DB_URL} finished successfully."
	else
		typeset DB_ERRORS=`egrep -e "${__SQL_ERROR_SEARCH_STRING}" ${__TEMP_FILE} `
		Print_Kit_Msg "Connection to ${DB_URL} failed. Error is ${DB_ERRORS}"
		Debug_Msg_File ${__TEMP_FILE}
	fi
	
	return ${THISRC}
}

##=Category: Variables | __COMMAND_EXECUTION_ADD_STDOUT_TO_LOG
##=Description
##  __COMMAND_EXECUTION_ADD_STDOUT_TO_LOG - Flag that define if add the command stdout that running via Command_Execution to log file.
##         Default value is \${__FALSE}
##
##=Note
##	 You can also set this environment variable before starting the script
__COMMAND_EXECUTION_ADD_STDOUT_TO_LOG="${__COMMAND_EXECUTION_ADD_STDOUT_TO_LOG:=${__FALSE}}"

##=Category: Variables | __COMMAND_EXECUTION_ADD_STDERR_TO_LOG
##=Description
##  __COMMAND_EXECUTION_ADD_STDERR_TO_LOG - Flag that define if add the command stderr that running via Command_Execution to log file.
##         Default value is \${__FALSE}
##
##=Note
##	 You can also set this environment variable before starting the script
__COMMAND_EXECUTION_ADD_STDERR_TO_LOG="${__COMMAND_EXECUTION_ADD_STDERR_TO_LOG:=${__FALSE}}"

# -----------------------------------------------------------------------------
##=Category: Local and Remote Command Execution | Command_Execution
##
##=Usage: Command_Execution command
## 
##=Description
##       Execute the command. The command and exit status is written in the log file.
##       You can controle the command output by __COMMAND_EXECUTION_ADD_STDOUT_TO_LOG and __COMMAND_EXECUTION_ADD_STDERR_TO_LOG variables
## 
##=Input Parameters
##=Parameter: command - command to execute
##     
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: Other - command exit status
##
##=Example
## 	...
##__COMMAND_EXECUTION_ADD_STDOUT_TO_LOG=\${__TRUE}
## 	Command_Execution ls -la /tmp
## 	...
##
function Command_Execution
{
	typeset __FUNCTION="Command_Execution"; ${__FUNCTION_INIT}; ${__DEBUG_CODE}
	
	# checking function parameters
	if [[ $# -lt 1 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	if [[ ${__COMMAND_EXECUTION_ADD_STDOUT_TO_LOG} -ne ${__TRUE} && ${__COMMAND_EXECUTION_ADD_STDOUT_TO_LOG} -ne ${__FALSE} ]]
	then
		Error_Msg "Wrong value of \${__COMMAND_EXECUTION_ADD_STDOUT_TO_LOG}. Can be \${__TRUE} or ${__FALSE}. [${__COMMAND_EXECUTION_ADD_STDOUT_TO_LOG}]"
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	if [[ ${__COMMAND_EXECUTION_ADD_STDERR_TO_LOG} -ne ${__TRUE} && ${__COMMAND_EXECUTION_ADD_STDERR_TO_LOG} -ne ${__FALSE} ]]
	then
		Error_Msg "Wrong value of \${__COMMAND_EXECUTION_ADD_STDERR_TO_LOG}. Can be \${__TRUE} or ${__FALSE}. [${__COMMAND_EXECUTION_ADD_STDERR_TO_LOG}]"
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	typeset COMMAND_REDIRECTION_STRING=""
	if [[ ${__COMMAND_EXECUTION_ADD_STDOUT_TO_LOG} -eq ${__TRUE} ]]
	then
		COMMAND_REDIRECTION_STRING=" >> ${__LOGFILE}"
	fi
	if [[ ${__COMMAND_EXECUTION_ADD_STDERR_TO_LOG} -eq ${__TRUE} ]]
	then
		COMMAND_REDIRECTION_STRING="${COMMAND_REDIRECTION_STRING} 2>> ${__LOGFILE}"
	fi
	
	typeset EXIT_STATUS=${__EXIT_STATUS_SUCCESS}
	
	typeset COMMAND_TO_RUN="$@"

	Debug_Msg "going to run the command: [${COMMAND_TO_RUN} ${COMMAND_REDIRECTION_STRING}]"
	eval ${COMMAND_TO_RUN} ${COMMAND_REDIRECTION_STRING}
	EXIT_STATUS=$?
	Debug_Msg "the command execution ended with exit code [${EXIT_STATUS}]"
	__Exit_On_Failed_Flag ${EXIT_STATUS} "${__FUNCTION}"
	return ${EXIT_STATUS}
}

# ----------------------------------------------------------------------------- #'


##=Category: Variables | __SSH_DEFINITION_MODE
##=Description
##		Define the way how to distribute the ssh key. Can get FTP or NO_FTP values.
##		Default value is NO_FTP mode.
##=Note
##	 You can also set this environment variable before starting the script
__SSH_DEFINITION_MODE="${__SSH_DEFINITION_MODE:=NO_FTP}"
 

##=Category: Local and Remote Command Execution | Set_SSH_Connection
## 
##=Usage: Set_SSH_Connection remote_host remote_user remote_password 
##
##=Input Parameters
##=Parameter: remote_host - the remote host name
##=Parameter: remote_user - the remote user name
##=Parameter: remote_password - the remote user password
##
##=Description
##      Define the ssh connection between current account and remote account.
##      After successfully execution you will able connect via ssh to remote account without password prompt.
##      You can controle the way of ssh key distribution by __SSH_DEFINITION_MODE variable.
##
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_FAILED - Failure
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage    
##
##=Example
## ...
## Set_SSH_Connection hpp712 dbhwrk10  Unix11! 
## ...
function Set_SSH_Connection
{
	typeset __FUNCTION="Set_SSH_Connection"; ${__FUNCTION_INIT} ; ${__DEBUG_CODE}

	if [[ $# -ne 3 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	typeset REMOTE_HOST=${1}
	typeset REMOTE_USER=${2}
	typeset REMOTE_PASSWORD=${3}
	
	typeset CONNECTION_PRINT_STRING="${USER}@${HOST} -> ${REMOTE_USER}@${REMOTE_HOST}"

	# Check if we already have ssh connection
	Debug_Msg "Checking if the ssh connection already define for ${CONNECTION_PRINT_STRING}"
	typeset OLD_REMOTE_CONNECT_TYPE="${__REMOTE_CONNECT_TYPE}"
	__REMOTE_CONNECT_TYPE="ssh"
	Check_Remote_Connection "${REMOTE_HOST}" "${REMOTE_USER}"
	typeset RC=$?
	__REMOTE_CONNECT_TYPE="${OLD_REMOTE_CONNECT_TYPE}"
	if [[ ${RC} -eq ${__EXIT_STATUS_SUCCESS} ]] 
	then
		Debug_Msg "The ssh connection already defined for ${CONNECTION_PRINT_STRING}"
		return ${__EXIT_STATUS_SUCCESS}
	fi
	
	if [[ ! -f "${HOME}/.ssh/id_rsa.pub" ]] 
	then
		Debug_Msg "Generate the rsa keys"
		ssh-keygen -t rsa -f "${HOME}/.ssh/id_rsa" -N ""
		if [[ $? -ne ${__EXIT_STATUS_SUCCESS} ]] 
		then
			Error_Msg "Failed to generate rsa keys"
			__Exit_On_Failed_Flag ${__EXIT_STATUS_FAILED} "${__FUNCTION}"
			return ${__EXIT_STATUS_FAILED}
		fi
	fi
	
	if [[ "${__SSH_DEFINITION_MODE}" = "FTP" ]] 
	then
		__Set_SSH_Connection_Via_FTP "${REMOTE_HOST}" "${REMOTE_USER}" "${REMOTE_PASSWORD}"
	else
		Create_Temp_File
		typeset SSH_KEY_FILE="${__TEMP_FILE}"
		
		Create_Temp_File
		typeset __SSH_OUTPUT_FILE="${__TEMP_FILE}"
		
		Create_Temp_File
		typeset __SSH_SCRIPT_FILE="${__TEMP_FILE}"
		
		echo "echo ${REMOTE_PASSWORD}" > "${SSH_KEY_FILE}"
		cat << EOF > "${__SSH_SCRIPT_FILE}"
#!/bin/bash
export SSH_ASKPASS="${SSH_KEY_FILE}"
export DISPLAY="dummydisplay:0"
exec setsid "\$@"
EOF
		chmod 755 "${__SSH_SCRIPT_FILE}"
		"${__SSH_SCRIPT_FILE}" ssh ${REMOTE_USER}@${REMOTE_HOST} -n "ls -la" > "${__SSH_OUTPUT_FILE}" 2>&1
		if [[ $? -ne ${__EXIT_STATUS_SUCCESS} ]] 
		then
			rm -f ${SSH_KEY_FILE} 2>/dev/null
			Error_Msg "Failed to check if .ssh directory exists"
			__Exit_On_Failed_Flag ${__EXIT_STATUS_FAILED} "${__FUNCTION}"
			return ${__EXIT_STATUS_FAILED}
		fi
		
		awk '{ print $9 }' "${__SSH_OUTPUT_FILE}" | grep "^\.ssh$" > /dev/null 2>&1
		if [[ $? -ne ${__EXIT_STATUS_SUCCESS} ]] 
		then
			"${__SSH_SCRIPT_FILE}" ssh ${REMOTE_USER}@${REMOTE_HOST} -n "mkdir .ssh" > "${__SSH_OUTPUT_FILE}" 2>&1
			if [[ $? -ne ${__EXIT_STATUS_SUCCESS} ]] 
			then
				rm -f ${SSH_KEY_FILE} 2>/dev/null
				Error_Msg "Failed to create the .ssh directory."
				__Exit_On_Failed_Flag ${__EXIT_STATUS_FAILED} "${__FUNCTION}"
				return ${__EXIT_STATUS_FAILED}
			fi
		fi
	
		cat ${HOME}/.ssh/id_rsa.pub | "${__SSH_SCRIPT_FILE}" ssh ${REMOTE_USER}@${REMOTE_HOST} "cat >> .ssh/authorized_keys" 2>&1
		"${__SSH_SCRIPT_FILE}" ssh ${REMOTE_USER}@${REMOTE_HOST} "chmod 700 .ssh" 2>&1
		"${__SSH_SCRIPT_FILE}" ssh ${REMOTE_USER}@${REMOTE_HOST} "chmod 640 .ssh/authorized_keys" 2>&1
		if [[ $? -ne ${__EXIT_STATUS_SUCCESS} ]] 
		then
			rm -f ${SSH_KEY_FILE} 2>/dev/null
			Error_Msg "Failed to add rsa public key"
			__Exit_On_Failed_Flag ${__EXIT_STATUS_FAILED} "${__FUNCTION}"
			return ${__EXIT_STATUS_FAILED}
		fi

		rm -f ${SSH_KEY_FILE} 2>/dev/null
	fi
	
	Debug_Msg "Validate the ssh connection for ${CONNECTION_PRINT_STRING}"
	typeset OLD_REMOTE_CONNECT_TYPE="${__REMOTE_CONNECT_TYPE}"
	__REMOTE_CONNECT_TYPE="ssh"
	Check_Remote_Connection "${REMOTE_HOST}" "${REMOTE_USER}"
	typeset RC=$?
	__REMOTE_CONNECT_TYPE="${OLD_REMOTE_CONNECT_TYPE}"
	if [[ ${RC} -eq ${__EXIT_STATUS_SUCCESS} ]] 
	then
		Debug_Msg "The ssh connection defined successfully for ${CONNECTION_PRINT_STRING}"
		return ${__EXIT_STATUS_SUCCESS}
	fi
	
	Error_Msg "The ssh connection definition for ${CONNECTION_PRINT_STRING} failed"
	return ${__EXIT_STATUS_FAILED}
}

##=Category: Constants | __INPUT_DELIMETER_SPACE_CHARACTER
##=Description
##		Defined the input delimeter as space character
typeset -r __INPUT_DELIMETER_SPACE_CHARACTER=" "

##=Category: Constants | __INPUT_DELIMETER_EQUAL_CHARACTER
##=Description
##		Defined the input delimeter as equal character
typeset -r __INPUT_DELIMETER_EQUAL_CHARACTER="="

##=Category: Variables | __INPUT_DELIMETER_CHARACTER
##=Description
##		Define the input script character delimeter.
typeset __INPUT_DELIMETER_CHARACTER="${__INPUT_DELIMETER_SPACE_CHARACTER}"

# -----------------------------------------------------------------------------
##=Category: Flow Control | Check_Script_Parameters
##
##=Usage: Check_Script_Parameters script_parameter
## 
##=Description
##	Check the script input parrameters are suitable for script parameters.
##	Before to call this function you must to defined in __SCRIPT_PARAMETERS array which parameters script cat to get.
##
##  __SCRIPT_PARAMETERS array contains the parameter definition. 
##	The parameter definition line contains: 
##  [input name],[parameter type],[variable_name],[additional data for parameter type],[reques type],[additional data for request type]
##
##  The [input name] describe the input names for parameter. Can contains more than one, by delimer it with "|" character.
##  Example: -h|--help
##
##	The [parameters type] can be:
##  PARAMETER - define parameter type, like -p=value 
##	FLAG - define flag type, like -f ( without value ) ( flag can be ON or OFF )
##	PARAMETER_COMMAND - like PARAMETER type but also will execute additional command.
##	FLAG_COMMAND - like FLAG type but also will execute additional command.
##	USAGE - call to ShowUsage function and exit.
##
##  The [additional data for parameter type]:
##  command - define the command that need to be execute. It's available only for PARAMETER_COMMAND and FLAG_COMMAND type.
##
##	The [request type] can be:
##	MANDATORY - mandatory parameter
##	OPTIONAL - optional parameter
## 	MANDATORY_ONLY_ONE - define set of mandatory parameters. Only one parameter from this set must to be passed to script.
## 	OPTIONAL_ONLY_ONE - define set of optional parameters. Only one parameter from this set can to be passed to script.
##  MANDATORY_SET - define set of mandatory parameters. At least one of parameter from this set must to be passed to script.
##  MANDATORY_FOR - define mandatory parameter that must to be passed to the script only if other parameter exists.
##  OPTIONAL_FOR - define optional parameter that can to be passed to the script only if other parameter exists.
##  MANDATORY_ONLY_ONE_FOR - define set of mandatory parameters. Only one parameter from this set must to be passed to script if other parameter exists.
##  OPTIONAL_ONLY_ONE_FOR - define set of optional parameters. Only one parameter from this set can to be passed to script if other parameter exists.
##  MANDATORY_SET_FOR - define set of mandatory parameters. At least one of parameter from this set must to be passed to script if other parameter exists.
## 
##	The [additional data for request type] contains [default value],[set name],[input name]:
##	default value - define the default value for all OPTIONAL* request type.
##	set name - define the set name for MANDATORY_ONLY_ONE, OPTIONAL_ONLY_ONE, MANDATORY_SET, MANDATORY_ONLY_ONE_FOR, OPTIONAL_ONLY_ONE_FOR and MANDATORY_SET_FOR type
##  input name - define the input name to which this parameter depend. Can be only for MANDATORY_FOR, OPTIONAL_FOR, MANDATORY_ONLY_ONE_FOR, OPTIONAL_ONLY_ONE_FOR and MANDATORY_SET_FOR type
##
##=Input Parameters
##=Parameter: script_parameter - the script parameters that passed to the script 
##
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: __EXIT_STATUS_FAILED - Failed
##
##=Example
##	# Script can get the below parameters
##	# -b or --backup ( it's optional flag parameter ON/OFF, by default OFF )
##	# -bk or --backup_dir ( it's mandatory parameter only if the --backup parameter exists. )
##	# -h or --help ( print the usage and exit )
##
## __SCRIPT_PARAMETERS[0]="-b|--backup,FLAG,NEED_TO_BACKUP,OPTIONAL,OFF"          
## __SCRIPT_PARAMETERS[1]="-bk|--backup_dir,PARAMETER,BACKUP_DIR,MANDATORY_FOR,-b|--backup"
## __SCRIPT_PARAMETERS[2]="-h|--help,USAGE"
## Check_Script_Parameters $*
##	if [[ $? -ne 0 ]] 
##  then
##			ShowUsage
##			exit 1
##	fi
## 	...
##
function Check_Script_Parameters
{
	typeset __FUNCTION="Check_Script_Parameters"; ${__FUNCTION_INIT}; ${__DEBUG_CODE}
	
	typeset SCRIPT_USER_PARAMS="$*"
	
	# checking function parameters
	if [[ ${#__SCRIPT_PARAMETERS[*]} -eq 0 ]] 
	then
		Error_Msg "Wrong function usage. The __SCRIPT_PARAMETERS is empty."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	typeset EXIT_STATUS=${__EXIT_STATUS_SUCCESS}
	
	# ----- validate syntax of __SCRIPT_PARAMETERS array  -----
	typeset i=0
	typeset PARAM_TYPE
	typeset REQUEST_TYPE
	typeset REQ_FIELDS
	#typeset -A __TEMP_PARAM_ARRAY
	while [[ $i -lt ${#__SCRIPT_PARAMETERS[*]} ]]
	do
		if [[ -z "${__SCRIPT_PARAMETERS[$i]}" ]] 
		then
			Error_Msg "Syntax of __SCRIPT_PARAMETERS array is wrong. The string is empty in index $i."
			__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
				return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
		fi
			
		PARAM_TYPE=`echo ${__SCRIPT_PARAMETERS[$i]} | cut -d\, -f2`
		case "${PARAM_TYPE}" in
			"PARAMETER" | "FLAG" ) 
							REQUEST_TYPE=`echo "${__SCRIPT_PARAMETERS[$i]}" | cut -d\, -f4`
							REQ_FIELDS=3
							;;
			"PARAMETER_COMMAND" | "FLAG_COMMAND" ) 
							REQUEST_TYPE=`echo "${__SCRIPT_PARAMETERS[$i]}" | cut -d\, -f5`
					        REQ_FIELDS=4
							;;
			"USAGE" )
							REQUEST_TYPE="USAGE"
							REQ_FIELDS=2
							;;
			* )  Error_Msg "Syntax of __SCRIPT_PARAMETERS array is wrong. Unsupported ${PARAM_TYPE} parameter type. [ ${__SCRIPT_PARAMETERS[$i]} ] [$i]"
				 __Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
				 return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
				;;					
		esac

		case "${REQUEST_TYPE}" in
			"MANDATORY" ) REQ_FIELDS=$(( ${REQ_FIELDS} + 1 ))
							;;
			"OPTIONAL" | "MANDATORY_ONLY_ONE" | "MANDATORY_SET" | "MANDATORY_FOR" )
							REQ_FIELDS=$(( ${REQ_FIELDS} + 2 ))
							;;
			"OPTIONAL_ONLY_ONE" | "OPTIONAL_FOR" | "MANDATORY_ONLY_ONE_FOR" | "MANDATORY_SET_FOR" )
							REQ_FIELDS=$(( ${REQ_FIELDS} + 3 ))
							;;
			"OPTIONAL_ONLY_ONE_FOR" ) REQ_FIELDS=$(( ${REQ_FIELDS} + 4 ))
							;;
			"USAGE" )
							;;
			* )  Error_Msg "Syntax of __SCRIPT_PARAMETERS array is wrong. Unsupported ${REQUEST_TYPE} request type.[${__SCRIPT_PARAMETERS[$i]}]"
							__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
							 return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
							;;					
		esac

		CURRENT_FIELD=`echo "${__SCRIPT_PARAMETERS[$i]}" | awk -F\, '{ print NF }'`
		if [[ "${REQ_FIELDS}" -ne "${CURRENT_FIELD}" ]] 
		then
			Error_Msg "Wrong number of parameters in __SCRIPT_PARAMETERS array, index $i. [${__SCRIPT_PARAMETERS[$i]}]. Need to be ${REQ_FIELDS} fields, now ${CURRENT_FIELD} "
			__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
			return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
		fi     
		__TEMP_PARAM_ARRAY[${i}]="false"
		(( i=$i + 1 )) 
	done   
	# ---------------------------------------------------------------------------
  
	# ------ update all FLAG and FLAG_COMMAND parameter values to OFF -----------
	i=0
	while [[ $i -lt ${#__SCRIPT_PARAMETERS[*]} ]]
	do
		PARAM_TYPE=`echo ${__SCRIPT_PARAMETERS[$i]} | cut -d\, -f2`
		if [[ "${PARAM_TYPE}" = "FLAG" || "${PARAM_TYPE}" = "FLAG_COMMAND" ]] 
		then
			VAR_NAME=`echo "${__SCRIPT_PARAMETERS[$i]}" | cut -d\, -f3`
				eval "export ${VAR_NAME}=OFF"
		fi
		(( i=$i + 1 ))
	done
	# ---------------------------------------------------------------------------

	# ------ set default valuse for OPTIONAL request type -----------
	i=0
	while [[ $i -lt ${#__SCRIPT_PARAMETERS[*]} ]]
	do
		REQ_TYPE=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "TYPE"`
		echo "${REQ_TYPE}" | grep "^OPTIONAL" >/dev/null 2>&1
		if [[ $? -eq 0 ]] 
		then
			VAR_NAME=`echo "${__SCRIPT_PARAMETERS[$i]}" | cut -d\, -f3`
			DEF_VALUE=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "DEFAULT"`
				eval "export ${VAR_NAME}=\"${DEF_VALUE}\""
		fi
		(( i=$i + 1 ))
	done
	# ---------------------------------------------------------------------------

	# ------ check that all input parameters defined in array
	typeset INPUT_NAME
	typeset FOUND_PARAM_INDEX
	typeset REAL_INPUT_NAME
	while [[ $1 != '' ]]
		do
		REAL_INPUT_NAME=`echo "$1" | cut -d"${__INPUT_DELIMETER_CHARACTER}" -f1`
		# Find the parameter in array
		i=0
		FOUND_PARAM_INDEX="-1"
		while [[ $i -lt ${#__SCRIPT_PARAMETERS[*]} ]]
		do
			for INPUT_NAME in `echo "${__SCRIPT_PARAMETERS[$i]}" | cut -d\, -f1 | tr "|" " "`  
			do
				if [[ "${INPUT_NAME}" = "${REAL_INPUT_NAME}" ]] 
				then
					FOUND_PARAM_INDEX="$i"
					break
				fi
			done
			if [[ "${FOUND_PARAM_INDEX}" != "-1" ]] 
			then
				break
			fi
			(( i=$i + 1 )) 
		done

		if [[ "${FOUND_PARAM_INDEX}" = "-1" ]] 
		then
			Error_Msg "Unknown ${REAL_INPUT_NAME} parameter."
			return ${__EXIT_STATUS_FAILED}  
		fi

		__TEMP_PARAM_ARRAY[${FOUND_PARAM_INDEX}]="true"
		PARAM_TYPE=`echo ${__SCRIPT_PARAMETERS[${FOUND_PARAM_INDEX}]} | cut -d\, -f2`
		PARAM_VAR_NAME=`echo ${__SCRIPT_PARAMETERS[${FOUND_PARAM_INDEX}]} | cut -d\, -f3`
		case "${PARAM_TYPE}" in
			"PARAMETER" | "PARAMETER_COMMAND" ) 
						if [[ "${__INPUT_DELIMETER_CHARACTER}" = "${__INPUT_DELIMETER_SPACE_CHARACTER}" ]] 
						then
							eval "export ${PARAM_VAR_NAME}=\"$2\""
					shift
				else
					REAL_VALUE=`echo "$1" | cut -d"${__INPUT_DELIMETER_CHARACTER}" -f2`
					eval "export ${PARAM_VAR_NAME}=\"${REAL_VALUE}\""
				fi
				shift
						;;
			"FLAG" | "FLAG_COMMAND" ) 
						eval "export ${PARAM_VAR_NAME}=ON"
     					shift
						;;
			"USAGE" )
						ShowUsage
						exit ${__EXIT_STATUS_SUCCESS}
						;;
		esac
	done
	# --------------------------------------------------------------

	# Check that input parameters equal to the request type	
	i=0
	while [[ $i -lt ${#__SCRIPT_PARAMETERS[*]} ]]
	do
		REQUEST_TYPE=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "TYPE"`
		PARAM_TYPE=`echo "${__SCRIPT_PARAMETERS[$i]}" | cut -d\, -f2`
		case "${REQUEST_TYPE}" in
			"MANDATORY" ) 
						if [[ ${__TEMP_PARAM_ARRAY[${i}]} = "false" ]] 
						then
							Error_Msg "Mandatory parameter is missing: " `echo "${__SCRIPT_PARAMETERS[$i]}" | cut -d\, -f1`
							return ${__EXIT_STATUS_FAILED}
						fi
						;;
			"OPTIONAL" )
						#if [[ ${__TEMP_PARAM_ARRAY[${i}]} = "false" ]] 
						#then
						#	PARAM_VAR_NAME=`echo "${__SCRIPT_PARAMETERS[${i}]}" | cut -d\, -f3`
						#	PARAM_VAR_DEFAULT_VALUE=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "DEFAULT"`
						#	eval "export ${PARAM_VAR_NAME}=\"${PARAM_VAR_DEFAULT_VALUE}\""
						#fi
						;;
			"MANDATORY_ONLY_ONE" ) 
						SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "SET"`
						j=0
						APPEAR_NUM=0
						while [[ $j -lt ${#__SCRIPT_PARAMETERS[*]} ]]
						do
							CUR_SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "SET"`
							CUR_TYPE=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "TYPE"`
							if [[ "${CUR_TYPE}" = "${REQUEST_TYPE}" && "${SET_NAME}" = "${CUR_SET_NAME}" && "${__TEMP_PARAM_ARRAY[${j}]}" = "true" ]] 
							then
								APPEAR_NUM=$(( ${APPEAR_NUM} + 1 ))
							fi
							
							if [[ ${APPEAR_NUM} -gt 1 ]] 
							then
								Error_Msg "Mandatory set parameter exist more than one time [" `echo "${__SCRIPT_PARAMETERS[$j]}" | cut -d\, -f1` "]"
								return ${__EXIT_STATUS_FAILED}
						fi
							(( j=$j + 1 )) 
					done
					if [[ ${APPEAR_NUM} -eq 0 ]] 
					then
							Error_Msg "Mandatory set parameter doesn't exist" `echo "${__SCRIPT_PARAMETERS[$i]}" | cut -d\, -f1` "]"
							return ${__EXIT_STATUS_FAILED}
					fi
						;;
			"OPTIONAL_ONLY_ONE" )
						SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "SET"`
						j=0
						APPEAR_NUM=0
						while [[ $j -lt ${#__SCRIPT_PARAMETERS[*]} ]]
						do
							CUR_SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "SET"`
							CUR_TYPE=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "TYPE"`
							if [[ "${CUR_TYPE}" = "${REQUEST_TYPE}" && "${SET_NAME}" = "${CUR_SET_NAME}" && "${__TEMP_PARAM_ARRAY[${j}]}" = "true" ]] 
							then
								APPEAR_NUM=$(( ${APPEAR_NUM} + 1 ))
							fi
							
							if [[ ${APPEAR_NUM} -gt 1 ]] 
							then
								Error_Msg "Optional set parameter exist more than one time [" `echo "${__SCRIPT_PARAMETERS[$i]}" | cut -d\, -f1` "]"
								return ${__EXIT_STATUS_FAILED}
							fi

						(( j=$j + 1 )) 
					done
						;;
			"MANDATORY_SET" ) 
						SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "SET"`
						j=0
						APPEAR_NUM=0
						while [[ $j -lt ${#__SCRIPT_PARAMETERS[*]} ]]
						do
							CUR_SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "SET"`
							CUR_TYPE=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "TYPE"`
							if [[ "${CUR_TYPE}" = "${REQUEST_TYPE}" && "${SET_NAME}" = "${CUR_SET_NAME}" && "${__TEMP_PARAM_ARRAY[${j}]}" = "true" ]] 
							then
								APPEAR_NUM=$(( ${APPEAR_NUM} + 1 ))
								break
							fi
						(( j=$j + 1 )) 
					done
					if [[ ${APPEAR_NUM} -eq 0 ]] 
					then
							Error_Msg "Mandatory set parameter doesn't exist [" `echo "${__SCRIPT_PARAMETERS[$i]}" | cut -d\, -f1` "]"
							return ${__EXIT_STATUS_FAILED}
					fi
						;;
			"MANDATORY_FOR" )
						INPUT_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "INPUT"`
						FOUND_FLAG="false"
						j=0
						while [[ $j -lt ${#__SCRIPT_PARAMETERS[*]} ]]
						do
							CUR_INPUT_NAME=`echo "${__SCRIPT_PARAMETERS[$j]}" | cut -d\, -f1` 
							if [[ "${INPUT_NAME}" = "${CUR_INPUT_NAME}" ]] 
							then
								FOUND_FLAG="true"
								break 							
							fi
							(( j=$j + 1 )) 
					done
					if [[ "${FOUND_FLAG}" = "true" ]] 
					then
						if [[ "${__TEMP_PARAM_ARRAY[${j}]}" = "false" && "${__TEMP_PARAM_ARRAY[${i}]}" = "true" ]] 
						then
							Error_Msg "Mandatory parameter for ${INPUT_NAME} doesn't exist"
								return ${__EXIT_STATUS_FAILED}
						fi
						
						if [[ "${__TEMP_PARAM_ARRAY[${j}]}" = "true" && "${__TEMP_PARAM_ARRAY[${i}]}" = "false" ]] 
						then
							Error_Msg "Mandatory parameter for ${INPUT_NAME} appear, but ${INPUT_NAME} not."
								return ${__EXIT_STATUS_FAILED}
						fi
						else
							Error_Msg "Syntax of __SCRIPT_PARAMETERS array is wrong. Can't find input name ${INPUT_NAME}."
							__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
								return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
						fi
						;;
			"OPTIONAL_FOR" ) 
						INPUT_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "INPUT"`
						FOUND_FLAG="false"
						j=0
						while [[ $j -lt ${#__SCRIPT_PARAMETERS[*]} ]]
					do
							CUR_INPUT_NAME=`echo "${__SCRIPT_PARAMETERS[$j]}" | cut -d\, -f1` 
							if [[ "${INPUT_NAME}" = "${CUR_INPUT_NAME}" ]] 
							then
								FOUND_FLAG="true"
								break 							
							fi
							(( j=$j + 1 )) 
					done
					if [[ "${FOUND_FLAG}" = "true" ]] 
					then
						if [[ "${__TEMP_PARAM_ARRAY[${j}]}" = "false" && "${__TEMP_PARAM_ARRAY[${i}]}" = "true" ]] 
						then
							Error_Msg "Optional parameter for ${INPUT_NAME} exist, but ${INPUT_NAME} parameter doesn't exist"
								return ${__EXIT_STATUS_FAILED}
						fi
						else
							Error_Msg "Syntax of __SCRIPT_PARAMETERS array is wrong. Can't find input name ${INPUT_NAME}."
							__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
								return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
						fi
						;;
			"MANDATORY_ONLY_ONE_FOR" )
						SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "SET"`
						j=0
						APPEAR_NUM=0
						while [[ $j -lt ${#__SCRIPT_PARAMETERS[*]} ]]
					do
							CUR_SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "SET"`
							CUR_TYPE=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "TYPE"`
							if [[ "${CUR_TYPE}" = "${REQUEST_TYPE}" && "${SET_NAME}" = "${CUR_SET_NAME}" && "${__TEMP_PARAM_ARRAY[${j}]}" = "true" ]] 
							then
								APPEAR_NUM=$(( ${APPEAR_NUM} + 1 ))
							fi
							
							if [[ ${APPEAR_NUM} -gt 1 ]] 
							then
								Error_Msg "Mandatory for set parameter exist more than one time [" `echo "${__SCRIPT_PARAMETERS[$j]}" | cut -d\, -f1` "]"
								return ${__EXIT_STATUS_FAILED}
						fi
						(( j=$j + 1 )) 
					done
					
					INPUT_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "INPUT"`
						FOUND_FLAG="false"
						j=0
						while [[ $j -lt ${#__SCRIPT_PARAMETERS[*]} ]]
					do
							CUR_INPUT_NAME=`echo "${__SCRIPT_PARAMETERS[$j]}" | cut -d\, -f1` 
							if [[ "${INPUT_NAME}" = "${CUR_INPUT_NAME}" ]] 
							then
								FOUND_FLAG="true"
								break 							
							fi
							(( j=$j + 1 )) 
					done
					
					if [[ "${FOUND_FLAG}" = "true" ]] 
					then
						if [[ "${__TEMP_PARAM_ARRAY[${j}]}" = "true" && ${APPEAR_NUM} -eq 0 ]] 
						then
							Error_Msg "Mandatory parameter set for ${INPUT_NAME} doesn't exist"
								return ${__EXIT_STATUS_FAILED}
						fi
						
						if [[ "${__TEMP_PARAM_ARRAY[${j}]}" = "false" && ${APPEAR_NUM} -eq 1 ]] 
						then
							Error_Msg "Mandatory parameter set for ${INPUT_NAME} appear, but ${INPUT_NAME} not."
								return ${__EXIT_STATUS_FAILED}
						fi
						else
							Error_Msg "Syntax of __SCRIPT_PARAMETERS array is wrong. Can't find input name ${INPUT_NAME}."
							__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
								return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
						fi
					;;
			"OPTIONAL_ONLY_ONE_FOR" ) 
						SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "SET"`
						j=0
						APPEAR_NUM=0
						while [[ $j -lt ${#__SCRIPT_PARAMETERS[*]} ]]
					do
							CUR_SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "SET"`
							CUR_TYPE=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "TYPE"`
							if [[ "${CUR_TYPE}" = "${REQUEST_TYPE}" && "${SET_NAME}" = "${CUR_SET_NAME}" && "${__TEMP_PARAM_ARRAY[${j}]}" = "true" ]] 
							then
								APPEAR_NUM=$(( ${APPEAR_NUM} + 1 ))
							fi
							
							if [[ ${APPEAR_NUM} -gt 1 ]] 
							then
								Error_Msg "OPTIONAL_ONLY_ONE_FOR set parameter exist more than one time [" `echo "${__SCRIPT_PARAMETERS[$i]}" | cut -d\, -f1` "]"
								return ${__EXIT_STATUS_FAILED}
							fi

						(( j=$j + 1 )) 
					done
					
					INPUT_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "INPUT"`
						FOUND_FLAG="false"
						j=0
						while [[ $j -lt ${#__SCRIPT_PARAMETERS[*]} ]]
					do
							CUR_INPUT_NAME=`echo "${__SCRIPT_PARAMETERS[$j]}" | cut -d\, -f1` 
							if [[ "${INPUT_NAME}" = "${CUR_INPUT_NAME}" ]] 
							then
								FOUND_FLAG="true"
								break 							
							fi
							(( j=$j + 1 )) 
					done
					
					if [[ "${FOUND_FLAG}" = "true" ]] 
					then
						if [[ "${__TEMP_PARAM_ARRAY[${j}]}" = "false" && ${APPEAR_NUM} -eq 1 ]] 
						then
							Error_Msg "Optional parameter set for ${INPUT_NAME} appear, but ${INPUT_NAME} not."
								return ${__EXIT_STATUS_FAILED}
						fi
						else
							Error_Msg "Syntax of __SCRIPT_PARAMETERS array is wrong. Can't find input name ${INPUT_NAME}."
							__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
								return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
						fi
						;;
			"MANDATORY_SET_FOR" )
					  SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "SET"`
						j=0
						APPEAR_NUM=0
						while [[ $j -lt ${#__SCRIPT_PARAMETERS[*]} ]]
					do
							CUR_SET_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "SET"`
							CUR_TYPE=`__getRequestType "${__SCRIPT_PARAMETERS[$j]}" "TYPE"`
							if [[ "${CUR_TYPE}" = "${REQUEST_TYPE}" && "${SET_NAME}" = "${CUR_SET_NAME}" && "${__TEMP_PARAM_ARRAY[${j}]}" = "true" ]] 
							then
								APPEAR_NUM=$(( ${APPEAR_NUM} + 1 ))
							fi
						(( j=$j + 1 )) 
					done
					
					INPUT_NAME=`__getRequestType "${__SCRIPT_PARAMETERS[$i]}" "INPUT"`
						FOUND_FLAG="false"
						j=0
						while [[ $j -lt ${#__SCRIPT_PARAMETERS[*]} ]]
					do
							CUR_INPUT_NAME=`echo "${__SCRIPT_PARAMETERS[$j]}" | cut -d\, -f1` 
							if [[ "${INPUT_NAME}" = "${CUR_INPUT_NAME}" ]] 
							then
								FOUND_FLAG="true"
								break 							
							fi
							(( j=$j + 1 )) 
					done
					
					if [[ "${FOUND_FLAG}" = "true" ]] 
					then
						if [[ "${__TEMP_PARAM_ARRAY[${j}]}" = "false" && ${APPEAR_NUM} -ge 1 ]] 
						then
							Error_Msg "MANDATORY_SET_FOR parameter exists for ${INPUT_NAME} parameter, but ${INPUT_NAME} parameter not exists."
								return ${__EXIT_STATUS_FAILED}
						fi
						
						if [[ "${__TEMP_PARAM_ARRAY[${j}]}" = "true" && ${APPEAR_NUM} -eq 0 ]] 
						then
							Error_Msg "MANDATORY_SET_FOR parameter not exists for ${INPUT_NAME} parameter."
								return ${__EXIT_STATUS_FAILED}
						fi
					else
						Error_Msg "Syntax of __SCRIPT_PARAMETERS array is wrong. Can't find input name ${INPUT_NAME}."
						__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
							return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
					fi
						;;
			"USAGE" ) 
						;;	
			* ) Error_Msg "Syntax of __SCRIPT_PARAMETERS array is wrong. Unsupported ${REQUEST_TYPE} request type."
					__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
					return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
					;;					
		esac       
		(( i=$i + 1 ))     
	done

	# ---- Execute COMMAND -------	
	typeset EXECITION_COMMAND
	i=0
	while [[ $i -lt ${#__SCRIPT_PARAMETERS[*]} ]]
	do
		if [[ "${__TEMP_PARAM_ARRAY[${i}]}" = "true" ]] 
		then
			PARAM_TYPE=`echo ${__SCRIPT_PARAMETERS[${i}]} | cut -d\, -f2`
			echo "${PARAM_TYPE}" | grep "COMMAND$" >/dev/null 2>&1
			if [[ $? -eq 0 ]] 
			then
				EXECITION_COMMAND=`echo ${__SCRIPT_PARAMETERS[${i}]} | cut -d\, -f4`
				eval "${EXECITION_COMMAND}"
				if [[ $? -ne 0 ]] 
				then
					Error_Msg "Command execution failed. [${EXECITION_COMMAND}]"
						return ${__EXIT_STATUS_FAILED}
				fi 
			fi
		fi
		(( i=$i + 1 )) 
	done
	return ${EXIT_STATUS}

}

function __convertInputNameToVariable
{
	typeset INPUT_NAME=`echo "$1" | cut -d, -f1`
	echo "___${INPUT_NAME}" | tr "|-" "__"
}

function __getRequestType
{
	typeset INPUT_STRING="$1"
	typeset FIELD="$2"
	typeset PARAM_TYPE=`echo "${INPUT_STRING}" | cut -d\, -f2`
	typeset CUR_REQ_TYPE
	case "${FIELD}" in
		"TYPE" ) INDEX=1
					;;
		"DEFAULT" ) INDEX=2
					;;
	esac
	
	case "${PARAM_TYPE}" in
		"PARAMETER" | "FLAG" ) 
					if [[ "${FIELD}" = "TYPE" || "${FIELD}" = "DEFAULT" ]] 
					then
						INDEX=$(( ${INDEX} + 3 ))
						echo "${INPUT_STRING}" | cut -d\, -f${INDEX}
					fi
					if [[ "${FIELD}" = "INPUT" ]] 
					then
						echo "${INPUT_STRING}" | awk -F, '{ print $NF }'
					fi
					if [[ "${FIELD}" = "SET" ]] 
					then
						CUR_REQ_TYPE=`__getRequestType "${INPUT_STRING}" "TYPE"`
						if [[ "${CUR_REQ_TYPE}" = "OPTIONAL_ONLY_ONE" || "${CUR_REQ_TYPE}" = "OPTIONAL_ONLY_ONE_FOR" ]] 
						then
							echo "${INPUT_STRING}" | cut -d\, -f6
						else
							echo "${INPUT_STRING}" | cut -d\, -f5
						fi
					fi
					;;
		"PARAMETER_COMMAND" | "FLAG_COMMAND" ) 
					if [[ "${FIELD}" = "TYPE" || "${FIELD}" = "DEFAULT" ]] 
					then
						INDEX=$(( ${INDEX} + 4 ))
						echo "${INPUT_STRING}" | cut -d\, -f${INDEX}
					fi
					if [[ "${FIELD}" = "INPUT" ]] 
					then
						echo "${INPUT_STRING}" | awk -F, '{ print $NF }'
					fi
					if [[ "${FIELD}" = "SET" ]] 
					then
						CUR_REQ_TYPE=`__getRequestType "${INPUT_STRING}" "TYPE"`
						if [[ "${CUR_REQ_TYPE}" = "OPTIONAL_ONLY_ONE" || "${CUR_REQ_TYPE}" = "OPTIONAL_ONLY_ONE_FOR" ]] 
						then
							echo "${INPUT_STRING}" | cut -d\, -f7
						else
							echo "${INPUT_STRING}" | cut -d\, -f6
						fi
					fi
					;;
		"USAGE" ) echo "USAGE"
					;;
	esac
}

##=Category: Variables | __USAGE_HELP
##
##=Description
##		Define the script usage message
##
##=Note
## To use variables in the help text use the variable name without
## an escape character, eg. ${OS_VERSION}
##
__USAGE_HELP='
      [??? add additional parameter here ???] 
'

# ---------------------------------------
##=Category: Flow Control | ShowUsage
## 
##=Usage: ShowUsage
##
##=Description
##		Show the script usage. Based on __USAGE_HELP variable
##    
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success 
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Example
## ...
## #Defin in script __USAGE_HELP variable
## __USAGE_HELP='
##  -h --help show the help message......
##  -backup - define if need to backup
## ....
## '
## 
## ShowUsage
## .....
function ShowUsage {
	typeset __FUNCTION="ShowUsage";    ${__FUNCTION_INIT} ; ${__DEBUG_CODE}

	if [[ $# -ne 0 ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	 
	if [[ -z "${__USAGE_HELP}" ]] 
	then
		Error_Msg "Wrong usage of ${__FUNCTION} function."
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi
	
	eval "__USAGE_HELP=\"${__USAGE_HELP}\""
	echo "${__USAGE_HELP}"
	     
	return ${__EXIT_STATUS_SUCCESS}      
}

# ---------------------------------------
## 
## Send_sms
## Sending sms messages threw sms provider
## .....
function Send_sms {
	typeset __FUNCTION="Send_sms";    ${__FUNCTION_INIT} ; ${__DEBUG_CODE}
	local _phone_numbers=$1
	local _message=$2
	local _PARAMS_COUNT=$#

	if [[ $# < 2 ]]; then
		Error_Msg "Wrong number of parameters."
		echo ""
		Debug_Msg "function example: Send_sms \"0544464204 0544464205 0544464206\" \"This is my message\" "
		__Exit_On_Failed_Flag ${__EXIT_STATUS_WRONG_FUNCTION_USE} "${__FUNCTION}"
		return ${__EXIT_STATUS_WRONG_FUNCTION_USE}
	fi

	for _phone in ${_phone_numbers}; do
		local _command="wget -O - \"http://la.cellactpro.com/http_req.asp?FROM=firstlife&USER=firstlife&PASSWORD=lkjbase623&APP=LA&CMD=sendtextmt&SENDER=NagiosDALL&CONTENT=${_message}&TO=${_phone}\""
		Command_Execution ${_command}
	done

}


##= Statistic module
##= Write statistic to graphana
##= To overide local function varebles export them in your code

#Default: graphana flag enabled, if desabled this feature will be off
_WRITE_TO_GRAPHANA_FLAG=false
function Write_graphana {
	typeset __FUNCTION="Write_graphana";    ${__FUNCTION_INIT} ; ${__DEBUG_CODE}
	#this function us nc to sent data to graphite server
	
	tmp=`which nc`
	if [[ $? ]]; then
		return
	fi

	local _PARAMS_COUNT="$#"
	local _DATE=`date +%s`
	local _SRV=`echo ${HOSTNAME}} | cut -d"." -f1`

	#__GRAPH_ROLE
	# to override default parameters export them in your script
	if [[ -z ${_GRAPH_ROLE} ]]; then
		_GRAPH_ROLE=`echo ${__SCRIPTNAME} | cut -d"." -f1`
	fi
	
	#script_name_tmp=`echo ${__SCRIPTNAME} | cut -d"." -f1`	
	if [[ -z ${_GRAPH_PORT} ]]; then
		_GRAPH_PORT="2003"
	fi
		
	if [[ -z ${_GRAPH_SERVER} ]]; then
		_GRAPH_SERVER="graph01-dall01.vpn.flrop.net"
	fi	

	_GRAPH_KEY="Scripts.${_GRAPH_ROLE}.${_SRV}"

	local regex='^[0-9]+$'

	if [[ $# < 1 ]]; then
		Warning_Msg "no parameter"
	fi

	while [[ $# > 1 ]]
	do
		key="$1"
		case $key in
			-k|--key)
				_GRAPH_KEY=$2
				shift			
			;;	
			-v|--value)
				_GRAPH_VALUE=$2
				shift
			;;
			-s|--server)
				## DEPRICATED
				_SRV=$2
				shift
			;;
		    *)
		    	Error_Msg "wrong parameters"
		    	Info_Msg "EXAMPLE: Graphana_statistic.sh -k test -v 1234567890"	      		
		    ;;
		esac
		shift # past argument or value
	done
	if [[ -z ${_GRAPH_VALUE} ]]; then
		_GRAPH_VALUE=1
		Warning_Msg "Using default VALUE: == 1"
	fi	
	
	Command_Execution "echo ${_GRAPH_KEY} ${_GRAPH_VALUE} ${_DATE}| nc -w 1 ${_GRAPH_SERVER} ${_GRAPH_PORT}"
	
	return ${__EXIT_STATUS_SUCCESS}
}



# -----------------------------------------------------------------------------
##=Category: Flow Control | Kit_Init
##
##=Usage: Kit_Init $@
## 
##=Description
##		Define the basic variables (USER,HOME,HOST) if they are empty.
##      Print the global information about KSH Kit to the log.
##      
## 
##=Input Parameters
##=Parameter: $@ - get all the script parameters
##     
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##
##=Function Exported Variables
##=Exported Variable: __SCRIPT_INPUT_PARAMETERS - containes the all script parameters
##
##=Example
## 	...
## 	Kit_Init $@
## 	...
##
function Kit_Init
{
	typeset __FUNCTION="Kit_Init"; ${__FUNCTION_INIT}; ${__DEBUG_CODE}
	
	export  __SCRIPT_INPUT_PARAMETERS="$*"

	typeset EXIT_STATUS=${__EXIT_STATUS_SUCCESS}
	
	Check_Variable_Not_Empty USER
	if [[ $? -ne ${__EXIT_STATUS_SUCCESS} ]] 
	then
		Print_Kit_Msg "The USER variable is empty, set default value"
		export USER=`id | tr " " "\n" | grep "^uid" | cut -d"(" -f2 | cut -d")" -f1`
		Print_Kit_Msg "USER = [${USER}]"
	fi
	
	Check_Variable_Not_Empty HOST
	if [[ $? -ne ${__EXIT_STATUS_SUCCESS} ]] 
	then
		Print_Kit_Msg "The HOST variable is empty, set default value"
		export HOST=`hostname`
		Print_Kit_Msg "HOST = [${HOST}]"
	fi
	
	Check_Variable_Not_Empty HOME
	if [[ $? -ne ${__EXIT_STATUS_SUCCESS} ]] 
	then
		Print_Kit_Msg "The HOME variable is empty, set default value"
		export HOME=`grep "^${USER}:" /etc/passwd | cut -d: -f6`
		Print_Kit_Msg "HOME = [${HOME}]"
	fi
	
	Debug_Msg "The KSH Kit version is [$__KIT_VERSION]"
	#Info_Msg "The KSH Kit location is [$__KIT_VERSION]"
	Debug_Msg "The script command is [${__SCRIPT_PATH} ${__SCRIPT_INPUT_PARAMETERS}]"
	
	Debug_Msg "The script parameters values are:"
	typeset ARRAY_INDEX=0
	typeset TOTAL_SIZE_SCRIPT_PARAMATERS=${#__SCRIPT_PARAMETERS[@]}
	while [[ ${ARRAY_INDEX} -lt ${TOTAL_SIZE_SCRIPT_PARAMATERS} ]] 
	do
		CURRENT_SCRIPT_PARAMETER=${__SCRIPT_PARAMETERS[${ARRAY_INDEX}]}
		CURRENT_SCRIPT_PARAM_TYPE=`echo "${CURRENT_SCRIPT_PARAMETER}" | cut -d, -f2`
		if [[ ${CURRENT_SCRIPT_PARAM_TYPE} != "USAGE" ]] 
		then
			CURRENT_SCRIPT_PARAMETER_NAME=`echo "${CURRENT_SCRIPT_PARAMETER}" | cut -d, -f3`
			CURRENT_SCRIPT_PARAMETER_NAME_VALUE=`env | grep "^${CURRENT_SCRIPT_PARAMETER_NAME}=" | cut -d= -f2-`
			Debug_Msg "   ${CURRENT_SCRIPT_PARAMETER_NAME} = [${CURRENT_SCRIPT_PARAMETER_NAME_VALUE}]"
		fi
		ARRAY_INDEX=$(( ${ARRAY_INDEX} + 1 ))
	done
	
	Print_Kit_Msg "The script is running with below KSH Kit variables:"
	
	Print_Kit_Msg "The log variables:"
	Print_Kit_Msg "__LOGFILE       = [${__LOGFILE}]"
	Print_Kit_Msg "__LOG_DIRECTORY = [${__LOG_DIRECTORY}]"
	Print_Kit_Msg "__QUIET_MODE    = [${__QUIET_MODE}]"
	Print_Kit_Msg "__LOG_SEVERITY  = [${__LOG_SEVERITY}]\n"

	Print_Kit_Msg "The general variables:"
	Print_Kit_Msg "__TEMP_ROOT_DIR       = [${__TEMP_ROOT_DIR}]"
	Print_Kit_Msg "__TEMPFILE_PERMISSION = [${__TEMPFILE_PERMISSION}]"
	Print_Kit_Msg "__TEMPDIR_PERMISSION  = [${__TEMPDIR_PERMISSION}]"
	Print_Kit_Msg "__REMOTE_CONNECT_TYPE = [${__REMOTE_CONNECT_TYPE}]\n"
	
	Trace_Msg "The environment variables:"
	if [[ ${__LOG_SEVERITY} -le ${__LOG_TRACE_SEVERITY} ]] 
	then
		env |sed 's/^/    /g' >> "${__LOGFILE}"
	fi
	
	Trace_Msg "The running processes:"
	if [[ ${__LOG_SEVERITY} -le ${__LOG_TRACE_SEVERITY} ]] 
	then
		ps -fu ${USER} |sed 's/^/    /g' >> "${__LOGFILE}"
	fi
	
	__Exit_On_Failed_Flag ${EXIT_STATUS} "${__FUNCTION}"
	return ${EXIT_STATUS}
}

# -----------------------------------------------------------------------------
##=Category: XXXXXX | ${FUNCTION_NAME}
##
##=Usage: ${FUNCTION_NAME} XXXXXXXX
## 
##=Description
##		XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 
## 
##=Input Parameters
##=Parameter: xxxx - XXXXXXXXXXXXXXXXXX 
##     
##=Function Exit Status
##=Exit Status: __EXIT_STATUS_SUCCESS - Success
##=Exit Status: __EXIT_STATUS_WRONG_FUNCTION_USE - Wrong function usage
##=Exit Status: __EXIT_STATUS_FAILED - Failed
##
##=Function Exported Variables
##=Exported Variable: xxx - XXXXXXXXXXXX
##
##=Function STDOUT: xxxxxxxxxxxxxxxxxxx
##
##=Example
## 	...
## 	${FUNCTION_NAME} XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
## 	...
##

# --------------- Initialization --------------
if [[ ! -d ${__LOG_DIRECTORY} ]] 
then
	mkdir -p "${__LOG_DIRECTORY}"
fi

if [[ "$1" = "-l" || "$1" = "--list" ]] 
then
	echo "Available Functions are:"
	cat $0 | grep "^function" |awk '{ print $2}'
	exit 0
fi
