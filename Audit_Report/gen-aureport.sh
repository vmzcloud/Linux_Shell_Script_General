#Create aureport Folder if not exist
if [ ! -d "/var/log/sa/aureport" ]
then
        mkdir -p /var/log/sa/aureport
fi

#Report_date
rpt_date=$(date +%Y%m --date="-1 month")

#Start_date
Start_date=$(date +%m/%d/%Y --date="-1 month")

#End_date
End_date=$(date +%m/%d/%Y --date="-1 day")

#Login Report file
Login_Rpt_File="/var/log/sa/aureport/aureport_${rpt_date}_login_rpt.txt"

#Login Report text file
Login_Text_Rpt_File="/var/log/sa/aureport/aureport_${rpt_date}_login_text_rpt.txt"

#Account Modification Report File
Acct_Mod_Rpt_File="/var/log/sa/aureport/aureport_${rpt_date}_acct_mod_rpt.txt"

# Generate login report
/sbin/aureport -l -i --input-logs -ts $Start_date -te $End_date > $Login_Rpt_File

# Generate login report in text format
echo "Login Report $rpt_date" >> $Login_Text_Rpt_File
echo "============================================" >> $Login_Text_Rpt_File
/sbin/ausearch -m USER_LOGIN --format text --input-logs -ts $Start_date -te $End_date >> $Login_Text_Rpt_File

# Generate Account Modification Report
# ADD_GROUP - Triggered when a user-space group is added.
# ADD_USER - Triggered when a user-space user account is added.
# CHGRP_ID - Triggered when a user-space group ID is changed.
# CHUSER_ID - Triggered when a user-space user ID is changed.
# DEL_GROUP - Triggered when a user-space group is deleted
# DEL_USER - Triggered when a user-space user is deleted
# USER_MGMT - Triggered to record user-space management data.
echo "Account Modification Report $rpt_date" >> $Acct_Mod_Rpt_File
echo "============================================" >> $Acct_Mod_Rpt_File
/sbin/ausearch -m ADD_GROUP,ADD_USER,CHGRP_ID,CHUSER_ID,DEL_GROUP,DEL_USER,USER_MGMT --format text --input-logs -ts $Start_date -te $End_date >> $Acct_Mod_Rpt_File
