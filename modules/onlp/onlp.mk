
###############################################################################
#
# Inclusive Makefile for the onlp module.
#
# Autogenerated 2016-12-11 15:35:35.369404
#
###############################################################################
onlp_BASEDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(onlp_BASEDIR)module/make.mk
include $(onlp_BASEDIR)module/auto/make.mk
include $(onlp_BASEDIR)module/src/make.mk
include $(onlp_BASEDIR)utest/_make.mk
