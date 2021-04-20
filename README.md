# xnat_bash_utils

Skip to end of metadata

    Created by Mikhail Milchenko, last modified on Oct 11, 2018

Go to start of metadata

XTOLM is a local bash XNAT-aware console. This documentation provides a use case for exporting data computations in XNAT to an external spreadsheet.
Useful for:

    developing or running image processing locally in bash shell
    using XNAT as data source and/or remote archive in shell scripts
    automating processing of multiple XNAT sessions and to reporting results in spreadsheets
    focusing on local script development and minimizing programming effort to interact with XNAT

Installing XTOLM

XTOLM is installed on NRG cluster.  Set up your environment with NRG image analysis algorithms to use it.
Developing with XTOLM

Refer to use cases for examples of batch scripts written with xtolm:

    Compute whole brain volume and save statistics in a spreadsheet
    ESM-CT DBS contact localization and STN atlas pipeline

XTOLM Command Reference:

Online Commands: mostly, load/save scans, resources and metadata as resources from/to XNAT.
load_scans <id1>[,...]	load scan(s) to DICOM by ID to the processing dir
load_type <type>	load scan(s) DICOM of a given type to the processing dir
load_dir <dir1>[,...]	load resource dir(s) to the processing dir
load_file <fil1> [fil2..]	load resource file(s) to the processing dir
load_workspace	load context variables from XNAT session (stored under unique analysis ID)
save_workspace	

save context variables to XNAT session (stored under unique analysis ID)
save_dir <dir>	write resource dir to XNAT (overwrites existing)

   

Offline Commands: The purpose is to enable batch analyses. Each study is loaded into a separate directory and is processed within 'processing context': XNAT subject and experiment label. Each study directory can have DICOM, resource dirs, and some configuration files that store context information. Workspace is defined as all user-defined variables that should be saved as key-value pairs.
set_context <subject> <session>	set current context of subject and session
set_context <subject> <session> <context>	set current context when multiple contexts (variable namespaces) per session are allowed.
list_contexts	list of subcontexts within current context
del_context	delete a subcontext within current context
load_vars [var1] [,..]	load one or more variables saved in current context
save_vars [var1] [,..] 	save one or more variables to current context
load_data <filepath>	load a .csv or .xlsx file columns into bash arrays
xt_for <subject_field> [<session_field> [[start-end]]]	iterate over arrays populated by load_data; use start-end to control record range
summary <out_file> [sort_column]	 generate a comma-separated summary of existing contexts (match order in [column])
summary_mc <out_file>	summary when multiple session contexts were recorded
save_profile <label>	for fast access, save current server connection credentials in user directory
help                            	list console commands
quit                            	quit interactive console
Built-in varaiables (online mode only)
xt_server	https://my_xnat_server
xt_user	xnat_user
xt_pass                      	xnat_password
xt_project              	xnat_project
xt_subj	xnat_subject
xt_sess	xnat_experiment
Command Details

set_context: move to another processing dir that corresponds to another XNAT session, and load/init workspace variables for that session. Previously computed variables are loaded using this command.

save_vars: save local vars (name+value) to current context (context is saved in a file within processing dir or online in XNAT experiment).

load/save workspace: sync context variables with XNAT session (load/save to designated resource)

 

Script execution mode: the user writes a script which is interpreted by XTOLM, converted to a bash script and executed.

xtolm [options] <script file> [...]

Interactive mode : line-by-line command input.
Offline mode: all code that interacts with XNAT is ignored.
Debug mode
