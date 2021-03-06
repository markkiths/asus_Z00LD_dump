#!/system/bin/sh

#RF SKU   |   Value
#------------------
#TW/JP    |   4
#------------------
#WW       |   5
#------------------
#CUCC     |   6
#------------------
#CMCC     |   7
#------------------
#3G       |   3
#------------------
#err      |   NULL
#------------------
                  

# H/W ID
HWID_DETECT=$(cat /proc/aprf)

if [ "$HWID_DETECT" == "" ]; then
   setprop rf.sku.id "err"
else
   setprop rf.sku.id "$HWID_DETECT"
fi
   echo "$(getprop rf.sku.id)"
