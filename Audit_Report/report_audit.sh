# Log Time Range Report
aureport -t

# Generate Login Report
echo ""
echo "Failed Login Report in 30 days"
echo "============================================"
ausearch -m USER_LOGIN --success no --format text -ts $(date +%m/%d/%Y --date="-30 days")

# Generate Login Report with ip address
aureport -l -i -ts $(date +%m/%d/%Y --date="-30 days")

# Generate Account Modification Report
# ADD_GROUP - Triggered when a user-space group is added.
# ADD_USER - Triggered when a user-space user account is added.
# CHGRP_ID - Triggered when a user-space group ID is changed.
# CHUSER_ID - Triggered when a user-space user ID is changed.
# DEL_GROUP - Triggered when a user-space group is deleted
# DEL_USER - Triggered when a user-space user is deleted
# USER_MGMT - Triggered to record user-space management data.
echo ""
echo "Account Modification Report in 30 days"
echo "============================================"
ausearch -m ADD_GROUP,ADD_USER,CHGRP_ID,CHUSER_ID,DEL_GROUP,DEL_USER,USER_MGMT --format text -ts $(date +%m/%d/%Y --date="-30 days")

# Generate Abnormal Login Record"
echo ""
echo "Abnormal Login Report in 30 days"
echo "============================================"
ausearch -m ANOM_LOGIN_FAILURES,ANOM_LOGIN_TIME,ANOM_LOGIN_SESSIONS,ANOM_LOGIN_ACCT,ANOM_LOGIN_LOCATION --format text -ts $(date +%m/%d/%Y --date="-30 days")
