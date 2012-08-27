# make nodeenv
# takes param $node_env, e.g. 'mknodeenv my_env'
# only supports basic optionless call to nodeenv for the moment
mknodeenv(){
	node_env=$1
	
	type deactivate_node >/dev/null 2>&1

	if [ $? -eq 0 ]; then	
		deactivate_node
	fi

	nodeenv "$NODEENV_HOME$node_env"
	workon_nodeenv $node_env
}

# activate nodeenv
# takes param $env_name, e.g. 'workon_nodeenv my_env'
workon_nodeenv(){
	node_env=$1
	
	type deactivate_node >/dev/null 2>&1	
	
	if [ $? -eq 0 ]; then
		deactivate_node
	fi
	
	source "$NODEENV_HOME$node_env/bin/activate"
}

# remove nodeenv
# takes param $env_name, e.g. 'rmnodeenv my_env'
rmnodeenv(){
	node_env=$1
	rm -r "$NODEENV_HOME$node_env"
}

# change dir to node environment root
# takes param $env_name, e.g. 'cdnodeenv my_env'
cdnodeenv(){
	node_env=$1
	cd "$NODEENV_HOME$node_env"
}

# list node envs
# lists home dir contents, probably not the best ever but works
lsnodeenv(){
	ls "$NODEENV_HOME"
}
