#
#	$Id$
#
# GU utility module Makefile
#
LIB=gu_util

CI_DISPLAYNAME?=gu_util			# short jenkins display name

ALL_TARGETS=host-local robot-local analyse

CATKIN_COMPILE_UTIL=YES

.include "../../mk/c++11.mk"   	    	# use C++11
.include "../../mk/util.mk"		# required for gu_util.h/.cc

all: all-real

.if ${LOCAL} != _LOCAL
host: host-local
	echo "Use 'make host-local' instead of 'make host'"

.ifndef TARGET
install: host-local
.else
install: cross-local
.endif
	mkdir -p -m 0755 ${DST:Q}/include
	mkdir -p -m 0755 ${DST:Q}/lib
	cd ${BUILDDIR}-local && \
	install -m 0755 *${SOEXT}* ${DST:Q}/lib
.for hdr in ${UTIL_HDRS}
	-cd ${UTIL_DIR} && \
	if [ -d ${hdr:Q} ]; then \
	  cp -pR ${hdr:Q} ${DST:Q}/include ;\
	else \
	  install -m 0644 ${hdr} ${DST:Q}/include ;\
	fi
.endfor
.endif

.ifdef TARGET
cross-install: install
.else
cross-install: cross-local
.  for rarch in ${ARCHS.${DEFAULT_TARGET}}
	$Eenv PATH=${TARGET_PATH.${DEFAULT_TARGET}:Q}                   \
                ${MAKE} ${MAKEFLAGS} TARGET=${DEFAULT_TARGET}           \
                BUILD_FLAGS=${TARGET_BUILD_FLAGS.${DEFAULT_TARGET}:Q}   \
                TARGET_PLATFORM=${rarch} ALL_TARGETS=cross-install
.  endfor
.endif

.include "../../mk/mipal.mk"		# comes last!
