################################################################
# <bsn.cl fy=2013 v=onl>
# 
#     Copyright 2013, 2014, 2015 Big Switch Networks, Inc.    
# 
# Licensed under the Eclipse Public License, Version 1.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
# 
#        http://www.eclipse.org/legal/epl-v10.html
# 
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific
# language governing permissions and limitations under the
# License.
# 
# </bsn.cl>
################################################################

#
# The root of of our repository is here:
#
ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

#
# Resolve submodule dependencies.
#
ifndef SUBMODULE_INFRA
  ifdef SUBMODULES
    SUBMODULE_INFRA := $(SUBMODULES)/infra
  else
    SUBMODULE_INFRA := $(ROOT)/submodules/infra
  endif
endif

ifndef SUBMODULE_BIGCODE
  ifdef SUBMODULES
    SUBMODULE_BIGCODE := $(SUBMODULES)/bigcode
  else
    SUBMODULE_BIGCODE := $(ROOT)/submodules/bigcode
  endif
endif

export SUBMODULE_INFRA
export BUILDER := $(SUBMODULE_INFRA)/builder/unix

MODULE_DIRS := $(ROOT)/modules $(SUBMODULE_INFRA)/modules $(SUBMODULE_BIGCODE)/modules

.show-submodules:
	@echo infra @ $(SUBMODULE_INFRA)
	@echo bigcode @ $(SUBMODULE_BIGCODE)

#
# These are the subdirectories in the current directory
#
ifdef MAKESUBDIRS
ifndef SUBDIRS
SUBDIRS=$(patsubst %/,%, $(wildcard */))
endif
makesubdirs $(MAKECMDGOALS):
	@$(foreach d,$(SUBDIRS), test ! -f $(d)/Makefile || $(MAKE) -C $(d) $(MAKECMDGOALS) || exit 1;)
endif












