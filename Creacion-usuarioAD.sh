#!/bin/bash

#display_name="Maria Patricia"
#password="MpMonsalve.1234"
#user_principal_name="maria-patricia@greg8408hotmail.onmicrosoft.com"

# Prompt the user for the display name
read -p "Enter display name: " display_name

# Prompt the user for the password (you might want to implement password validation here)
read -p "Enter password: " password

# Combine display name with the domain to create the user principal name
user_principal_name="$display_name@greg8408hotmail.onmicrosoft.com"

# Use the entered values in the Azure AD user creation command
az ad user create --display-name "$display_name" --password "$password" --user-principal-name "$user_principal_name"