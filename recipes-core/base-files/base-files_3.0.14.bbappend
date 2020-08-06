DISTRO_NAME = "NXP i.MX Release "
DISTRO_VERSION = "L5.4.3_1.0.0"

G27_BSP_VERSION = "\r Rootfs Version : iW-PRFHZ-SC-01-R4.0-REL1.0-YoctoZeus\n"
G27_HOST = "iWave-G27M"

do_install_basefilesissue () {
	if [ "${hostname}" ]; then
		echo ${hostname} > ${D}${sysconfdir}/hostname
	fi

	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
	if [ -n "${G27_BSP_VERSION}" ]; then
               printf "${G27_BSP_VERSION} " >> ${D}${sysconfdir}/issue
               printf "${G27_BSP_VERSION} " >> ${D}${sysconfdir}/issue.net
        fi
        if [ -n "${G27_HOST}" ]; then
               echo ${G27_HOST} > ${D}${sysconfdir}/hostname
        fi

        if [ -n "${DISTRO_NAME}" ]; then
		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
		if [ -n "${DISTRO_VERSION}" ]; then
			distro_version_nodate="${@d.getVar('DISTRO_VERSION').replace('snapshot-${DATE}','snapshot').replace('${DATE}','')}"
			printf "%s " $distro_version_nodate >> ${D}${sysconfdir}/issue
			printf "%s " $distro_version_nodate >> ${D}${sysconfdir}/issue.net
		fi
		printf "\\\n \\\l\n" >> ${D}${sysconfdir}/issue
		echo >> ${D}${sysconfdir}/issue
		echo "%h"    >> ${D}${sysconfdir}/issue.net
		echo >> ${D}${sysconfdir}/issue.net
 	fi
}
