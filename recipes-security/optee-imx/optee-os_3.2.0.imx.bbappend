SRCBRANCH = "lf-5.4.y"
OPTEE_OS_SRC ?= "git://source.codeaurora.org/external/imx/imx-optee-os.git;protocol=https"
SRC_URI = "${OPTEE_OS_SRC};branch=${SRCBRANCH} file://optee.patch"
SRCREV = "6d99b525af752ecdaabdca6098b2564b2665f2b2"

PLATFORM_FLAVOR_mx8qm = "mx8qm_iwg27m"

EXTRA_OEMAKE_remove = "CFG_SECURE_DATA_PATH=y \
                       CFG_TEE_SDP_MEM_BASE=0xCC000000 \
                       CFG_TEE_SDP_MEM_SIZE=0x02000000 \
                       CFG_TEE_SDP_NONCACHE=y \
                      "
