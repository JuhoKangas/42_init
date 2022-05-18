# Write a script which displays only the login, UID and Path of each etry of the /etc/passwd file.
# /etc/passwd has fields of username, encrypted password, UID, GID, Full name of the user, Home dir, shell

awk -F: '{printf"%-25s%-12s%-12s\n", $1,$3,$6}' /etc/passwd

# We can easily format the output with printf to look nicer and more readable
