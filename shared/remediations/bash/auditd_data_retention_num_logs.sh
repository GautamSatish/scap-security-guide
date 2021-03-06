# platform = multi_platform_rhel
source ./templates/support.sh
populate var_auditd_num_logs

AUDITCONFIG=/etc/audit/auditd.conf

grep -q ^num_logs $AUDITCONFIG && \
  sed -i 's/^num_logs.*/num_logs = '"$var_auditd_num_logs"'/g' $AUDITCONFIG
if ! [ $? -eq 0 ]; then
  echo "num_logs = $var_auditd_num_logs" >> $AUDITCONFIG
fi
