# A 'virtualenvwrapper-style' extensions for nodeenv.
# see: https://github.com/ekalinin/nodeenv
# see: http://www.doughellmann.com/projects/virtualenvwrapper/
# see: https://github.com/pypa/virtualenv

# Copyright 2012 Aubrey Taylor 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# see: http://github.com/aubricus/nodeenvwrapper for documentation and notes.

# mknodenv
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

# workon_nodeenv
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

# rmnodeenv
# remove nodeenv
# takes param $env_name, e.g. 'rmnodeenv my_env'
rmnodeenv(){
	node_env=$1
	rm -r "$NODEENV_HOME$node_env"
}

# cdnodeenv
# change dir to node environment root
# takes param $env_name, e.g. 'cdnodeenv my_env'
cdnodeenv(){
	node_env=$1
	cd "$NODEENV_HOME$node_env"
}

# lsnodeenv
# list node envs
# lists home dir contents, probably not the best ever but works (mostly)
lsnodeenv(){
	ls "$NODEENV_HOME"
}
