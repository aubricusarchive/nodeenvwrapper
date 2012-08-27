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

# NOTE: I did not write nodeenv, this is just a simple util to improve
# it's workflow.

# NOTE: Doug Hellmann's virtualenvwrapper is well written and well tested
# across many shells and environments. This code is not. I run this
# in bash on my OSX machine running Lion (OSX 10.7.4). As such
# this code may fail miserably for you. Feel free to fork / pull
# request if you like! 

# NOTE: In general this follows the same conventions as virtualenvwrapper.
# Unlike virtualenvwrapper however there are no real safeguards / 
# checks when this thing is modifying your folder structure. I've
# tried to keep the below clean but my shell scripting is only so-so.
# PLEASE USE CAUTION when running these utility methods!

# NOTE: Running this with virtualenv and / or virtualenvwrapper? Some weird
# things can happen when activating / deactivating nodeenv and virtualenv
# environments when working in the same terminal session. I've found
# it beneficial to run your virtualenv and nodeenv in separate
# terminal windows.

# SETUP: Pretty straightforward, in a .profile / .bashrc / .bash_profile
# which ever you prefer add the following lines:
#
#	export NODEENVWRAPPER_SCRIPT=/path/to/nodeenvwrapper.sh
#	export NODEENV_HOME=$HOME/.nodeenv
#	source NODEENVWRAPPER_SCRIPT
#
# That should get it working, though you may need to restart your
# terminal session depending on your setup.

# USEFUL ALIASES:
#	alias mknenv='mknodeenv $1'
#	alias rmnenv='rmnodeenv $1'
#	alias chnenv='workon_nodeenv $1'
#	alias dnenv='deactivate_node'

# Thanks to Doug Hellmann for the inspiration here, Ian Bicking for
# virtualenv and Eugene Kalinin for writing nodeenv!

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
