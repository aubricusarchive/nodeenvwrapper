nodeenvwrapper
==============
###A 'virtualenvwrapper-style' extensions for nodeenv.

see: https://github.com/ekalinin/nodeenv

see: http://www.doughellmann.com/projects/virtualenvwrapper/

see: https://github.com/pypa/virtualenv

###Setup:
Pretty straightforward, clone the repository
`git clone https://github.com/aubricus/nodeenvwrapper.git $HOME/.nodeenvwrapper`

and in a .profile or .bashrc or .bash_profile add the following lines:
```
export NODEENV_HOME=$HOME/.nodeenv
source /path/to/nodeenvwrapper.sh
```
That should get it working, though you may need to restart your terminal session depending on your setup.

###Aliases that I've found useful:
Put these in your .profile or .bashrc or .bash_profile
```
alias mknenv='mknodeenv $1'
alias rmnenv='rmnodeenv $1'
alias chnenv='workon_nodeenv $1'
alias dnenv='deactivate_node'
```
###Notes:
I did not write nodeenv, this is just a simple util to improve it's workflow.

Doug Hellmann's virtualenvwrapper is well written and well tested across many shells and environments. This code is not. I run this in bash on my OSX machine running Lion (OSX 10.7.4). As such this code may fail miserably for you. Feel free to fork / pull request if you like!

In general this follows the same conventions as virtualenvwrapper.Unlike virtualenvwrapper however there are no real safeguards / checks when this thing is modifying your folder structure. I've tried to keep the below clean but my shell scripting is only so-so. PLEASE USE CAUTION when running these utility methods!

Running this with virtualenv and / or virtualenvwrapper? Some weird things can happen when activating / deactivating nodeenv and virtualenv environments when working in the same terminal session. I've found it beneficial to run your virtualenv and nodeenv in separate terminal windows.

###Thanks to Doug Hellmann for the inspiration here, Ian Bicking for virtualenv and Eugene Kalinin for nodeenv!

###License:
Copyright 2012 aubricus https://github.com/aubricus/nodeenvwrapper

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.